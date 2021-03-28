import 'package:demo/models/user_list_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _body());
  }

  Widget _body() {
    return StreamBuilder<List<UserListViewModel>>(
        stream: UserListViewModel.usersStream,
        builder: (context, snapshot) {
          return userList(snapshot.data);
        });
  }

  Widget userList(List<UserListViewModel> users) {
    return ListView(
      children: users
          .map((e) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(e.name),
                      Text(e.phone),
                      Text(e.companyName),
                      Text(e.website),
                      Icon(Icons.star,
                          color: e.star ? Colors.yellow : Colors.grey),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
