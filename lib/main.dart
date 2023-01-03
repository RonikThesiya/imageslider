import 'package:flutter/material.dart';
import 'package:imageslider/screen/home/provider/homeprovider.dart';
import 'package:imageslider/screen/home/view/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => Homeprovider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/' : (context) => Homescreen(),
          },
        ),
      ),
  );
}
