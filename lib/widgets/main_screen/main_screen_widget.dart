import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();

}


List<User> userList = [];

class _MainScreenWidgetState extends State<MainScreenWidget> {


  Future<List<User>> getUser()async{

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data ){
        User user = User(id: i ['id'], name: i['name'], email: i['email']);
        userList.add(user);
      }
      return userList;
    }else{
      return userList;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Список пользователей'),),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUser(),
                builder: (context,AsyncSnapshot<List<User>> snapshot ){
                  return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data![index].name.toString()),
                              Text(snapshot.data![index].email.toString()),
                            ],
                          ),
                          subtitle: Text('ID:'+snapshot.data![index].id.toString()),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}





class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;


  User(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.phone,
        this.website,
      });

}