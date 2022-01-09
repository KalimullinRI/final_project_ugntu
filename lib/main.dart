import 'package:final_project_ugntu/widgets/auth/auth_widget.dart';
import 'package:final_project_ugntu/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp (MyApp());
}

class MyApp extends StatelessWidget {
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
        '/': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(
        ),

    },
     initialRoute: '/',
    );
  }
}

