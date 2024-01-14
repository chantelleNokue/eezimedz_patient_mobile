import 'package:Eezimedz_Patients/pages/Screens/homeScreens.dart';
import 'package:Eezimedz_Patients/pages/invoices/viewinvoices.dart';
import 'package:Eezimedz_Patients/pages/reports/reports.dart';
import 'package:Eezimedz_Patients/pages/vitalsigns/viewVitals.dart';
import 'package:flutter/material.dart';
import '../services/patient/patientservice.dart';


import 'components/bottomnavigationbar.dart';
import 'components/drawercomponent.dart';
// import 'eezimedz_deliveries/HomePage.dart';
// import 'eezimed_deliveries/lib/pages/HomePage.dart';

import 'deliveries/pages/HomePage.dart';
import 'profile.dart';
import 'appointments/appointmentsmenu.dart';
import 'patientdetails/detailsmenu.dart';
import 'payments/paymentsmenu.dart';
import 'doctors/doctors.dart';
import 'prescriptions/prescriptionsmenu.dart';
import 'labtests/labtestsmenu.dart';
import 'quotations/quotationsmenu.dart';
import 'surgeries/viewsurgeries.dart';
import 'doctornotes/notes.dart';
import 'documents/documents.dart';
import 'medicalhistory/medicalhistorymenu.dart';
import 'reviews/reviews.dart';
import 'billingstatements/billingstatements.dart';
import 'mycalendar/mycalendar.dart';
import 'dental/dentalmenu.dart';
import 'myvisits/myvisits.dart';
import 'admissions/admissions.dart';
import 'claims/claimsmenu.dart';
import 'walletBalancies/wallertBalancies.dart';


class HomePage extends StatefulWidget{
  const HomePage({Key ? key}): super(key : key);

  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{


  @override
  void initState(){
    super.initState();
    PatientService();
  }

  @override
  Widget build(BuildContext context ){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Home Page'),
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

      body: Column(
        children: <Widget>[
          PhysicalModel(
              color: Colors.white,
              shadowColor: Colors.blue,
              elevation: 8,
              child: Container(
                //Top part container with the image on the home page
                width: MediaQuery.of(context).size.width,
                height: 90,//MediaQuery.of(context).size.height,
                child: Image.asset(
                  'icons/logo.png',
                  fit: BoxFit.fitHeight,
                ),
              )
          ),

          SizedBox(height: 10,),

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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsMenu())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/patient.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('My Details',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),

            //build appointments widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppointmentsMenu())),
                  //() => _showClaimsDialog(context),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/appointments.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Appointments',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),

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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewVitals())),
                  //() => _showClaimsDialog(context),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/vitals.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Vital Signs',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),



            //build doctors notes widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notes())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/notes.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Doctor\'s Notes',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),
//build nurse notes
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notes())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/notes.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Nurse\'s Notes',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),

            //build doctors widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Doctors())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/doctor.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('My Doctors',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),


            //build surgeries widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewSurgeries())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/surgeries.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Surgeries',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),



            //build prescriptions widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrescriptionsMenu())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/prescription.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('My Prescriptions',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),


            //build documents widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Documents())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/documents.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('My Documents',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],//() => _showClaimsDialog(context),
                  ),
                ),
              ),
            ),


            //build medical history widgets
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoryMenu())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/medicalhistory.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Medical History',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),


            //build payments widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentsMenu())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/payments.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('My Payments',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),


            //build billing statements widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => BillingStatements())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/billingstatements.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Billing Statements',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,),)
                      )
                    ],
                  ),
                ),
              ),
            ),


            //build billing statements widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewInvoices())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/invoicess.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Invoices',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,),)
                      )
                    ],
                  ),
                ),
              ),
            ),



            //build quotations widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuotationsMenu())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/quotations.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('My Quotations',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),


            //build test results widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LabTestsMenu())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/testresults.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Lab Tests',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),


            //build reviews widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reviews())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/reviews.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Reviews',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),


            //build my calendar widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyCalendar())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/mycalendar.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('My Calendar',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),


            //build dental widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => DentalMenu())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/dentalhistory.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Dental',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),


            //build my visits widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyVisits())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/hospitalvisits.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Hospital Visits',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),


            //build admissions widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Admissions())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/admissions.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Admissions',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),


            //build eye health widget
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClaimsMenu())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/claims.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Claims',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),

            //build reports
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reports())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/report.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Reports',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),

            //build reports
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePageDeliveries())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/buymedicine.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Buy Medicine',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),




            ),

            //wallet balancies
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => WalletBalancies())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/wallet.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Wallet Balancies',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),




            ),
            //Screens

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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen())),
                  child: Column(
                    children: [
                      Expanded(
                          flex:2,
                          child: Image.asset('icons/wallet.png')
                      ),
                      Expanded(
                          flex: 1,
                          child: Text('Screen',style: TextStyle(fontWeight: FontWeight.bold),)
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
    bottomNavigationBar: NavBar(),
    );
  }
}

