import 'package:flutter/material.dart';

class GridTwo extends StatefulWidget {
  GridTwo({Key key}) : super(key: key);

  @override
  _GridTwoState createState() => _GridTwoState();
}

class _GridTwoState extends State<GridTwo> {
  int index = 1;
  Color _iconColor = Colors.grey[800];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          children: List.generate(6, (index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.grey[100],
              elevation: 10,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Week $index",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: IconButton(
                          icon: Icon(
                            Icons.assignment_turned_in,
                            color: _iconColor,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              _iconColor = Colors.purple[500];
                            });
                          }),
                    )
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}
