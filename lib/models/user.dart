// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class User extends Model {
  String _name = 'John Doe';

  String get name => _name;

  void changeName(String name) {
    _name = name;
    notifyListeners();
  }
}
