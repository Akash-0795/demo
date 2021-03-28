import 'package:demo/models/user_detail_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
    this.userID, {
    Key key,
  }) : super(key: key);

  final int userID;

  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  UserDetailViewModel user;
  @override
  void initState() {
    user = UserDetailViewModel.getUserDetails(widget.userID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(user.name),
        SizedBox(height: 5),
        Text(user.username),
        SizedBox(height: 5),
        Text(user.phone),
        SizedBox(height: 5),
        Text(user.address),
        SizedBox(height: 5),
        Text(user.companyDetails),
        SizedBox(height: 5),
        Text(user.website),
        SizedBox(height: 5),
        Icon(Icons.star, color: user.star ? Colors.yellow : Colors.grey),
      ],
    );
  }
}
