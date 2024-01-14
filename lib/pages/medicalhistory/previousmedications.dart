import 'package:flutter/material.dart';

import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import 'components/medicationcomponent.dart';

class PreviousMedication extends StatefulWidget{
  const PreviousMedication({Key ? key}): super(key : key);

  State<PreviousMedication> createState() => _PreviousMedicationState();
}

class _PreviousMedicationState extends State<PreviousMedication>{
  final searchController = TextEditingController();

  //TODO: Relace lists with db data
  List<Medication> medication = [
    Medication(
      drug: 'Amlodipine',
      dateStarted: '2023-03-14',
      dosage: '5mg once daily',
      purpose: 'High blood pressure treatment.',
    ),
    Medication(
      drug: 'Lisinopril',
      dateStarted: '2023-06-28',
      dosage: '10mg once daily',
      purpose: 'Hypertension treatment.',
    ),
    Medication(
      drug: 'Metformin',
      dateStarted: '2023-03-14',
      dosage: '500mg twice daily',
      purpose: 'Anti-diabetic medication.',
    ),
    Medication(
      drug: 'Ibruprofen',
      dateStarted: '2023-05-08',
      dosage: '400mg every 4 to 6 hours',
      purpose: 'Pain and inflammation relief.',
    ),

    Medication(
      drug: 'Ibruprofen',
      dateStarted: '2023-05-08',
      dosage: '400mg every 4 to 6 hours',
      purpose: 'Pain and inflammation relief.',
    ),

  ];

  List<Medication> filteredDataList = [];

  @override
  void initState() {
    super.initState();
    // At the beginning, show all the data
    filteredDataList = medication;
  }

  void _filterData(String searchQuery) {
    List<Medication> filteredList = [];
    if (searchQuery.isNotEmpty) {
      // Filter the data based on the search query
      filteredList = medication
          .where((doctor) =>
          doctor.drug!.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    } else {
      // If the search query is empty, show all the data
      filteredList = medication;
    }
    setState(() {
      filteredDataList = filteredList;
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
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
                        'Previous Medications',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                SizedBox(
                  height: 80,
                  child: //search bar
                  Center(
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
                            hintText: 'search by drug name',
                            suffixIcon: IconButton(icon: Icon(Icons.search, size: 28.0,), onPressed:(){} ,)

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
                      Medication medication = filteredDataList[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MedicationComponent(
                            drug: medication.drug,
                            dosage: medication.dosage,
                            purpose: medication.purpose,
                            dateStarted: medication.dateStarted,
                          ),

                          SizedBox(height: 10,),
                        ],
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

class Medication {
  final String? drug;
  final String? dateStarted;
  final String? dosage;
  final String? purpose;

  Medication({
    this.drug,
    this.dateStarted,
    this.dosage,
    this.purpose,
  });
}



