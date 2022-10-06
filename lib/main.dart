import 'package:flutter/material.dart';
import 'package:new_flutter_project/Screens/dashboard.dart';
import 'package:new_flutter_project/Screens/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flutter_project/Utils/routs.dart';
import 'package:new_flutter_project/Widgets/themes.dart';

import 'Screens/cart_page.dart';
import 'Screens/form_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,

       theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),



      initialRoute:MyRoutes.dashBoardRoute,

      routes: {
        "/": (context) => DashBoard(),
        MyRoutes.homeRoute: (context) => HomeScreen(),
        MyRoutes.dashBoardRoute: (context) => DashBoard(),
        MyRoutes.myForm:(context) => MyForm(),
        MyRoutes.cartRoute:(context) => CartPage(),
        // "/dashBoard" : (context) => DashBoard(),
        // "/home" : (context) => HomeScreen(),
      },
    );
  }
}
