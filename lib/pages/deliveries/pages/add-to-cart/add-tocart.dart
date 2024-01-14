import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../MedicalCarts.dart';
import '../Models/FormModel.dart' as MyFormModel;
import 'bloc/add_to_cart_bloc.dart';

class AddToCart extends StatefulWidget {
  final MyFormModel.PostModelUi postModelUi;
  final AddToCartBloc addToCartBloc;

  const AddToCart(
      {super.key, required this.postModelUi, required this.addToCartBloc});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  double _currentSliderValue = 20;

  int activeIndex = 0; // Move the variable here and initialize it

  @override
  void initState() {
    super.initState();
    activeIndex = 0; // Initialize the variable here
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddToCartBloc>(
          create: (_) => AddToCartBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // Handle search icon button press
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 450,
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
                                SizedBox(height: 40),
                                Container(
                                    height: 600,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30.0),
                                          bottomRight: Radius.circular(30.0),
                                        ),
                                        color: Color.fromRGBO(33, 150, 243, 1)),
                                    child: ListView.builder(
                                        itemCount:
                                            widget.postModelUi.images.length,
                                        itemBuilder: (context, index) {
                                          final List<Widget> imageSliders =
                                              widget.postModelUi.images
                                                  .map((item) => Container(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                          child: ClipRRect(
                                                            child: Stack(
                                                              children: <Widget>[
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              20), //<-- SEE HERE
                                                                          color:
                                                                              Colors.blue),
                                                                  child: Image
                                                                      .network(
                                                                    item.src,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    width:
                                                                        1000.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ))
                                                  .toList();

                                          //  Container(
                                          //       margin: const EdgeInsets.all(5.0),
                                          //       child: ClipRRect(
                                          //           borderRadius: const BorderRadius.all(
                                          //               Radius.circular(5.0)),
                                          //           child: Stack(
                                          //             children: <Widget>[
                                          //               Image.asset(item.src,
                                          //                   fit: BoxFit.cover,
                                          //                   width: 1000.0),
                                          //               Positioned(
                                          //                 bottom: 0.0,
                                          //                 left: 0.0,
                                          //                 right: 0.0,
                                          //                 child: Container(
                                          //                   decoration: const BoxDecoration(
                                          //                       color: Colors.white),
                                          //                   padding:
                                          //                       const EdgeInsets.symmetric(
                                          //                           vertical: 5.0,
                                          //                           horizontal: 0),
                                          //                   child: Column(
                                          //                     crossAxisAlignment:
                                          //                         CrossAxisAlignment.start,
                                          //                     children: [
                                          //                       Text(
                                          //                         '${item.name}',
                                          //                         textAlign:
                                          //                             TextAlign.start,
                                          //                         style: const TextStyle(
                                          //                           color: Colors.black,
                                          //                           fontSize: 20.0,
                                          //                         ),
                                          //                       ),

                                          //                       Row(
                                          //                         mainAxisAlignment:
                                          //                             MainAxisAlignment
                                          //                                 .spaceBetween,
                                          //                         children: [

                                          //                         ],
                                          //                       ),
                                          //                     ],
                                          //                   ),
                                          //                 ),
                                          //               ),
                                          //             ],
                                          //           )),
                                          //     ))
                                          // .toList();

                                          return Container(
                                            child: Column(
                                              children: <Widget>[
                                                CarouselSlider(
                                                  options: CarouselOptions(
                                                    height: 600,
                                                    viewportFraction: 1,
                                                    autoPlay: false,
                                                    pageSnapping: true,
                                                    aspectRatio: 2.6,
                                                    enlargeCenterPage: true,
                                                    onPageChanged:
                                                        ((index, reason) {
                                                      setState(() =>
                                                          activeIndex = index);
                                                    }),
                                                  ),
                                                  items: imageSliders,
                                                ),
                                              ],
                                            ),
                                          );
                                        })

                                    //   Image.asset(
                                    //       widget.postModelUi.imagePath,
                                    //       width: 1000.0,
                                    //       fit: BoxFit.cover),
                                    // ),

                                    )
                              ],
                            )),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 225),
                          child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                  color: Colors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: AnimatedSmoothIndicator(
                                        activeIndex: activeIndex,
                                        count: widget.postModelUi.images.length,
                                        effect: const SlideEffect(
                                            dotHeight: 10,
                                            dotWidth: 10,
                                            dotColor: Colors.blue,
                                            activeDotColor: Colors.blue),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Center(
                                      child: SizedBox(
                                        width: 60,
                                        child: Divider(
                                          height:
                                              10, // Specifies the height of the divider
                                          thickness:
                                              5, // Specifies the thickness of the divider line
                                          color: Colors
                                              .grey, // Specifies the color of the divider line
                                          indent:
                                              10, // Specifies the indentation from the left
                                          endIndent:
                                              10, // Specifies the indentation from the right
                                        ),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(widget.postModelUi.name,
                                        style: const TextStyle(
                                          fontSize: 25,
                                        )),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: const Icon(
                                            CupertinoIcons.heart,
                                            size: 25.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 14,
                                    ),
                                    child: Text("Tablet . 50 pieces",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: AutofillHints
                                                .creditCardGivenName,
                                            color: Colors.grey)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 16),
                                    child: Row(children: [
                                      Text(
                                          "\$ ${widget.postModelUi.price.toString()}",
                                          style: const TextStyle(
                                            fontSize: 25,
                                          )),
                                      Column(children: [
                                        Text(
                                            "${widget.postModelUi.stockQuantity.toDouble()} in stock",
                                            style:
                                                const TextStyle(fontSize: 11)),
                                        Slider(
                                          activeColor: Colors.green,
                                          inactiveColor: Colors.grey,
                                          value: widget
                                              .postModelUi.stockQuantity
                                              .toDouble(),
                                          max: 100,
                                          divisions: 5,
                                          label: _currentSliderValue
                                              .round()
                                              .toString(),
                                          onChanged: (double value) {
                                            // TODO
                                          },
                                        ),
                                      ])
                                    ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Expanded(
                                          flex: 1,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Dosage Form",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Pills",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ]),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Active Substance",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  widget.postModelUi.slug,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Dosage ",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  widget.postModelUi.slug,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ]),
                                        ),
                                        const Expanded(
                                          flex: 1,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Manufacturer",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Biosyn, Russia",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 16),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          ),
                                          color: Colors.white),
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          try {
                                            widget.addToCartBloc.add(
                                                AddingToCartEvent(
                                                    widget.postModelUi));
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CartMedical(
                                                        addToCartBloc: widget
                                                            .addToCartBloc),
                                              ),
                                            );
                                          } catch (e) {
                                            print(e.toString());
                                          }
                                        },
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Add to cart'),
                                          ],
                                        ),
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
        ),
      ),
    );
  }
}






// class AddToCart extends StatelessWidget {
//   final PostModelUi postModelUi;
//   AddToCart({super.key, required this.postModelUi});




// }
