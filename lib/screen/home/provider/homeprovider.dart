import 'package:flutter/material.dart';

class Homeprovider extends ChangeNotifier
{
  List Image = [
    "assets/image/p3.jpg",
    "assets/image/p4.png",
    "assets/image/p5.png",
  ];
   int i= 0 ;

   void position(int index)
   {
     i = index;
     notifyListeners();
   }

}