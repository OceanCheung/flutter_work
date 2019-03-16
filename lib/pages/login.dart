import 'package:flutter/material.dart';
import './home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('提交'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset(
                "lib/assets/local/login/logo.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 240,
              ),
            ),
            Container(
              child: Text('登录页面'),
            ),
            Container(
                alignment: Alignment.center,
                child: Material(
                  color: Colors.blue,
                  child: Ink(
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 30.0, top: 10.0, right: 30.0, bottom: 10.0),
                        child: Text('登录'),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => HomePage()));
                      },
                    ),
                  ),
                ))
          ],
        ));
  }
}
