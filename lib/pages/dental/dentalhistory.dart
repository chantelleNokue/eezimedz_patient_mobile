import 'package:flutter/material.dart';

import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import 'components/patientinfo.dart';
import 'components/historycomponent.dart';

class DentalHistory extends StatefulWidget{
  const DentalHistory({Key ? key}): super(key : key);

  State<DentalHistory> createState() => _DentalHistoryState();
}

class _DentalHistoryState extends State<DentalHistory>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Dental History'),
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
        child: Column(
          children: [
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.all(8.0),
                width: 900,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Dental History',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),

           Column(
             mainAxisSize: MainAxisSize.min,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 'Patient Information',
                 style: TextStyle(
                   fontWeight: FontWeight.w600,
                   fontSize: 18,
                 ),
               ),
               PatientInfo(
                 imagePath: 'icons/patient.jpg',
                 name: 'Natasha Tobbie',
                 gender: 'Female',
                 region: 'Harare',
                 smoker: 'Yes',
                 sn: 'N/A',
               ),
             ],
           ),

            SizedBox(height: 15,),

            SizedBox(
              height: 453,
              child: ListView(
                padding: EdgeInsets.all(8.0),
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(height: 5,),

                  HistoryComponent(
                    procedureDate: '2023-07-13',
                    procedureTime: '12:00',
                    procedure: 'Gum Surgery',
                    diagnosis: 'Gingivitis',
                    treatment: 'Dental Cleaning',
                    center: 'Port Mafia Center',
                    dentist: 'Osamu Dazai',
                  ),

                  SizedBox(height: 5,),

                  HistoryComponent(
                    procedureDate: '2023-07-13',
                    procedureTime: '12:00',
                    procedure: 'Gum Surgery',
                    diagnosis: 'Gingivitis',
                    treatment: 'Dental Cleaning',
                    center: 'Port Mafia Center',
                    dentist: 'Osamu Dazai',
                  ),

                  SizedBox(height: 5,),

                  HistoryComponent(
                    procedureDate: '2023-07-13',
                    procedureTime: '12:00',
                    procedure: 'Gum Surgery',
                    diagnosis: 'Gingivitis',
                    treatment: 'Dental Cleaning',
                    center: 'Port Mafia Center',
                    dentist: 'Osamu Dazai',
                  ),

                  SizedBox(height: 5,),

                  HistoryComponent(
                    procedureDate: '2023-07-13',
                    procedureTime: '12:00',
                    procedure: 'Gum Surgery',
                    diagnosis: 'Gingivitis',
                    treatment: 'Dental Cleaning',
                    center: 'Port Mafia Center',
                    dentist: 'Osamu Dazai',
                  ),

                  SizedBox(height: 5,),

                ],
              ),
            ),


          ],
        ),
      ),

      bottomNavigationBar: NavBar(),
    );
  }
}