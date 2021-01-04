import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Function onPressed;

  CircleButton({this.icon, this.onPressed, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
          icon: Icon(
            icon,
            color: Colors.black,
            size: size,
          ),
          onPressed: onPressed),
    );
  }
}
