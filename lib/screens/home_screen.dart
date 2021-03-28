import 'package:demo/models/user_list_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'details_screen.dart';

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
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              return userList(context, snapshot.data);
          }
        });
  }

  Widget userList(BuildContext context, List<UserListViewModel> users) {
    return ListView(
      children: users
          .map((user) => GestureDetector(
                key: Key(user.id.toString()),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailScreen(user.id)),
                  )
                },
                child: Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name),
                        Text(user.phone),
                        Text(user.companyName),
                        Text(user.website),
                        Icon(Icons.star, color: user.star ? Colors.yellow : Colors.grey),
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
