import 'package:flutter/material.dart';

class CircleButtonWidgets extends StatelessWidget{
  CircleButtonWidgets(this.child, {Key? key}) : super(key: key);
  final IconData child;
  @override 
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white, 
        shape: BoxShape.circle
      ),
      padding: const EdgeInsets.all(12.0),
      child: Icon(child),
    );
  }
}