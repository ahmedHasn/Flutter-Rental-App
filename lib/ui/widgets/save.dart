import 'package:flutter/material.dart';

class SaveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
                child: Text('DaLLiSo App',
                    style: TextStyle(color: Colors.indigoAccent))),
            backgroundColor: Colors.white),
        body: Column(
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(top: 80.0),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        "Under Construct",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.tag_faces),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
