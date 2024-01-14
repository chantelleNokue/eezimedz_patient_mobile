import 'package:Eezimedz_Patients/pages/medicalhistory/components/myDoctors.dart';
import 'package:flutter/material.dart';

import '../profile.dart';
import 'components/doctor2.dart';
import 'components/miniComponent.dart';


class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  List<Doctor> doctors = [
    Doctor(
      imagePath: 'icons/doctor1.jpg',
      name: 'Matthew Blythee',
      email: 'matthewblythe@eezimeds.com',
      number: '3',
      medicalCenter: '4.5',
    ),

    Doctor(
      imagePath: 'icons/doctor3.jpg',
      name: 'Natasha Tobbie',
      email: 'natetobbie@eezimeds.com',
      number: '3',
      medicalCenter: '4.5',
    ),

    Doctor(
      imagePath: 'icons/doctor2.jpg',
      name: 'Osamu Dazai',
      email: 'dazaiosamu@eezimeds.com',
      number: '3',
      medicalCenter: '4.5',
    ),

    Doctor(
      imagePath: 'icons/doctor2.jpg',
      name: 'Gon Freecs',
      email: 'freecsgon@eezimeds.com',
      number: '3',
      medicalCenter: '4.5',
    ),
  ];

  List<Doctor2> doctors2 = [
    Doctor2(
      imagePath: 'icons/doctor1.jpg',
      name: 'Matthew',
        occupation: 'Dentist'

    ),

    Doctor2(
      imagePath: 'icons/doctor3.jpg',
      name: 'Natasha',
        occupation: 'Dentist'

    ),

    Doctor2(
      imagePath: 'icons/doctor2.jpg',
      name: 'Osamu',
        occupation: 'Dentist'

    ),

    Doctor2(
      imagePath: 'icons/doctor2.jpg',
      name: 'Gon',
        occupation: 'Dentist'

    ),
  ];



  List<Doctor> filteredDataList = [];
  List<Doctor2> filteredDataList2 = [];
  @override
  void initState() {
    super.initState();
    // At the beginning, show all the data
    filteredDataList = doctors;
    filteredDataList2 = doctors2;
  }

  final searchController = TextEditingController();

  void _filterData(String searchQuery) {
    List<Doctor> filteredList = [];
    if (searchQuery.isNotEmpty) {
      // Filter the data based on the search query
      filteredList = doctors
          .where((doctor) =>
          doctor.name!.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    } else {
      // If the search query is empty, show all the data
      filteredList = doctors;
    }
    setState(() {
      filteredDataList = filteredList;
    });
  }
  //TODO: add send email functionality
  showModalSheet(context) => showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      isScrollControlled: true,

      context: context,
      builder: (BuildContext context){
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            right: 13,
            left: 13,
            top: 13,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
          ),
          height: MediaQuery.of(context).size.height * 0.47,
          child: Center(child: buildContactForm()),
        );
      }
  );

  final subjectController =  TextEditingController();
  final messageController = TextEditingController();

  Widget buildContactForm() => Padding(
    padding: EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Send Message',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
          ),

          SizedBox(height: 15,),

          Text('Subject'),
          TextFormField(
            controller: subjectController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              hintText: 'subject',
              alignLabelWithHint: true,
              label: Text('subject'),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            ),
          ),

          SizedBox(height: 10,),

          Text('Message'),
          TextFormField(
            controller: messageController,
            maxLines: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              hintText: 'Type your message here.....',
              alignLabelWithHint: true,
              label: Text('message'),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            ),
          ),

          SizedBox(height: 10,),

          ElevatedButton.icon(
            icon: Icon(Icons.send),
            label: Text('Send Message'),
            onPressed: (){},
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.blue,
                minimumSize: Size(250, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )
            ),
          ),

        ],
      ),
    ),
  );
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,

          title: Text('Doctors'),
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
            TextButton(
              onPressed: () {
                showModalBottomSheet(context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context){
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: SizedBox(

                      height: 200,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Filters by Specialist', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          ),

                          // icons
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'icons/heart2.png',
                                      height: 40,
                                      width: 30,
                                    ),
                                    Text('Cardiology')
                                  ],
                                ),
                                SizedBox(width: 30,),
                                Column(
                                  children: [
                                    Image.asset(
                                      'icons/lungs.png',
                                      height: 40,
                                      width: 30,
                                    ),
                                    Text('Pulmonologist')
                                  ],
                                ),

                                SizedBox(width: 30,),
                                Column(
                                  children: [
                                    Image.asset(
                                      'icons/brain.png',
                                      height: 40,
                                      width: 30,
                                    ),
                                    Text('Neurologist')
                                  ],
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 20,),

                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'icons/heart2.png',
                                      height: 40,
                                      width: 30,
                                    ),
                                    Text('Cardiology')
                                  ],
                                ),
                                SizedBox(width: 30,),
                                Column(
                                  children: [
                                    Image.asset(
                                      'icons/skin.png',
                                      height: 40,
                                      width: 30,
                                    ),
                                    Text('Dermatologist')
                                  ],
                                ),

                                SizedBox(width: 30,),
                                Column(
                                  children: [
                                    Image.asset(
                                      'icons/brain.png',
                                      height: 40,
                                      width: 30,
                                    ),
                                    Text('Neurologist')
                                  ],
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                    }
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'icons/filter.png',
                  height: 40,
                  width: 30,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),

        body: Column(
          children: [
            // SizedBox(
            //   height: 80,
            //   child: Center(
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: TextField(
            //         controller: searchController,
            //         onChanged: (value) {
            //           _filterData(value);
            //         },
            //         decoration: InputDecoration(
            //           contentPadding:
            //           EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            //           alignLabelWithHint: true,
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(30.0),
            //             borderSide: BorderSide(width: 0.8),
            //           ),
            //           hintText: 'search by doctor name',
            //           suffixIcon: IconButton(
            //             icon: Icon(Icons.search, size: 28.0),
            //             onPressed: () {},
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,

                  child:
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.all(8.0),
                        shrinkWrap: true,
                        itemCount: filteredDataList2.length,
                        itemBuilder: (context, index) {
                          Doctor2 doctor = filteredDataList2[index];
                          return MyDoctors2(
                            imagePath: doctor.imagePath,
                            name: doctor.name,
                            occupation: doctor.occupation,
                          );
                        },
                      ),

                ),
              ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Nearby Doctor', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text('See more', style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),)
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(8.0),
                shrinkWrap: true,
                itemCount: filteredDataList.length,
                itemBuilder: (context, index) {
                  Doctor doctor = filteredDataList[index];
                  return MyDoctors(
                    imagePath: doctor.imagePath,
                    name: doctor.name,
                    number: doctor.number,
                    email: doctor.email,
                    medicalCenter: doctor.medicalCenter,
                    contactFunction: () => showModalSheet(context),
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}

class Doctor {
  final String? imagePath;
  final String? name;
  final String? email;
  final String? number;
  final String? medicalCenter;

  Doctor({
    this.imagePath,
    this.name,
    this.email,
    this.number,
    this.medicalCenter,
  });
}


class Doctor2 {
  final String? imagePath;
  final String? name;
  final String? occupation;


  Doctor2({
    this.imagePath,
    this.name,
    this.occupation,

  });
}


