import 'package:flutter/material.dart';
import 'package:flutter_greetings/flutter_greetings.dart';
import 'package:flutterpraticletest/SqliteDatabase/db.dart';
import 'package:flutterpraticletest/SqliteDatabase/usernameItem.dart';
import 'package:flutterpraticletest/main.dart';
import 'package:flutterpraticletest/server/medicinedata.dart';
import 'package:flutterpraticletest/server/model/medicineDataModel.dart';
import 'package:flutterpraticletest/utils/dialog_widget.dart';
import 'package:flutterpraticletest/utils/loadingClass.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";
  List<Problems> problems = <Problems>[];

  @override
  void initState() {
    super.initState();
    getDatabase();
    MedicationsAPI(_Response, _Error);
  }

  _Response(List<Problems> problems1) {
    setState(() {
      problems = problems1;
    });
  }

  _Error(String error) {
    showDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.8),
        builder: (_) => DialogWidget(
              title: "" + error,
              button1: strings.get(12),
              onButton1Clicked: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return problems.isNotEmpty
        ? Scaffold(
            body: SafeArea(
              child: Container(
                  child: ListView(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              YonoGreetings.showGreetings(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 40.0),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              userName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 16.0),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(16),
                                  child: Text(
                                    strings.get(13),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: SizedBox(
                                          height: 200,
                                          child: Center(
                                              child: ListView.separated(
                                            physics: ScrollPhysics(),
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return SizedBox(
                                                height: 15,
                                              );
                                            },
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: problems
                                                .first
                                                .diabetes
                                                .first
                                                .medications
                                                .first
                                                .medicationsClasses
                                                .first
                                                .className
                                                .first
                                                .associatedDrug
                                                .length,
                                            itemBuilder: (context, index) =>
                                                GestureDetector(
                                              key: Key(index.toString()),
                                              onTap: () {
                                                setState(() {
                                                  // controller.jumpToPage(index);
                                                });
                                              },
                                              child: Container(
                                                child: Column(children: [
                                                  Center(
                                                    child: Text(
                                                      strings.get(14) +
                                                          problems
                                                              .first
                                                              .diabetes
                                                              .first
                                                              .medications
                                                              .first
                                                              .medicationsClasses
                                                              .first
                                                              .className
                                                              .first
                                                              .associatedDrug[
                                                                  index]
                                                              .name,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      strings.get(15) +
                                                          problems[index]
                                                              .diabetes[index]
                                                              .medications[
                                                                  index]
                                                              .medicationsClasses[
                                                                  index]
                                                              .className[index]
                                                              .associatedDrug[
                                                                  index]
                                                              .dose,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      strings.get(16) +
                                                          problems[index]
                                                              .diabetes[index]
                                                              .medications[
                                                                  index]
                                                              .medicationsClasses[
                                                                  index]
                                                              .className[index]
                                                              .associatedDrug[
                                                                  index]
                                                              .strength,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  // -----------

                                                  Container(
                                                    margin: EdgeInsets.all(16),
                                                    child: Text(
                                                      strings.get(17),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      strings.get(14) +
                                                          problems[index]
                                                              .diabetes[index]
                                                              .medications[
                                                                  index]
                                                              .medicationsClasses[
                                                                  index]
                                                              .className[index]
                                                              .associatedDrug2[
                                                                  index]
                                                              .name,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  Center(
                                                      child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      strings.get(15) +
                                                          problems[index]
                                                              .diabetes[index]
                                                              .medications[
                                                                  index]
                                                              .medicationsClasses[
                                                                  index]
                                                              .className[index]
                                                              .associatedDrug2[
                                                                  index]
                                                              .dose,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14),
                                                    ),
                                                  )),
                                                  Center(
                                                    child: Text(
                                                      strings.get(16) +
                                                          problems[index]
                                                              .diabetes[index]
                                                              .medications[
                                                                  index]
                                                              .medicationsClasses[
                                                                  index]
                                                              .className[index]
                                                              .associatedDrug2[
                                                                  index]
                                                              .strength,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                ]),
                                              ),
                                            ),
                                          )))),
                                )
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              )),
            ),
          )
        : LoadingView();
  }

//------------------------------------------------Get Username From SQLite Database-----------------------------
  Future<void> getDatabase() async {
    List<Map<String, dynamic>> _results = await DB.query(UserNameItem.table);
    var _tasks = _results.map((item) => UserNameItem.fromMap(item)).toList();
    for (int i = 0; i < _tasks.length; i++) {
      if (_tasks[i].username != null) {
        setState(() {
          userName = _tasks[i].username;
        });
      }
    }
  }
}
