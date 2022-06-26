import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_task/http_Requests/http_requests.dart';
import 'package:job_task/main.dart';
import 'package:job_task/models/data_mode.dart';
import 'package:job_task/widgets/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ModelClass> incomingDataList = [];
  bool _isLoading = true;

  @override
  void initState() {
    // function to get list of data from given API
    getList();
    super.initState();
  }

  void getList() async {
    //  getListData is a function to send get request to backend for data
    var response = await BackEndRequests.getListData();
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      log(response.body);
      setState(() {
        // when data fetch  model it using class named as ModelClass
        incomingDataList = (responseJson as List<dynamic>)
            .map((e) => ModelClass.fromObject(e))
            .toList();
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to fetch Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    // to get the full screen height and width
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'HomeScreen',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(5),
            child: TextButton(
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              onPressed: () async {
                // on pressing logout user token should be clear in the preferences so that user session would be clear
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                setState(() {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const MyApp()),
                      (route) => false);
                });
              },
            ),
          ),
        ],
      ),
      // UI for showing list
      body: !_isLoading
          ? SizedBox(
              height: heightOfScreen,
              width: widthOfScreen,
              child: ListView.builder(
                itemCount: incomingDataList.length,
                itemBuilder: (ctx, index) => ListTile(
                  isThreeLine: true,
                  leading: Text(incomingDataList[index].id.toString()),
                  title: Text(
                    incomingDataList[index].title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(incomingDataList[index].body),
                ),
              ),
            )
          : const WaitingDialog(),
    );
  }
}
