import 'package:calender/condroler/provider.dart';
import 'package:calender/pages/Home_screen/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: 
    ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      child: 
      Calender(),
    ),
    
  )
  );
}
