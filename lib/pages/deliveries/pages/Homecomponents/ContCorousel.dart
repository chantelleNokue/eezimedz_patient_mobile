import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Models/ImgModel.dart';

class ContaineCarousel extends StatelessWidget {
  const ContaineCarousel({super.key});

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
          path: 'assets/images/heart.png',
          description: "R100",
          name: "Benylin"),
      ImgModel(
          path: 'assets/images/stethoscope2.png',
          description: "R400",
          name: "Paracetamol"),
      ImgModel(
          path: 'assets/images/doctor.png',
          description: "R300",
          name: "Mineral Vitamin E"),
      ImgModel(
          path: 'assets/images/disease.png',
          description: "R50",
          name: "Carnitine Taurine"),
    ];

    final List<Widget> imageSliders = imagesModel
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 7, right: 7),
                    child: Container(
                      height: 120,
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
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text("${item.name}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11,
                                  color: Colors.black)),
                          Text("${item.description}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.grey))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ))
        .toList();

    return Container(
        height: 150,
        child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.3,
                height: 150,
                autoPlay: true,
                aspectRatio: 1.5,
                enlargeCenterPage: false,
              ),
              items: imageSliders,
            ),
          ],
        ));
  }
}
