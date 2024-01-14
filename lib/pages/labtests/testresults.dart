import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'components/resultinformation.dart';
import 'components/resultcard.dart';
import 'components/labcard.dart';
import 'package:provider/provider.dart';

import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import '../../models/labtestmodel.dart';
import '../../services/labtests/labtestsservice.dart';

class TestResults extends StatefulWidget{
  const TestResults({Key ? key}): super(key : key);

  State<TestResults> createState() => _TestResultsState();
}

class _TestResultsState extends State<TestResults>{
  final searchController = TextEditingController();

  //get lab tests
  List<LabtestModel> resultsList = [];

  Future<List<LabtestModel>?> getResults() async{
    try{
      final results = await LabtestProvider().getTestResults();

      if(results != null){
        for(var item in results){
          resultsList.add(item);
        }
      }
      return resultsList;

    }catch(e){
      print('Error $e');
    }

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Lab Tests'),
        automaticallyImplyLeading: false,
        leading: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: (){
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu_sharp, color: Colors.white,)
              );
            }
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile())),
            icon: Icon(Icons.person),
          ),
        ],
      ),

      drawer: DrawerClass(),

      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //
                // //view labs
                // Text('View Labs', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),textAlign: TextAlign.left, textDirection: TextDirection.ltr),
                //
                // SizedBox(
                //   height: 100,
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: ListView(
                //       physics: AlwaysScrollableScrollPhysics(),
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       padding: EdgeInsets.all(10),
                //       children: [
                //         LabCard(
                //           labName: 'Mikel Labs',
                //           imageUrl: 'icons/mikel.jpg',
                //           viewLab: (){},
                //         ),
                //
                //         SizedBox(width: 20,),
                //
                //         //TODO: Add lab details component
                //         LabCard(
                //           labName: 'Cimas Labs',
                //           imageUrl: 'icons/cimas.jpeg',
                //           viewLab: (){},
                //         ),
                //
                //         SizedBox(width: 20,),
                //
                //         LabCard(
                //           labName: 'Clicks Labs',
                //           imageUrl: 'icons/clicks.jpg',
                //           viewLab: (){},
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                //


                SizedBox(
                  height: 60,
                  child: //search bar
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value){
                          //_filterData(value);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                          alignLabelWithHint: true,

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 0.8),
                          ),
                          hintText: 'search by doctor',
                          suffixIcon: IconButton(icon: Icon(Icons.search, size: 28.0,), onPressed:(){} ,),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15,),



                SizedBox(
                  height: 800,
                  child: FutureBuilder<List<LabtestModel>?>(
                    future: getResults(),
                    builder: (BuildContext context,  AsyncSnapshot<List<LabtestModel>?> snapshot){
                       if(snapshot.connectionState == ConnectionState.waiting){
                            return Center(child: CircularProgressIndicator(),);
                        }else if(snapshot.hasError){
                            return Center(child: Text('Looks like an error occured'),);
                        }else{
                         return SingleChildScrollView(
                           physics: ClampingScrollPhysics(),
                           child:ListView.builder(
                             itemCount: resultsList.length,
                             padding: EdgeInsets.all(8.0),
                             shrinkWrap: true,
                             physics: ClampingScrollPhysics(),
                             itemBuilder: (context, index){
                               return Column(
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   ResultCard(
                                     testName: resultsList[index].testName.toString(),
                                     doctorName: resultsList[index].doctorName,

                                     labName: resultsList[index].siteid,
                                     viewFunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultInformation(
                                       labName: resultsList[index].siteid,
                                       doctorName: resultsList[index].doctorName,
                                       testDate: DateFormat('yyyy-MM-dd').format(resultsList[index].date),
                                       testName: resultsList[index].testName  ,
                                       results: resultsList[index].tests.first.testName.toString(),
                                       comments: "Drink a lot of water",
                                     ))),
                                   ),

                                   SizedBox(height: 10,),
                                 ],
                               );
                             },

                           ),
                         );
                       }
                    },
                  ),



                  // Consumer<LabtestProvider>(
                  //   builder: (context, LabtestProvider, _){
                  //     List<LabtestModel>? testresults = LabtestProvider.labtestresults;
                  //
                  //     if(testresults == null){
                  //       return Center(child: CircularProgressIndicator(),);
                  //     }else if(testresults.isEmpty){
                  //       return Center(child: Text(' Test results not found'),);
                  //     }else{
                  //       return
                  //       SingleChildScrollView(
                  //         physics: ClampingScrollPhysics(),
                  //         child:ListView.builder(
                  //           itemCount: testresults.length,
                  //           padding: EdgeInsets.all(8.0),
                  //           shrinkWrap: true,
                  //           physics: ClampingScrollPhysics(),
                  //           itemBuilder: (context, index){
                  //             return Column(
                  //               mainAxisSize: MainAxisSize.min,
                  //               children: [
                  //                 ResultCard(
                  //                   testName: testresults[index].testName,
                  //                   doctorName: testresults[index].doctorName,
                  //                   labName: testresults[index].labName,
                  //                   viewFunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultInformation(
                  //                     labName: testresults[index].labName,
                  //                     doctorName: testresults[index].doctorName,
                  //                     testDate: testresults[index].date.toString(),
                  //                     testName: testresults[index].testName,
                  //                     results: testresults[index].tests.first,
                  //                     comments: testresults[index].tests.first,
                  //                   ))),
                  //                 ),
                  //
                  //                 SizedBox(height: 10,),
                  //               ],
                  //             );
                  //           },
                  //
                  //         ),
                  //       );
                  //     }
                  //   },
                  //
                  // ),
                ),
              ],
            ),
          )
      ),

      bottomNavigationBar: NavBar(),

    );
  }
}