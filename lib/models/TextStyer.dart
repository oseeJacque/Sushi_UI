import 'package:flutter/material.dart';

class TextStyler extends Text{
  TextStyler(String data, {Key? key, color:Colors.black,fontWeight:FontWeight.normal,factory:10.0,fontSize:10.0,fontStyle:FontStyle.normal}):
  super(key: key, data,
  style: TextStyle(
    fontSize: fontSize, 
    fontWeight: fontWeight, 
    color: color, 
    fontStyle: fontStyle
  )
  );
}