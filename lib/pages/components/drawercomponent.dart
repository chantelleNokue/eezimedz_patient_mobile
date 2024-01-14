import 'package:Eezimedz_Patients/pages/payments/components/makepayment/makepayment.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:telegram/telegram.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../profile.dart';
import '../appointments/viewappointments.dart';
import '../labtests/testresults.dart';
import '../payments/viewpayments.dart';
import '../medicalhistory/hospitalizationhistory.dart';

class DrawerClass extends StatelessWidget {
  //get user information from firebase
  final _user = FirebaseAuth.instance.currentUser!;
  final _auth = FirebaseAuth.instance;

  //TODO: reduce font size

  //method to launch telegram contact
  //TODO: change to eazimeds username
  _launchTelegram(){
    Telegram.send(
      username: 'D_naaii',
      message: "Hie, I would like to enquire about InsureHub services",
    );
  }

  //method to launch sms contact
  //TODO: change to eazimeds number
  String _message = "Hie, I would like to enquire about InsureHub services.";
  List<String> _recipients = ['0776125672'];

  void _sendSMS(String _message, List<String> _recipients) async{
    String _result = await sendSMS(message: _message, recipients: _recipients)
        .catchError((onError){
      print(onError);
    });
    print(_result);
  }

  //method to launch whatsapp contact
  //TODO: change to eazimeds contact
  _launchWhatsapp() async{
    final _link = WhatsAppUnilink(
        phoneNumber: '+263776125672',
        text: 'Hey I would like to enquire about InsureHub services'
    );

    await launch('$_link');
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.65, //set dawer width
      elevation: 3,
      child: Material(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: InkWell(
                  highlightColor: Colors.lightBlue,
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: Image.asset(
                            'icons/profile.png'
                        ),
                        radius: 50,
                      ),

                      Text(
                        _user.displayName.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),

                      SizedBox(height: 5,),

                      Text(
                        _user.email!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),


                    ],
                  ),

                ),
              ),
            ),
            SizedBox(height: 15,),

            Divider(
              color: Colors.grey[80],
              height: 3,
              thickness: 2,
            ),

            SizedBox(height: 15,),

            ListTile(
              leading: FaIcon(FontAwesomeIcons.list, size: 23, color: Colors.black,),
              title:Text(
                'Appointments',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewAppointments()));
              },
            ),

            ListTile(
              leading: FaIcon(FontAwesomeIcons.listCheck, size: 23, color: Colors.black,),
              title: Text(
                'Lab Results',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TestResults()));
              },
            ),

            ListTile(
              leading:FaIcon(FontAwesomeIcons.moneyBill, size: 23, color: Colors.black,),
              title: Text(
                'Make Payment',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPayments()));
              },
            ),

            ListTile(
              leading:FaIcon(FontAwesomeIcons.hospital, size: 23, color: Colors.black,),
              title: Text(
                'Hospitalization History',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HospitalizationHistory()));
              },
            ),


            ListTile(
              leading:FaIcon(FontAwesomeIcons.arrowsUpDown, size: 23, color: Colors.black,),
              title: Text(
                'Loyalty Points',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              onTap: (){
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Rewards()));
              },
            ),

            Divider(
              color: Colors.grey[80],
              height: 3,
              thickness: 2,
            ),

            Column(
              children: <Widget>[
                Text(
                  'Contact Us: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () => _launchWhatsapp(),
                        icon: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green),
                      ),

                      IconButton(
                          onPressed: () => _sendSMS(_message, _recipients),
                          icon: Icon(Icons.sms)
                      ),

                      IconButton(
                        onPressed: () => _launchTelegram(),
                        icon:  FaIcon(FontAwesomeIcons.telegram, color: Colors.blue,),
                      ),

                    ],
                  ),
                )
              ],
            ),

            Divider(
              color: Colors.grey[80],
              height: 3,
              thickness: 2,
            ),

            ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              onTap: (){
                _auth.signOut();
              },
            ),

          ],

        ),
      ),

    );
  }
}