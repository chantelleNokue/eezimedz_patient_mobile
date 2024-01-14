import 'package:flutter/material.dart';

import 'Screen1/screen1.dart';
import 'educate/educate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Home Screen Page'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            // PhysicalModel(
            //     color: Colors.white,
            //     shadowColor: Colors.blue,
            //     elevation: 8,
            //     child: Container(
            //       //Top part container with the image on the home page
            //       width: MediaQuery.of(context).size.width,
            //       height: 90,//MediaQuery.of(context).size.height,
            //       child: Image.asset(
            //         'icons/logo.png',
            //         fit: BoxFit.fitHeight,
            //       ),
            //     )
            // ),
            //
            // SizedBox(height: 10,),

            Expanded(
              flex: 3,
              child: GridView(
                padding: EdgeInsets.only(left: 13.0, right: 13.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 11,
                ),
                children: <Widget>[


                  //build my details  widget
                  PhysicalShape(
                    color: Colors.white,
                    elevation: 8,
                    shadowColor: Colors.blue,
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)
                        )
                    ),
                    child: Container(
                      // height: MediaQuery.of(context).size.height * 0.20,
                      // width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppointmentsScreen ())),
                        child: Column(
                          children: [
                            Expanded(
                                flex:2,
                                child: Image.asset('icons/patient.png')
                            ),
                            Expanded(
                                flex: 1,
                                child: Text('Appoiintments',style: TextStyle(fontWeight: FontWeight.bold),)
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  //build my details  widget
                  PhysicalShape(
                    color: Colors.white,
                    elevation: 8,
                    shadowColor: Colors.blue,
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)
                        )
                    ),
                    child: Container(
                      // height: MediaQuery.of(context).size.height * 0.20,
                      // width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Educate())),
                        child: Column(
                          children: [
                            Expanded(
                                flex:2,
                                child: Image.asset('icons/patient.png')
                            ),
                            Expanded(
                                flex: 1,
                                child: Text('Educate',style: TextStyle(fontWeight: FontWeight.bold),)
                            )
                          ],
                        ),
                      ),
                    ),
                  ),






                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
