import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import '../../components/bottomnavigationbar.dart';

class ViewDoctor extends StatefulWidget{
  final String? imagePath;
  final String? doctorName;
  final String? doctorLocation;
  final String? callTime;


  const ViewDoctor({
    Key ? key,
    this.imagePath,
    this.doctorName,
    this.callTime,
    this.doctorLocation
  }): super(key : key);


  State<ViewDoctor> createState() => _ViewDoctorState();
}

class _ViewDoctorState extends State<ViewDoctor>{

  //send email function
  //replace recipient with doctor's email
  sendEmail(String subject, String body, String recipient) async{
    try{
      final Email email = Email(
        body: body,
        subject: subject,
        recipients: [recipient],
        isHTML: false,
      );

      await FlutterEmailSender.send(email);
    }catch (e){
      print(e.toString());
    }

  }

  final subjectController =  TextEditingController();
  final messageController = TextEditingController();

  Widget buildEmailForm() => SingleChildScrollView(
    physics: AlwaysScrollableScrollPhysics(),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Center(
          child: Text('Send Message',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
        ),

        SizedBox(height: 10,),

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

        SizedBox(height: 5,),

        Text('Message'),
        TextFormField(
          controller: messageController,
          maxLines: 9,
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

        ElevatedButton(
          child: Text('Send'),
          onPressed: () => sendEmail(subjectController.text, messageController.text, 'tafadzwa.xxiii@gmail.com'),
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
  );


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      //Picture Of Doctor
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          widget.imagePath!,
                          width: 95,
                          height: 95,
                        ),
                      ),

                      SizedBox(width: 20,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Doctor Name
                          Text(
                            widget.doctorName!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),

                          SizedBox(height: 12,),

                          //doctor's location
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_on, size: 19,),

                              SizedBox(width: 9,),

                              Text(widget.doctorLocation!, style: TextStyle(fontSize: 15),),
                            ],
                          ),

                          SizedBox(height: 13,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.access_time, size: 18, ),

                              SizedBox(width: 9,),

                              Text(widget.callTime!, style: TextStyle(fontSize: 15)),
                            ],
                          ),

                          SizedBox(height: 10,),

                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25,),

              //rest of the details
              //qualifications
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.person, size: 15,),
                          SizedBox(width: 3,),
                          Text('General Doctor with 9 years of experience. ', style: TextStyle(fontSize: 13),),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text('Qualifications', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),

                      SizedBox(height: 10,),

                      Text(
                        'Bsc Honours In Bio Medical Science(BMS), UZ 2006',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'Bsc Honours in Medicine and Surgery(MBBS), NUST 2010',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20,),

              //personal details
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 900,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('National ID'),

                          SizedBox(width: 50,),

                          Text('42-2012680Z11'),
                        ],
                      ),

                      SizedBox(height: 5,),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date Of Birth:'),

                          SizedBox(width: 40),

                          Text('1990-07-12'),
                        ],
                      ),

                      SizedBox(height: 5,),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Gender:'),

                          SizedBox(width: 80),

                          Text('Male'),
                        ],
                      ),

                      SizedBox(height: 5,),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Registration Date:'),

                          SizedBox(width: 20),

                          Text('2023-07-12'),
                        ],
                      ),

                      SizedBox(height: 5,),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Phone Number:'),

                          SizedBox(width: 30),

                          Text('+263773368966'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(height: 20,),

              //job details
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 900,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Doctor Type:'),

                          SizedBox(width: 50,),

                          Text('General Doctor'),
                        ],
                      ),

                      SizedBox(height: 5,),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Operating Id:'),

                          SizedBox(width: 50),

                          Text('235RTE45')
                        ],
                      ),

                      SizedBox(height: 5,),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Services:'),

                          SizedBox(width: 70,),

                          Text('General Medicine'),
                        ],
                      ),

                      SizedBox(height: 5,),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Specialization:'),

                          SizedBox(width: 35,),

                          Text('General medicine')

                        ],
                      ),
                    ],
                  ),
                ),
              ),



              SizedBox(height: 30,),

              //rating section
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
                        'Rate your experience with this doctor.',
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

              SizedBox(height: 20,),

              Center(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.chat),
                  label:Text('Send A Message'),
                  onPressed: () => showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    context: context,
                    builder: (BuildContext context){
                      return Padding(
                        padding: EdgeInsets.all(13),
                        child: buildEmailForm(),
                      );
                    }
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.blue,
                    minimumSize: Size(300,50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
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