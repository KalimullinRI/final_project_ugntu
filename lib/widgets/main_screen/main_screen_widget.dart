import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Users.dart';



class DetailPage extends StatefulWidget {
  final User user;
  const DetailPage({Key? key, required this.user}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();

}

class _DetailPageState extends State<DetailPage> {
  Future<List<Todo>> fetchTodos() async {
    var response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/todos?userId=' +
            widget.user.id.toString()));

    if (response.statusCode == 200) {
      return List<Todo>.from(
          jsonDecode(response.body).map((user) => Todo.fromJson(user)));
    } else {
      throw Exception(
          'Failed to load'
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Задачи ${widget.user.name}'),
      ),

      body: Column(
        children: [
          Expanded(
            child: Container(
              child: FutureBuilder(
                future: fetchTodos(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Todo>> snapshot)  {
                  if (snapshot.hasData) {
                    return ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text('Подробнее о пользователе: '),
                              const SizedBox(height: 5,),
                              Text('Полное имя: ${widget.user.name}' '${widget
                                  .user.username}'),
                              Text('Телефон: ${widget.user.phone}'),
                              Text('Сайт: ${widget.user.website}'),
                              Text(
                                  'Адрес: ${widget.user.address.getAddress()}'),
                              Text('Название компании: ${widget.user.company
                                  .getCompany()}'),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          child: const Center(
                            child: Text('Задачи', style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),),
                          ),
                        ),
                          for (var item in snapshot.data!)
                          Card(
                            elevation: 1,
                            child: ListTile(
                              onTap: () {},
                              title: Text(item.title),
                              trailing:
                              Checkbox(
                                checkColor: Color(0xFF03203e),
                                value: item.completed, onChanged: null,
                              ),
                            ),
                          )
                      ],
                    );
                  }
                  },
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children: [
        DrawerHeader(
        decoration: const BoxDecoration(
        color: Color.fromRGBO(3, 37, 65, 1),
      ),
      child: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.0))
              ),
              child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/220px-Google-flutter-logo.svg.png'),
            ),
          ],
        ),
      ),
    ),
  ]
    ),
    ),
    );

  }
}


