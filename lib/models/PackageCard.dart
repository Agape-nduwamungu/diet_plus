import 'package:flutter/material.dart';

class PackageCard {
  final int id;
  final String title, description, imgeSrc;
  final Color color;

  PackageCard(
      {this.id, this.title, this.description, this.imgeSrc, this.color});
}

List<PackageCard> packageCards = [
  PackageCard(
      id: 1,
      title: "Weight Loss Plan",
      description:
          "This Package includes a diet  plan for losing weight plus different exercises that you can do in order to stay fit.",
      imgeSrc: 'assets/PLimg2b.jpg',
      color: Colors.greenAccent),
  PackageCard(
      id: 1,
      title: "Muscle Building Plan",
      description:
          "This Package includes a diet  plan for building muscles plus different exercises that you can do in order to stay fit.",
      imgeSrc: 'assets/PLimg6.jpg',
      color: Colors.redAccent),
  PackageCard(
      id: 1,
      title: "Bigger Butt Plan",
      description:
          "This Package includes a diet  plan for a bigger and rounder butt plus different exercises that you can do in order to stay fit.",
      imgeSrc: 'assets/PLimg3.png',
      color: Colors.yellow[800]),
  PackageCard(
      id: 1,
      title: "Weight Gain Plan",
      description:
          "This Package includes a diet  plan for gaining more weight plus different exercises that you can do in order to stay fit.",
      imgeSrc: 'assets/PLimg4.jpg',
      color: Colors.blueAccent),
  PackageCard(
      id: 1,
      title: "Abs Plan",
      description:
          "This Package includes a diet  plan for obtaining visble and sexier abs plus different exercises that you can do in order to stay fit.",
      imgeSrc: 'assets/PLimg8.jpg',
      color: Colors.brown)
];
