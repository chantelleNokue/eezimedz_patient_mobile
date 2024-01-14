// import 'package:eezimed_deliveries/pages/SearchComponet/FirstCategory.dart';
import 'package:flutter/material.dart';

import 'SearchComponet/Carousel.dart';
import 'SearchComponet/FirstCategory.dart';
import 'SearchComponet/ThirdCategory.dart';
import 'SearchComponet/secondCategory.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 480,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      color: Colors.blue),
                  child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ListTile(
                            leading: Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 30.0,
                              color: Colors.white,
                            ),
                            title: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    top: 5,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Your Location",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200,
                                              fontSize: 10,
                                              color: Colors.white)),
                                      Text(
                                        "35 St Martin's St west end",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              "Online",
                              style:
                                  TextStyle(fontSize: 21, color: Colors.white),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.search,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.assignment_outlined,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              "Phamarcy",
                              style:
                                  TextStyle(fontSize: 21, color: Colors.white),
                            ),
                          ),
                          seachCorousel(),
                        ],
                      )),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 380),
                    child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(36),
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0),
                            ),
                            color: Colors.white),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Categories"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                      onTap: () {},
                                      child: Text("View all",
                                          style:
                                              TextStyle(color: Colors.blue))),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 18.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FirstCategory(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SecondCategory(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ThirdCategory(),
                            ),
                          ],
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
