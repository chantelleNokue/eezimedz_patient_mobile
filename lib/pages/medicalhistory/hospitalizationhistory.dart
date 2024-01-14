import 'package:flutter/material.dart';

import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import 'components/hospitalcomponent.dart';

class HospitalizationHistory extends StatefulWidget{
  const HospitalizationHistory({Key ? key}): super(key : key);

  State<HospitalizationHistory> createState() => _HospitalizationHistoryState();
}

class _HospitalizationHistoryState extends State<HospitalizationHistory>{
  //search controller
  final searchController = TextEditingController();

  List<Hospital> hospital = [
    Hospital(
      reason: 'Urinary Tract Infection',
      date: '2023-01-13',
      hospitalName: 'Harare Hospital',
      doctorName: 'Matthew Blythe',
      medication: 'Ciprofloxacin',
    ),
    Hospital(
      reason: 'Urinary Tract Infection',
      date: '2023-01-13',
      hospitalName: 'Harare Hospital',
      doctorName: 'Matthew Blythe',
      medication: 'Ciprofloxacin',
    ),
    Hospital(
      reason: 'Urinary Tract Infection',
      date: '2023-01-13',
      hospitalName: 'Harare Hospital',
      doctorName: 'Matthew Blythe',
      medication: 'Ciprofloxacin',
    ),
    Hospital(
      reason: 'Urinary Tract Infection',
      date: '2023-01-13',
      hospitalName: 'Harare Hospital',
      doctorName: 'Matthew Blythe',
      medication: 'Ciprofloxacin',
    ),
    Hospital(
      reason: 'Urinary Tract Infection',
      date: '2023-01-13',
      hospitalName: 'Harare Hospital',
      doctorName: 'Matthew Blythe',
      medication: 'Ciprofloxacin',
    ),
  ];

  List<Hospital> filteredDataList = [];

  @override
  void initState() {
    super.initState();
    // At the beginning, show all the data
    filteredDataList = hospital;
  }

  void _filterData(String searchQuery) {
    List<Hospital> filteredList = [];
    if (searchQuery.isNotEmpty) {
      // Filter the data based on the search query
      filteredList = hospital
          .where((hospital) =>
          hospital.hospitalName!.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    } else {
      // If the search query is empty, show all the data
      filteredList = hospital;
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
                        'Hospital History',
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
                            hintText: 'search by hospital name',
                            suffixIcon: IconButton(icon: Icon(Icons.search, size: 28.0,), onPressed:(){} ,)

                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 600,
                  child: ListView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.all(8.0),
                    shrinkWrap: true,
                    children: [
                      HospitalComponent(
                        reason: 'Urinary Tract Infection',
                        date: '2023-01-13',
                        hospitalName: 'Harare Hospital',
                        doctorName: 'Matthew Blythe',
                        medication: 'Ciprofloxacin',
                      ),

                      SizedBox(height: 10),

                      HospitalComponent(
                        reason: 'Urinary Tract Infection',
                        date: '2023-01-13',
                        hospitalName: 'Harare Hospital',
                        doctorName: 'Matthew Blythe',
                        medication: 'Ciprofloxacin',
                      ),

                      SizedBox(height: 10),

                      HospitalComponent(
                        reason: 'Urinary Tract Infection',
                        date: '2023-01-13',
                        hospitalName: 'Harare Hospital',
                        doctorName: 'Matthew Blythe',
                        medication: 'Ciprofloxacin',
                      ),

                      SizedBox(height: 10),

                      HospitalComponent(
                        reason: 'Urinary Tract Infection',
                        date: '2023-01-13',
                        hospitalName: 'Harare Hospital',
                        doctorName: 'Matthew Blythe',
                        medication: 'Ciprofloxacin',
                      ),

                      SizedBox(height: 10),

                      HospitalComponent(
                        reason: 'Urinary Tract Infection',
                        date: '2023-01-13',
                        hospitalName: 'Harare Hospital',
                        doctorName: 'Matthew Blythe',
                        medication: 'Ciprofloxacin',
                      ),
                    ],
                  ),
                )

              ],
            )
        ),
      ),

      bottomNavigationBar: NavBar(),
    );
  }

}

class Hospital{
  final String? reason;
  final String? date;
  final String? hospitalName;
  final String? doctorName;
  final String? medication;

  Hospital({
    this.reason,
    this.date,
    this.hospitalName,
    this.doctorName,
    this.medication,
});
}


