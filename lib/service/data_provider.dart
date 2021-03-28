import 'dart:async';
import 'dart:convert';

import 'package:demo/models/user.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  static DataProvider _instance;

  static DataProvider get sharedInstance {
    if (_instance == null) _instance = DataProvider();
    return _instance;
  }

  var _userStreamController = StreamController<List<User>>.broadcast();

  Sink get userStreamSink => _userStreamController;

  Stream<List<User>> get userStream => _userStreamController.stream;

  List<User> users;

  Future<void> fetchUsers() async {
    final url = "https://jsonplaceholder.typicode.com/users";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      users = body.map<User>((movie) => User.fromJson(movie)).toList();
      this.userStreamSink.add(users);
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  void updateUser(int id) {
    var user = users.firstWhere((element) => element.id == id);
    user.star = !user.star;
    userStreamSink.add(users);
  }

  User getUser(int id) {
    return users.firstWhere((element) => element.id == id);
  }

  void dispose() {
    _userStreamController.close();
  }
}
