import 'package:flutter/material.dart';

class TopHaderCustom extends StatelessWidget {
  final text;
  final image;

  TopHaderCustom({this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          Image.asset(
            image,
            height: 220,
            fit: BoxFit.fitHeight,
          )
        ],
      ),
    );
  }
}