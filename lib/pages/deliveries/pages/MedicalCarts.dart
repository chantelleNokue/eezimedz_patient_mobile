import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'Models/FormModel.dart' as MyFormModel;
import 'add-to-cart/bloc/add_to_cart_bloc.dart';

class CartMedical extends StatefulWidget {
  final AddToCartBloc addToCartBloc;

  const CartMedical({super.key, required this.addToCartBloc});

  @override
  State<CartMedical> createState() => _CartMedicalState();
}

class _CartMedicalState extends State<CartMedical> {
  late List<MyFormModel.PostModelUi> showCartList;
  double CartTotal = 0.0;

  void FindTotal() {
    double total = 0.0;

    for (var object in widget.addToCartBloc.state.cartList) {
      double result = double.parse(object.price) * object.menuOrder;
      total += result;
    }
    setState(() {
      CartTotal = total;
    });
  }

  @override
  void initState() {
    FindTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<AddToCartBloc>(
        create: (_) => AddToCartBloc(),
        // we use `builder` to obtain a new `BuildContext` that has access to the provider
        builder: (context, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 15, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.arrow_back_ios_outlined,
                                size: 30.0,
                                color: Colors.black,
                              ),
                              const Text(
                                "Shopping Cart",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50.0),
                                      ),
                                      color: Colors.blue),
                                  height: 25,
                                  width: 25,
                                  child: Center(
                                    child: Text(
                                        "${widget.addToCartBloc.state.cartList.length.toString()}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: const Color.fromARGB(
                                                255, 141, 106, 106))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Card(
                      elevation: 0.2,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'Address Shipping',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            trailing: GestureDetector(
                                onTap: () {},
                                child: const Text("Change",
                                    style: TextStyle(color: Colors.blue))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, bottom: 15),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 25.0,
                                  color: Colors.black,
                                ),
                                Text(
                                  '23 Estean, New York, USA',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: BlocConsumer<AddToCartBloc, AddToCartState>(
                              bloc: widget.addToCartBloc,
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                              builder: (context, state) {
                                if (widget.addToCartBloc.state
                                        is AddToCartUpdated &&
                                    widget.addToCartBloc.state.cartList
                                        .isNotEmpty) {
                                  final cartList =
                                      widget.addToCartBloc.state.cartList;

                                  return ListView.builder(
                                    itemCount: widget
                                        .addToCartBloc.state.cartList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      showCartList =
                                          widget.addToCartBloc.state.cartList;

                                      final myObject = showCartList[index];
                                      return Container(
                                        child: Card(
                                          child: Container(
                                            height: 130,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          myObject
                                                              .images[0].src,
                                                          width: 100,
                                                          height: 110,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 8.0,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 5.0),
                                                                  child: Text(
                                                                      "${myObject.name}",
                                                                      style: const TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.black)),
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                    " ${myObject.description.replaceAll(RegExp(r'<\/?p[^>]*>'), '')} ",
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .grey)),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                    "\$ ${myObject.price.toString()}",
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .blue)),
                                                              ],
                                                            ),
                                                            Card(
                                                              child: Row(
                                                                children: [
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          myObject.menuOrder =
                                                                              myObject.menuOrder + 1;
                                                                        });
                                                                        FindTotal();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            45,
                                                                        child:
                                                                            const Center(
                                                                          child: Text(
                                                                              "+",
                                                                              style: TextStyle(fontSize: 27, color: Colors.black, fontWeight: FontWeight.bold)),
                                                                        ),
                                                                      )),
                                                                  Container(
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.all(
                                                                              Radius.circular(8),
                                                                            ),
                                                                            color: Colors.blue),
                                                                    height: 30,
                                                                    width: 30,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Center(
                                                                        child: Text(
                                                                            '${myObject.menuOrder.toString()}',
                                                                            style:
                                                                                TextStyle(fontSize: 15, color: Colors.white)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          myObject.menuOrder =
                                                                              myObject.menuOrder - 1;
                                                                        });
                                                                        if (myObject.menuOrder <
                                                                            1) {
                                                                          setState(
                                                                              () {
                                                                            myObject.menuOrder =
                                                                                1;
                                                                          });
                                                                        }
                                                                        FindTotal();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            45,
                                                                        child:
                                                                            const Center(
                                                                          child: Text(
                                                                              "-",
                                                                              style: TextStyle(fontSize: 27, color: Colors.black, fontWeight: FontWeight.bold)),
                                                                        ),
                                                                      )),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      widget.addToCartBloc.add(
                                                          DeletingToCartEvent(
                                                              myObject));

                                                      showCartList = widget
                                                          .addToCartBloc
                                                          .state
                                                          .cartList;
                                                      print(showCartList);
                                                    },
                                                    child: const Icon(
                                                      Icons.delete,
                                                      size: 50.0,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return Center(
                                    child: Text("Cart is empty"),
                                  );
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(children: [
                        Container(
                          height: 50,
                          width: 100,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                                Text(
                                  '\$ ${CartTotal.toString()}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Check Out'),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          );
          // });
        });
  }
}
