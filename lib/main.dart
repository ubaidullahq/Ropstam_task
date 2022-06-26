import 'package:flutter/material.dart';
import 'package:job_task/screens/home_screen.dart';
import 'package:job_task/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String? userToken = '';
  late Future<bool> futureData;

  bool userCredentials = false;
  Future<bool> getAllSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userToken = prefs.getString("userToken");

    setState(() {
      if (userToken != null) {
        if (userToken!.isNotEmpty) {
          userCredentials = true;
        } else {
          userCredentials = false;
        }
      }
    });
    return userCredentials;
  }

  @override
  void initState() {
    futureData = getAllSavedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Root widget of app
    return MaterialApp(
      title: 'Ropstam_Login',
      // I've used future builder for getting session or token from the shared preferences so that ser can interact with the app
      home: FutureBuilder<bool>(
        future: futureData,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError) {
            final error = snapshot.error;
            return Text('$error');
          } else if (snapshot.hasData) {
            // getAllSavedData() function return boolean data for user session on the basis of that I've decided on which screen where user have to go.
            bool? data = snapshot.data;
            if (data == true) {
              return const HomeScreen();
            } else {
              return const LoginScreen();
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            // when data is still loading wait for response
            return const Scaffold(
              body: Center(
                child: Text(
                  'Please wait...',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text(
                  'Please restart the app',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            );
          }
        },
      ),

      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
      },
    );
  }
}
