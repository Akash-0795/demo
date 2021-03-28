import 'package:demo/models/user.dart';
import 'package:demo/service/data_provider.dart';

class UserListViewModel {
  User user;
  UserListViewModel(this.user);

  int get id {
    return user.id;
  }

  String get name {
    return user.name;
  }

  String get phone {
    return user.phone;
  }

  String get website {
    return user.website;
  }

  String get companyName {
    return user.company.name;
  }

  bool get star {
    return user.star;
  }

  static Stream<List<UserListViewModel>> get usersStream {
    DataProvider.sharedInstance.fetchUsers();
    return DataProvider.sharedInstance.userStream.map((event) => event
        .map(
          (element) => UserListViewModel(element),
        )
        .toList());
  }
}
