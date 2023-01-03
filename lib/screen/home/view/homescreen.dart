import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:imageslider/screen/home/provider/homeprovider.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Homeprovider? homeprovidertrue;
  Homeprovider? homeproviderfalse;

  @override
  Widget build(BuildContext context) {
    homeprovidertrue = Provider.of<Homeprovider>(context, listen: true);
    homeproviderfalse = Provider.of<Homeprovider>(context, listen: false);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("ImageSlider"),
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider.builder(
                itemCount: homeproviderfalse!.Image.length,
                itemBuilder: (context, index, _) {
                  return Image.asset("${homeproviderfalse!.Image[index]}");
                },
                options: CarouselOptions(
                  autoPlay: true,
                  onPageChanged: (index,_)
                    {
                      homeproviderfalse!.position(index);
                    }
                )),
            SizedBox(
              height: 20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: homeproviderfalse!.Image.asMap().entries.map((e) => Container(
                      height: 10,
                      width: 10,
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:  homeproviderfalse!.i == e.key ? Colors.black:Colors.black12,
                      ),
                    ),
                ).toList(),
            ),
            DotsIndicator(dotsCount: homeprovidertrue!.Image.length,position: homeprovidertrue!.i.toDouble(),)
          ],
        ),
      ),
    ));
  }
}
