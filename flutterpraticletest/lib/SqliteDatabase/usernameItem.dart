import 'package:flutterpraticletest/SqliteDatabase/model.dart';

class UserNameItem extends Model {

  static String table = 'user_name';
  String  username;

  UserNameItem({this.username});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'username': username,

    };
    return map;
  }

  static UserNameItem fromMap(Map<String, dynamic> map) {
    return UserNameItem(
      username: map['username'],

    );
  }

  @override
  String toString() => '$username';
}
