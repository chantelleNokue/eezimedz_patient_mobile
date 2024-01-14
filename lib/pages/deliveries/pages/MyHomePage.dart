// import 'package:eezimed_deliveries/pages/add-to-cart/bloc/add_to_cart_bloc.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'Homecomponents/myCorouselBlog/bloc/posts_bloc.dart';
import 'Search.dart';
import 'add-to-cart/bloc/add_to_cart_bloc.dart';
import 'courier-location/courier-location.dart';

class myHomePage extends StatefulWidget {
  const myHomePage({super.key});

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  final PostsBloc postsBloc = PostsBloc();
  AddToCartBloc AddsBloc = AddToCartBloc();

  int currentIndex = 0;
  static List body = [
    const HomePageDeliveries (),
    const SearchPage(),
    const CourierLocation(),
  ];
  void _bottomNAvigationBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: body.elementAt(currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services),
              label: '',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_grocery_store,
                size: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 35,
              ),
              label: '',
            ),
          ],
          currentIndex: currentIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          onTap: _bottomNAvigationBar,
        ),
      ),
    );
  }
}
