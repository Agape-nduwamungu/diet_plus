import 'package:diet_plus/models/RadialPainter.dart';
import 'package:flutter/material.dart';

class RadialProgress extends StatelessWidget {
  final double height, width, progress;
  const RadialProgress({Key key, this.height, this.width, this.progress});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RadialPainter(progress: 0.7),
      child: Container(
          height: height,
          width: width,
          child: Center(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "545",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF9C27B0))),
                  TextSpan(text: "\n"),
                  TextSpan(
                      text: "cals left",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF9C27B0))),
                ])),
          )),
    );
  }
}
