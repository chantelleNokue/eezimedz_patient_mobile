import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_dropdown_x/flutter_dropdown_x.dart';

import '../profile.dart';
import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import '../components/listitemsclass.dart';
import '../components/successdialog.dart';
import '../homepage.dart';

class Reviews extends StatefulWidget{
  const Reviews({Key ? key}): super(key : key);

  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews>{
  //success dialog
  void _showSuccessDialog(context) => showDialog(
    context: context,
    builder: (context) => SuccessDialog(toClass: HomePage()),
  );
  
  //controller
  final additionalController = TextEditingController();

  //variables
  String? medicalcenter;
  String? department;
  DateTime visitationdate = DateTime.now();


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Reviews'),
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
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  'Reviews',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),

              SizedBox(height: 5,),

              Center(
                child: Text(
                  'Leave a review of your experiences with us',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 15,),

              SizedBox(
                height: 700,
                child: SingleChildScrollView(
                  physics:  ClampingScrollPhysics(),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.all(8.0),
                    shrinkWrap: true,
                    children: [

                      Center(child: Text('Medical Center Visited')),
                      SizedBox(
                        height: 80,
                        width: 320,
                        child: DropDownField(
                          value: medicalcenter,
                          hintText: 'Select Medical Center',
                          dataSource: ListItems().medicalcenterItems,
                          onChanged: (value){
                            setState(() {
                              medicalcenter = value;
                            });
                          },
                          textField: 'label',
                          valueField: 'value',
                        ),
                      ),

                      SizedBox(height: 10,),

                      Center(child: Text('Department Visited')),
                      SizedBox(
                        height: 80,
                        width: 320,
                        child: DropDownField(
                          value: department,
                          hintText: 'Select Department',
                          dataSource: ListItems().departmentOptions,
                          onChanged: (value){
                            setState(() {
                              department = value;
                            });
                          },
                          textField: 'label',
                          valueField: 'value',
                        ),
                      ),

                      SizedBox(height: 10,),

                      Center(child: Text('Visitation Date')),
                      SizedBox(height: 3,),
                      Column(
                        children: <Widget>[
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.black26,
                                  style: BorderStyle.solid,
                                )
                            ),
                            child: Center(
                              child: Text(
                                "${visitationdate.year} - ${visitationdate.month} - ${visitationdate.day}",
                              ),
                            ),
                          ),

                          SizedBox(height: 5,),

                          MaterialButton(
                            color: Colors.blueGrey,
                            hoverColor: Colors.lightBlueAccent,
                            elevation: 4,
                            child: Text('Choose Date'),
                            onPressed: () async{
                              final DateTime? dateTime = await showDatePicker(
                                context: context,
                                initialDate: visitationdate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(3000),
                              );

                              if(dateTime != null){
                                setState(() {
                                  visitationdate = dateTime;
                                });
                              }
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: 900,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Leave a rating of your experience.',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 5,),

                              RatingBar.builder(
                                initialRating: 2,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 8.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.blue,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      Center(child: Text('Tell us more abut your expereince.')),
                      SizedBox(height: 3,),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: additionalController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Colors.black38,
                                  width: 1.0
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            alignLabelWithHint: true,
                            label: Text('How was your experience?.......'),
                            hintText: 'How was your experience?.......',
                            suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: () => additionalController.clear(),),
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      ElevatedButton(
                        child: Text('Submit'),
                        onPressed: () => _showSuccessDialog(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          elevation: 0,
                          minimumSize: Size(300,50),
                        ),
                      ),


                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),

      bottomNavigationBar: NavBar(),

    );
  }
}
