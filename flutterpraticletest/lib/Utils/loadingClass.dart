import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Container(
        color: Colors.transparent,
        height: 120.0,
        width: 200.0,
        child: Card(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                // color: Color.fromRGBO(232, 150, 50, 1),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Loading...',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

}