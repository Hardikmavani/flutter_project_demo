import 'package:flutter/material.dart';
import 'package:flutter_project_demo/core/store.dart';
import 'package:flutter_project_demo/pages/cart_page.dart';
import 'package:flutter_project_demo/pages/home_page.dart';
import 'package:flutter_project_demo/pages/login_page.dart';
import 'package:flutter_project_demo/utils/routes.dart';
import 'package:flutter_project_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyRoutes.homeRoute,
      routes: {
        '/': (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => const CartPage()
      },
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      themeMode: ThemeMode.system,
    );
  }
}
