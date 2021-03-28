import 'package:demo/models/user.dart';
import 'package:demo/service/data_provider.dart';

class UserDetailViewModel {
  User user;

  UserDetailViewModel({this.user});

  String get name {
    return user.name;
  }

  String get username {
    return user.username;
  }

  String get phone {
    return user.phone;
  }

  String get website {
    return user.website;
  }

  String get companyDetails {
    return '${user.company.name}(${user.company.catchPhrase})';
  }

  String get address {
    return '${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode}';
  }

  bool get star {
    return user.star;
  }

  set star(bool value) {
    DataProvider.sharedInstance.updateUser(user.id);
    user.star = value;
  }

  static UserDetailViewModel getUserDetails(int id) {
    return UserDetailViewModel(user: DataProvider.sharedInstance.getUser(id));
  }
}
