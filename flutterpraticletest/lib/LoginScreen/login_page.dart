import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpraticletest/HomeScreen/HomePage.dart';
import 'package:flutterpraticletest/SqliteDatabase/db.dart';
import 'package:flutterpraticletest/main.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Image.asset(
                'assets/images/profile.png',
                height: 200,
                width: 200,
              ),
            ),
            Form(
              key: _formKey,
              child: Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        strings.get(1),
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                // icon: Icon(Icons.mail),
                                prefixIcon: Icon(Icons.lock),
                                hintText: strings.get(2),
                                labelText: strings.get(3),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1))),
                            validator: MultiValidator([
                              RequiredValidator(errorText: strings.get(4)),
                              EmailValidator(errorText: strings.get(5)),
                            ])),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                // icon: Icon(Icons.mail),
                                prefixIcon: Icon(Icons.lock),
                                hintText: strings.get(6),
                                labelText: strings.get(7),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1))),
                            validator: MultiValidator([
                              RequiredValidator(errorText: strings.get(8)),
                              MinLengthValidator(6, errorText: strings.get(9)),
                              MaxLengthValidator(15, errorText: strings.get(10))
                            ])),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                          key: Key("btnLogin"),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              DB.insertUserName(emailController.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomePage()));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Text(strings.get(11)),
                          ))
                    ],
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
