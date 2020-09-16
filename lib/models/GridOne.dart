import 'package:flutter/material.dart';

class GridOne extends StatefulWidget {
  GridOne({Key key}) : super(key: key);

  @override
  _GridOneState createState() => _GridOneState();
}

class _GridOneState extends State<GridOne> {
  int index = 1;
  Color _iconColor = Colors.grey[800];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          children: List.generate(30, (index) {
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
                        "DAY " + (index += 1).toString(),
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
