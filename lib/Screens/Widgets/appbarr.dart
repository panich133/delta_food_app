import 'package:flutter/material.dart';

class AAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.7,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.5, 35.0),
            blurRadius: 2.0,
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(5.5, 35.0),
            blurRadius: 56.0,
          ),
          BoxShadow(
            color: Colors.white10,
            offset: Offset(0.5, 55.0),
            blurRadius: 86.0,
          ),
        ],
        borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(180, 10),
            bottomLeft: Radius.elliptical(220, 10)),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11),
        child: Center(
          child: Text(
            'DeltaFood',
            style: TextStyle(
              color: Colors.white,
              fontSize: 42.5,
              fontWeight: FontWeight.w500,
              fontFamily: 'Signatra',
            ),
          ),
        ),
      ),
    );
  }
}
