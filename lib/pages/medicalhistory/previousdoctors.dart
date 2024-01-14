import 'package:flutter/material.dart';

import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import 'components/doctorcomponent.dart';

class PreviousDoctors extends StatefulWidget{
  const PreviousDoctors({Key ? key}): super(key : key);

  State<PreviousDoctors> createState() => _PreviousDoctorsState();
}

class _PreviousDoctorsState extends State<PreviousDoctors>{
  //LISTS
  List<Doctor> doctors = [
    Doctor(
      imagePath: 'icons/doctor1.jpg',
      name: 'Matthew Blythe',
      email: 'matthewblythe@eezimeds.com',
      number: '+263773368966',
      medicalCenter: 'Malborough Medical Center',
    ),

    Doctor(
      imagePath: 'icons/doctor3.jpg',
      name: 'Natasha Tobbie',
      email: 'natetobbie@eezimeds.com',
      number: '+263782828756',
      medicalCenter: 'Mt Pleasant Medical Center',
    ),

    Doctor(
      imagePath: 'icons/doctor2.jpg',
      name: 'Osamu Dazai',
      email: 'dazaiosamu@eezimeds.com',
      number: '+263773368966',
      medicalCenter: 'Port Mafia Medical Center',
    ),

    Doctor(
      imagePath: 'icons/doctor2.jpg',
      name: 'Gon Freecs',
      email: 'freecsgon@eezimeds.com',
      number: '+263773368966',
      medicalCenter: 'Port Mafia Medical Center',
    ),
  ];

  List<Doctor> filteredDataList = [];

  @override
  void initState() {
    super.initState();
    // At the beginning, show all the data
    filteredDataList = doctors;
  }

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


  //search controller
  final searchController = TextEditingController();
  
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

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Medical History'),
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
          physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(11),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.grey[200],
                    ),
                    child: Center(
                      child: Text(
                        'Previous Doctors',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                SizedBox(
                  height: 80,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value){
                          _filterData(value);
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(width: 0.8),
                            ),
                            hintText: 'search by doctor name',
                            suffixIcon: IconButton(icon: Icon(Icons.search, size: 28.0,), onPressed:(){} ,
                            ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 600,
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.all(8.0),
                    shrinkWrap: true,
                    itemCount: filteredDataList.length,
                    itemBuilder: (context, index){
                      Doctor doctor = filteredDataList[index];
                      return DoctorComponent(
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
        ),
      ),

      bottomNavigationBar: NavBar(),
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
