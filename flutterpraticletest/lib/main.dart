import 'package:flutter/material.dart';
import 'package:flutterpraticletest/LoginScreen/login_page.dart';
import 'package:flutterpraticletest/SqliteDatabase/db.dart';
import 'package:flutterpraticletest/utils/Strings.dart';

Lang strings = Lang();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: strings.get(0),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
