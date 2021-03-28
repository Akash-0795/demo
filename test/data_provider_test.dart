import 'package:test/test.dart';

import '../lib/service/data_provider.dart';

void main() {
  final dataProvider = DataProvider.sharedInstance;
  test('Fetch User Test', () async {
    await dataProvider.fetchUsers();
    expect(dataProvider.users != null, true);
    expect(dataProvider.users.length > 0, true);
  });

  test('Get User By ID Test', () async {
    var user = dataProvider.getUser(1);
    expect(user != null, true);
    expect(user.id == 1, true);
  });

  test('Update User Test', () async {
    dataProvider.updateUser(1);
    var user = dataProvider.getUser(1);
    expect(user.star, true);
  });
}
