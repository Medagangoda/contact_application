import 'package:flutter/material.dart';

class apptextfielddecoration{
  static InputDecoration main({
    hinttext = "enter...."
  }){
    return InputDecoration(
      border: OutlineInputBorder(),
      hintText: hinttext
    );
  }
}