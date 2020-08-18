import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Card {
  final String day;
  final iconSrc;
  final Function press;

  Card({
    this.day,
    this.iconSrc,
    this.press,
  });
}

final cards = [
  Card(day: "Day 01", iconSrc: Icon(Icons.check_circle_outline), press: () {}),
  Card(day: "Day 01", iconSrc: Icon(Icons.check_circle_outline), press: () {}),
  Card(day: "Day 01", iconSrc: Icon(Icons.check_circle_outline), press: () {}),
  Card(day: "Day 01", iconSrc: Icon(Icons.check_circle_outline), press: () {}),
  Card(day: "Day 01", iconSrc: Icon(Icons.check_circle_outline), press: () {}),
  Card(day: "Day 01", iconSrc: Icon(Icons.check_circle_outline), press: () {}),
  Card(day: "Day 01", iconSrc: Icon(Icons.check_circle_outline), press: () {}),
];
