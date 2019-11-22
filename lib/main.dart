import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wooftoc/src/page/AddNewPage.dart';
import 'package:wooftoc/src/page/FrequentQuestionPage.dart';
import 'package:wooftoc/src/page/LoginPage.dart';
import 'package:wooftoc/src/page/PetsPage.dart';
import 'package:wooftoc/src/page/PrincipalPage.dart';
import 'package:wooftoc/src/page/RegisterPage.dart';
import 'package:wooftoc/src/page/experiencePage.dart';
import 'package:wooftoc/src/provider/addpet/AddpetProvider.dart';
import 'package:wooftoc/src/provider/login/LoginProvider.dart';
import 'package:wooftoc/src/provider/register/registerProvider.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => RegisterProvider()
        ),
        ChangeNotifierProvider(
          builder: (_) => LoginProvider()
        ),
        ChangeNotifierProvider(
          builder: (_) => AddpetProvider()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Woof Toc',
        initialRoute: 'login',
        routes: {          
          'login' : (context) => LoginPage(),
          'register' : (context) => RegisterPage(),
          'principal' : (context) => PrincipalPage(),
          'pets' : (context) => PetsPage(),
          'newpet' : (context) => NewpetPage(),
          'frequentquestion' : (context) => FrequentQuestionPage(),
          'experiences' : (context) => ExperiencePage(),
        },
      ),
    );
  }
}