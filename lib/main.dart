import 'package:flutter/material.dart';
import 'package:handzz/constants.dart';
import 'package:handzz/cash_helper.dart';
import 'package:handzz/dio_helper.dart';
import 'package:handzz/on_porder/on_porder_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  dioHelper.int();
  await cacheHelper.init();
  dynamic onBoarding = cacheHelper.getData(key:'onBoarding');
  token = cacheHelper.getData(key:'token');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnBorderScreen() // replace with the name of your main screen file
    );
  }
}
