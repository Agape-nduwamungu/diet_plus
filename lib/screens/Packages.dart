import 'package:diet_plus/models/PackageCard.dart';
import 'package:flutter/material.dart';

class Packages extends StatelessWidget {
  final PackageCard packageCard;

  const Packages({Key key, this.packageCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.65,
      child: Container(
        decoration: BoxDecoration(
            color: packageCard.color, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Text(
                    packageCard.title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    packageCard.description,
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.w600),
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )),
            SizedBox(
              width: 3,
            ),
            AspectRatio(aspectRatio: 0.21),
            Image.asset(
              packageCard.imgeSrc,
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
            )
          ],
        ),
      ),
    );
  }
}
