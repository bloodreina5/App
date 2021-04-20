import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: -100,
              left: -100,
              child: Image.asset(
                'assets/BlueCircle.png',
                width: size.width * 0.7,
              )),
          Positioned(
              bottom: -100,
              left: -100,
              child: Image.asset(
                'assets/LightBlue.png',
                width: size.width * 0.5,
              )),
          child,
        ],
      ),
    );
  }
}
