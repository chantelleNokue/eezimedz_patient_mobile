import 'package:flutter/material.dart';

class CourierLocation extends StatefulWidget {
  const CourierLocation({super.key});

  @override
  State<CourierLocation> createState() => _CourierLocationState();
}

class _CourierLocationState extends State<CourierLocation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 680,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                        color: Colors.blue),
                    child: Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Stack(
                          children: [
                            Container(
                              height: 640,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                  ),
                                  color: Colors.blue),
                              // child: const CircleAvatar(
                              //   backgroundImage:
                              //       AssetImage('assets/images/woman.png'),
                              //   radius: 28,
                              // ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 30.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 590),
                      child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              ),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 0, top: 15),
                                child: ListTile(
                                  leading: const CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/prince.jpg'),
                                    radius: 28,
                                  ),
                                  title: const Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          top: 0,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Courier",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey),
                                            ),
                                            Text("Evan Wells",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 20,
                                                    color: Colors.black))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.call_outlined,
                                          size: 30.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 16),
                                child: TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.chat_outlined,
                                        color: Colors.grey),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200)),
                                    fillColor: Colors.grey.shade300,
                                    filled: true,
                                    hintText: 'Message to the courier',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                  ),
                                ),
                              )
                            ],
                          )))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
