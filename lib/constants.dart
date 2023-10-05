
import 'package:flutter/material.dart';
import 'package:handzz/login/login_screen.dart';
import 'package:handzz/cash_helper.dart';

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
String? token = '';

void signOut (context)
{
  cacheHelper.removeData(Key: 'token').then((value) {
    if (value)
    {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
            (Route<dynamic> route) => false,
      );
    }
  });
}