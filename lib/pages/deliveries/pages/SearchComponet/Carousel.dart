import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Models/ImgModel.dart';

class seachCorousel extends StatefulWidget {
  const seachCorousel({super.key});

  @override
  State<seachCorousel> createState() => _seachCorouselState();
}

class _seachCorouselState extends State<seachCorousel> {
  int activeIndex = 0; // Move the variable here and initialize it

  List<ImgModel> imagesModel = [
    ImgModel(
        path: 'assets/images/aaaa.jpg', description: "R100", name: "Benylin"),
    ImgModel(
        path: 'assets/images/bbbbb.jpg',
        description: "R400",
        name: "Paracetamol"),
    ImgModel(
        path: 'assets/images/ccccc.jpg',
        description: "R300",
        name: "Mineral Vitamin E"),
    ImgModel(
        path: 'assets/images/dddd.jpg',
        description: "R50",
        name: "Carnitine Taurine"),
    ImgModel(
        path: 'assets/images/fff.jpg',
        description: "R50",
        name: "Carnitine Taurine"),
  ];

  @override
  void initState() {
    super.initState();
    activeIndex = 0; // Initialize the variable here
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imagesModel
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(20), //<-- SEE HERE
                            color: Colors.blue),
                        child: Image.asset(
                          item.path,
                          fit: BoxFit.cover,
                          width: 1000.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
        .toList();
    return Container(
      height: 200,
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.8,
              height: 180,
              autoPlay: false,
              pageSnapping: true,
              aspectRatio: 1.6,
              enlargeCenterPage: false,
              onPageChanged: ((index, reason) {
                setState(() => activeIndex = index);
              }),
            ),
            items: imageSliders,
          ),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: imagesModel.length,
            effect: const SlideEffect(
                dotHeight: 10,
                dotWidth: 10,
                dotColor: Colors.white70,
                activeDotColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
