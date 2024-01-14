import 'package:flutter/material.dart';

import '../components/bottomnavigationbar.dart';
import '../patientdetails/detailsmenu.dart';
import '../profile.dart';
import '../reports/reports.dart';

class WalletBalancies extends StatefulWidget {
  const WalletBalancies({super.key});

  @override
  State<WalletBalancies> createState() => _WalletBalanciesState();
}

class _WalletBalanciesState extends State<WalletBalancies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          title: Text('Home Page'),
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
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Hello Chantelle',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                'Hello Chantelle',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          // Spacer(),
                          SizedBox(
                            width: 200,
                          ),
                          Image.asset(
                            'icons/message.png',
                            height: 40,
                            width: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            
            child: Container(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Balances',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 160,
                  height: 80,
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 165,
                      height: 80,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.05)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Image.asset('icons/pills.png', height: 35, width: 35,),
                          //
                          // SizedBox(width: 5,),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Total Amount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  // Spacer(),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    size: 24,
                                    // color: Colors.blue,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '500 000 000 RTGS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              // number 2
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 160,
                  height: 80,
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 165,
                      height: 80,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.05)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Image.asset('icons/pills.png', height: 35, width: 35,),
                          //
                          // SizedBox(width: 5,),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Total Amount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  // Spacer(),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    size: 24,
                                    // color: Colors.blue,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '500 000 000 RTGS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 160,
                  height: 80,
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 165,
                      height: 80,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.05)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Image.asset('icons/pills.png', height: 35, width: 35,),
                          //
                          // SizedBox(width: 5,),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Total Amount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  // Spacer(),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    size: 24,
                                    // color: Colors.blue,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '500 000 000 RTGS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              // number 2
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 160,
                  height: 80,
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 165,
                      height: 80,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.05)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Image.asset('icons/pills.png', height: 35, width: 35,),
                          //
                          // SizedBox(width: 5,),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Total Amount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  // Spacer(),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    size: 24,
                                    // color: Colors.blue,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '500 000 000 RTGS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 160,
                  height: 80,
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 165,
                      height: 80,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.05)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Image.asset('icons/pills.png', height: 35, width: 35,),
                          //
                          // SizedBox(width: 5,),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Total Amount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  // Spacer(),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    size: 24,
                                    // color: Colors.blue,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '500 000 000 RTGS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              // number 2
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 160,
                  height: 80,
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 165,
                      height: 80,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.05)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Image.asset('icons/pills.png', height: 35, width: 35,),
                          //
                          // SizedBox(width: 5,),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Total Amount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  // Spacer(),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    size: 24,
                                    // color: Colors.blue,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '500 000 000 RTGS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),

          // another heading

          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,

              child: Container(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'Billing',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),

          //billing

          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                height: 80,
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 165,
                    height: 80,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.05),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Image.asset('icons/pills.png', height: 35, width: 35,),
                        //
                        // SizedBox(width: 5,),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Bill so Far',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                // Spacer(),
                                SizedBox(
                                  width: 60,
                                ),
                                Text(
                                  'Amount you owe',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                // Spacer(),
                                SizedBox(
                                  width: 40,
                                ),
                                Icon(
                                  Icons.more_vert,
                                  size: 24,
                                  // color: Colors.blue,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  '500 000 000 RTGS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Text(
                                  '100 000 000 RTGS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
        bottomNavigationBar: NavBar(),
    );
  }
}
