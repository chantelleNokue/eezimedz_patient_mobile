import 'package:flutter/material.dart';
import '../components/treatmentcomponent.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class TreatmentDetails extends StatefulWidget{
  const TreatmentDetails({Key ? key}): super(key : key);


  State<TreatmentDetails> createState() => _TreatmentDetailsState();
}


class _TreatmentDetailsState extends State<TreatmentDetails>{


  //contact service provider fucntionality
  final subjectController =  TextEditingController();
  final messageController = TextEditingController();

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

  Widget buildContactForm() => Padding(
    padding: const EdgeInsets.all(10.0),
    child: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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

          SizedBox(height: 15,),

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
        ],
      ),
    ),
  );

  final searchController = TextEditingController();

  List<Visit> visits = [
    Visit(
      serviceProvider: 'Panashe Budzinike',
      providerRef: 'CR16278',
      regDate: '2023-01-03',
      date: '2023-06-07',
      medicalCenter: 'Arcadia Medical Center',
      services: 'Salvage, SR, VD',
      amount: '230',
    ),
    Visit(
      serviceProvider: 'Sunlight Budzinike',
      providerRef: 'CR16278',
      regDate: '2023-01-03',
      date: '2023-06-07',
      medicalCenter: 'Arcadia Medical Center',
      services: 'Salvage, SR, VD',
      amount: '110',
    ),
    Visit(
      serviceProvider: 'Shannon Mpofu',
      providerRef: 'CR16278',
      regDate: '2023-01-03',
      date: '2023-06-07',
      medicalCenter: 'Arcadia Medical Center',
      services: 'Salvage, SR, VD',
      amount: '130',
    ),
    Visit(
      serviceProvider: 'Kundai Budzinike',
      providerRef: 'CR16278',
      regDate: '2023-01-03',
      date: '2023-06-07',
      medicalCenter: 'Arcadia Medical Center',
      services: 'Salvage, SR, VD',
      amount: '250',
    ),
    Visit(
      serviceProvider: 'Andile Dube',
      providerRef: 'CR16278',
      regDate: '2023-01-03',
      date: '2023-06-07',
      medicalCenter: 'Arcadia Medical Center',
      services: 'Salvage, SR, VD',
      amount: '300',
    ),
  ];

  List<Visit> filteredDataList = [];


  @override
  void initState() {
    super.initState();
    // At the beginning, show all the data
    filteredDataList = visits;
  }

  void _filterData(String searchQuery) {
    List<Visit> filteredList = [];
    if (searchQuery.isNotEmpty) {
      // Filter the data based on the search query
      filteredList = visits
          .where((visits) =>
          visits.date!.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    } else {
      // If the search query is empty, show all the data
      filteredList = visits;
    }
    setState(() {
      filteredDataList = filteredList;
    });
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
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
                        hintText: 'search by date',
                        suffixIcon: IconButton(icon: Icon(Icons.search, size: 28.0,), onPressed:(){} ,)

                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 550,
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(8.0),
                shrinkWrap: true,
                itemCount: filteredDataList.length,
                itemBuilder: (context, index){
                  Visit visit = filteredDataList[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TreatmentComponent(
                        services: visit.services,
                        date: visit.date,
                        amount: visit.amount,
                        medicalCenter: visit.medicalCenter,
                        providerRef: visit.providerRef,
                        regDate: visit.regDate,
                        serviceProvider: visit.serviceProvider,
                        contactfunction: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              title: Text('Send Message To ${visit.serviceProvider!}', style: TextStyle(fontSize: 13),),
                              actionsAlignment: MainAxisAlignment.spaceEvenly,
                              scrollable: true,
                              actions: [
                                TextButton(
                                  child: Text('Close'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),

                                TextButton(
                                  child: Text('Send'),
                                  onPressed: () => sendEmail(subjectController.text, messageController.text, 'tafadzwa.xxiii@gmail.com'),
                                ),
                              ],
                              content: buildContactForm(),
                            )

                        ),
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
    );
  }
}


class Visit{
  final String? serviceProvider;
  final String? providerRef;
  final String? regDate;
  final String? date;
  final String? medicalCenter;
  final String? services;
  final String? amount;

  Visit({
    this.serviceProvider,
    this.providerRef,
    this.regDate,
    this.date,
    this.medicalCenter,
    this.amount,
    this.services,
  });
}
