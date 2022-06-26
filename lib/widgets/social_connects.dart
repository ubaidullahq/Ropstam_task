import 'package:flutter/material.dart';

class SocialConnects extends StatelessWidget {
  const SocialConnects({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        height: 30,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Image.asset(imagePath),
      ),
    );
  }
}
