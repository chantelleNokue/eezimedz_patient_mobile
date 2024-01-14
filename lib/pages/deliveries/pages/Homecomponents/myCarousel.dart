import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Models/mocModel.dart';
import 'myCorouselBlog/bloc/posts_bloc.dart';

class MyCarousel extends StatelessWidget {
  const MyCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final PostsBloc postsBloc = PostsBloc();

    List<MockModel> imagesModel = [
      MockModel(
          imagePath: 'assets/images/aaaa.jpg',
          description: "R100",
          dosage: " 2 per day",
          medicineName: "Benylin",
          purpose: "For Headache",
          price: "R40",
          numberOfPacks: "R40"),
      MockModel(
          imagePath: 'assets/images/ccccc.jpg',
          description: "R100",
          dosage: " 2 per day",
          medicineName: "Benylin",
          purpose: "For Headache",
          price: "R40",
          numberOfPacks: "40"),
      MockModel(
          imagePath: 'assets/images/dddd.jpg',
          description: "R100",
          dosage: " 2 per day",
          medicineName: "Benylin",
          purpose: "For Headache",
          price: "R40",
          numberOfPacks: "40"),
      MockModel(
          imagePath: 'assets/images/fff.jpg',
          description: "R100",
          dosage: " 2 per day",
          medicineName: "Benylin",
          purpose: "For Headache",
          price: "R40",
          numberOfPacks: "40"),
    ];

    final List<Widget> imageSliders = imagesModel
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(item.imagePath,
                            fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${item.medicineName} ',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text(
                                  "${item.price}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.6,
              autoPlay: false,
              aspectRatio: 1.0,
              scrollDirection: Axis.vertical,
              enlargeCenterPage: false,
            ),
            items: imageSliders,
          ),
        ],
      ),
    ));
  }
}
