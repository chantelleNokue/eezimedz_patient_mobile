import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../models/patientmodel.dart';
import '../../../services/patient/patientservice.dart';
import '../../components/bottomnavigationbar.dart';
import '../../profile.dart';
import 'Homecomponents/myCorouselBlog/bloc/posts_bloc.dart';
import 'add-to-cart/add-tocart.dart';
import 'add-to-cart/bloc/add_to_cart_bloc.dart';

class HomePageDeliveries extends StatefulWidget {
  const HomePageDeliveries ({super.key});

  @override
  State<HomePageDeliveries > createState() => _HomePageState();
}

class _HomePageState extends State<HomePageDeliveries> {
  final PostsBloc postsBloc = PostsBloc();
  final AddToCartBloc addToCartBloc = AddToCartBloc();

  @override
  void initState() {
    postsBloc.add(PostsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Buy Medicine'),
        automaticallyImplyLeading: false,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu_sharp,
                color: Colors.white,
              ));
        }),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Profile())),
            icon: Icon(Icons.person),
          ),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 240,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                        color: Colors.blue),
                    child: Consumer<PatientService>(
                    builder:(context, PatientService, _) {
                      PatientModel? patients = PatientService.patient;

                     return Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundImage:
                              AssetImage('icons/woman.png'),
                              radius: 28,
                            ),
                            title:  Row(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    top: 20,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hi ${patients?.personalDetails.firstName ?? ''
                                  }',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      Text("Welcome back!",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200,
                                              fontSize: 12,
                                              color: Colors.white))
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
                          ));

                    })
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 80, left: 14, right: 14),
                      child: Container(
                          height: 200,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                              ),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 42, //<-- SEE HERE
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: AssetImage(
                                                'icons/hospital.png'),
                                            radius: 28,
                                          ),
                                          Text("Clinic Visit",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 11,
                                                  color: Colors.black))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 42, //<-- SEE HERE
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'icons/video.png',
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const Text("Home Visit",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 11,
                                                  color: Colors.black))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 42, //<-- SEE HERE
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'icons/video.png',
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const Text("Video Consult",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 11,
                                                  color: Colors.black))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 20, left: 10, right: 10),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 42, //<-- SEE HERE
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'icons/notebook.png',
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const Text("Clinic Visit",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 11,
                                                  color: Colors.black))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 42, //<-- SEE HERE
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'icons/diseasess.png',
                                              //icons/disease.png
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const Text("Diseases",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 11,
                                                  color: Colors.black))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 42, //<-- SEE HERE
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'icons/covid.png',
                                              //icons/coronavirus.png
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 90,
                                          ),
                                          const Text("Covid 19",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 11,
                                                  color: Colors.black))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )))
                ],
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: const Text("Top Medicine"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: const Text("View all",
                              style: TextStyle(color: Colors.blue))),
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
              ),
              Expanded(
                  child: BlocConsumer<PostsBloc, PostsState>(
                bloc: postsBloc,
                listenWhen: (previous, current) => current is PostActionState,
                buildWhen: ((previous, current) => current is! PostActionState),
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case PostfetchingLoadingState:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case PostFetchingSuccessfulState:
                      final successState = state as PostFetchingSuccessfulState;

                      return ListView.builder(
                          itemCount: successState.posts.length,
                          itemBuilder: (context, index) {
                            final List<Widget> imageSliders = successState.posts
                                .map((item) => Container(
                                      margin: const EdgeInsets.all(5.0),
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5.0)),
                                          child: Stack(
                                            children: <Widget>[
                                              Image.network(item.images[0].src,
                                                  fit: BoxFit.cover,
                                                  width: 1000.0),
                                              Positioned(
                                                bottom: 0.0,
                                                left: 0.0,
                                                right: 0.0,
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      color: Colors.white),
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 5.0,
                                                          horizontal: 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        '${item.name}',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        item.description.replaceAll(
                                                            RegExp(
                                                                r'<\/?p[^>]*>'),
                                                            ''),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12.0,
                                                            fontFamily:
                                                                AutofillHints
                                                                    .addressCity),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "\$ ${item.price}",
                                                            textAlign:
                                                                TextAlign.start,
                                                            style:
                                                                const TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 15.0,
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                AddToCart(
                                                                          postModelUi:
                                                                              item,
                                                                          addToCartBloc:
                                                                              addToCartBloc,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child:
                                                                      const Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .info,
                                                                        size:
                                                                            18.0,
                                                                        color: Colors
                                                                            .blue,
                                                                      ),
                                                                      Text(
                                                                          "More info",
                                                                          style: TextStyle(
                                                                              color:
                                                                                  Colors.blue)),
                                                                    ],
                                                                  )),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ))
                                .toList();

                            return Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Material(
                                            child: CarouselSlider(
                                              options: CarouselOptions(
                                                viewportFraction: 0.6,
                                                autoPlay: false,
                                                aspectRatio: 1.0,
                                                scrollDirection: Axis.vertical,
                                                enlargeCenterPage: false,
                                              ),
                                              items: imageSliders,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                  ]),
                            );
                          });

                    default:
                      return const SizedBox();
                  }
                },
              )
                  //   child: Container(
                  //       decoration: const BoxDecoration(
                  //           borderRadius: BorderRadius.only(
                  //             bottomLeft: Radius.circular(30.0),
                  //             bottomRight: Radius.circular(30.0),
                  //           ),
                  //           color: Colors.white),
                  //       child: const MyCarousel()),
                  // )
                  )
            ],
          ),
        )),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
