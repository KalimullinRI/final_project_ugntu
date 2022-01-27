import 'package:final_project_ugntu/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Страница авторизации')),
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatefulWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<_HeaderWidget> {
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: const [
          _FormWidget(),
        ],
      ),
    );
  }
}


class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == '9123456789' && password == 'admin') {
      errorText = null;

      Navigator.of(context).pushNamed('/main_screen');

    } else {
      errorText = 'Неверный логин или пароль';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
        fontSize: 16, color: Colors.black);
    final textFielDecorator = const InputDecoration(
      border: OutlineInputBorder(),
      focusedBorder:OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(3, 37, 65, 1), width: 2.0)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      isCollapsed: true,
    );


    final errorText = this.errorText;
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50,),
        Text('Введите 10 цифр номера телефона', style: textStyle),
        const SizedBox(height: 5,),
        TextField(
            controller: _loginTextController,
            decoration: textFielDecorator,
            keyboardType:
            TextInputType.phone,
        ),
        const SizedBox(height: 25,),
        Text('Введите пароль', style: textStyle),
        const SizedBox(height: 5,),
        TextField(
            controller: _passwordTextController,
            decoration: textFielDecorator,
            obscureText: true),
        const SizedBox(height: 50,),
        if(errorText !=null) Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(errorText, style: TextStyle(fontSize: 16, color: Colors.red) ,),
        ),
        ElevatedButton(onPressed: _auth,
          child: Text('Войти'), style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(3, 37, 65, 1)),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              textStyle: MaterialStateProperty.all
                (TextStyle(fontSize: 16)),
              padding: MaterialStateProperty.all
                (EdgeInsets.symmetric(horizontal: 15, vertical: 8))
          ),
        ),
      ],
    );
  }
}
