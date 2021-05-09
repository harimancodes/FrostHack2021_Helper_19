import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'widgets/login_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(Helper19());
}

class Helper19 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Personal Expenses",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
        ),
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
