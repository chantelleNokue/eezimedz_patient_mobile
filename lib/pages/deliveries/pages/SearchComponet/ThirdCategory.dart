import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Models/ImgModel.dart';

class ThirdCategory extends StatelessWidget {
  const ThirdCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/heart.png',
      'assets/images/stethoscope2.png',
      'assets/images/doctor.png',
      'assets/images/video.png',
      'assets/images/disease.png',
    ];

    List<ImgModel> imagesModel = [
      ImgModel(
          path: 'assets/images/r23.jpeg', description: "R100", name: "Benylin"),
      ImgModel(
          path: 'assets/images/g1.jpeg',
          description: "R400",
          name: "Paracetamol"),
      ImgModel(
          path: 'assets/images/r2.jpeg',
          description: "R300",
          name: "Mineral Vitamin E"),
      ImgModel(
          path: 'assets/images/p23.jpeg',
          description: "R50",
          name: "Carnitine Taurine"),
    ];

    final List<Widget> imageSliders = imagesModel
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 0, right: 0),
                    child: Container(
                      height: 100,
                      width: 115,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              item.path,
                              width: 60,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text("${item.name}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ))
        .toList();

    return Container(
        height: 90,
        child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.28,
                height: 90,
                autoPlay: false,
                aspectRatio: 1.7,
                enlargeCenterPage: false,
              ),
              items: imageSliders,
            ),
          ],
        ));
  }
}
