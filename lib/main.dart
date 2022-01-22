import 'package:final_project_ugntu/main_screen.dart';
import 'package:final_project_ugntu/widgets/auth/auth_widget.dart';
import 'package:flutter/material.dart';


void main() {
  runApp (const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(3, 37, 65, 1)
        ),
      ),
      routes: {
        '/': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreen(),

      },
      initialRoute: '/',
    );
  }
}

