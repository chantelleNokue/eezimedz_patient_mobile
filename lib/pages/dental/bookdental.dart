import 'package:flutter/material.dart';
import 'package:flutter_dropdown_x/flutter_dropdown_x.dart';

import '../profile.dart';
import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import '../components/successdialog.dart';
import 'dentalmenu.dart';
import '../components/listitemsclass.dart';


class BookDental extends StatefulWidget{
  const BookDental({Key ? key}): super(key : key);


  State<BookDental> createState() => _BookDentalState();
}

class _BookDentalState extends State<BookDental>{
  //success dialog
  void _showSuccessDialog(context) => showDialog(
    context: context,
    builder: (context) => SuccessDialog(toClass: DentalMenu()),
  );

  //controllers
  final numberController = TextEditingController();


  //variables
  DateTime appointmentDate = DateTime.now();
  TimeOfDay appointmentTime = TimeOfDay.now();
  String? medicalcenter;

  //widget build methods
  Widget buildPatient() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name', style: TextStyle(fontSize: 14)),
        SizedBox(height: 3,),
        Container(
          width:350,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black38,
                  width: 1.0
              ),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Center(child:Text('Natasha Tobbie', style: TextStyle(fontSize: 15)),),
        ),

        SizedBox(height: 10,),

        Text('ID Number', style: TextStyle(fontSize: 14)),
        SizedBox(height: 3,),
        Container(
          width:350,
          padding:EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black38,
                  width: 1.0
              ),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Center(child:Text('42 2012680Z42', style: TextStyle(fontSize: 15)),),
        ),

        SizedBox(height: 10,),


        Text('Gender', style: TextStyle(fontSize: 14)),
        SizedBox(height: 3,),
        Container(
          width:350,
          padding:EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black38,
                  width: 1.0
              ),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Center(child:Text('Female', style: TextStyle(fontSize: 15)),),
        ),

        SizedBox(height: 10,),

        Text('Phone Number', style: TextStyle(fontSize: 14)),
        SizedBox(height: 3,),
        Container(
          width: 350,
          padding:EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black38,
                  width: 1.0
              ),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Center(child:Text('+263 773368966', style: TextStyle(fontSize: 15)),),
        ),
      ],
    ),
  );

  Widget buildAppointment() => Padding(
    padding: EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Teeth Glossary'),
        Container(
          height: 200,
          width: 400,
          child: Image.asset(
            'icons/teethglossary.jpg',
            fit: BoxFit.cover,
          ),
        ),

        SizedBox(height: 10,),
        //TODO: assign numbers to teeth
        Text('Enter Number(s) Corresponding To The Affected Tooth'),
        SizedBox(
          width: 280,
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: numberController,
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
              label: Text('Affected Tooth'),
              hintText: 'Affected Tooth',
              suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: () => numberController.clear(),),
            ),
          ),
        ),

        SizedBox(height: 10,),

        Text('Appointment Date'),
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
                  "${appointmentDate.year} - ${appointmentDate.month} - ${appointmentDate.day}",
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
                  initialDate: appointmentDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                );

                if(dateTime != null){
                  setState(() {
                    appointmentDate = dateTime;
                  });
                }
              },
            ),
          ],
        ),

        SizedBox(height: 10,),

        Text('Appointment Time'),
        SizedBox(height: 5,),
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
                  "${appointmentTime.hour}: ${appointmentTime.minute}",
                ),
              ),
            ),
            MaterialButton(
              child: Text('Choose Time'),
              color: Colors.blueGrey,
              hoverColor: Colors.lightBlueAccent,
              elevation: 4,
              onPressed: () async{
                final TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: appointmentTime,
                  initialEntryMode: TimePickerEntryMode.dial,
                );

                if(time != null){
                  setState(() {
                    appointmentTime = time;
                  });
                }
              },
            ),
          ],
        ),

        SizedBox(height: 10,),

        Text('Medical Center'),
        SizedBox(
          height: 80,
          width: 320,
          child: DropDownField(
            value: medicalcenter,
            hintText: 'Select',
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

      ],
    ),
  );

  //stepper items
  //list of steps
  int stepperIndex = 0;
  List<Step> getSteps() => [
    Step(
      title: Text('Patient Details', style: TextStyle(fontSize: 13),),
      subtitle: Text('Please confirm your details.', style: TextStyle(fontSize: 9),),
      content: buildPatient(),
      isActive: stepperIndex >= 0,
    ),

    Step(
      title: Text('Appointment Details', style: TextStyle(fontSize: 13),),
      subtitle: Text('Please enter the necessary details.', style: TextStyle(fontSize: 9),),
      content: buildAppointment(),
      isActive: stepperIndex >= 1,
    ),
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Dental'),
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

      body: Container(
        constraints: BoxConstraints(maxWidth: 500.0),
        child: Stepper(
          elevation: 2,
          type: StepperType.horizontal,
          physics: ClampingScrollPhysics(),
          currentStep: stepperIndex,
          //back button
          onStepCancel: (){
            if (stepperIndex > 0){
              setState(() {stepperIndex -= 1; });
            }
          },

          //continue button
          onStepContinue: (){
            final isLastStep = stepperIndex == getSteps().length - 1;

            if (isLastStep){
              //TODO: add post to db items

              //success dialog
              _showSuccessDialog(context);

            }else{
              setState(() {stepperIndex += 1;});

            }
          },

          //button fixes
          controlsBuilder: (BuildContext context, ControlsDetails details){
            final isLastStep = stepperIndex == getSteps().length - 1;

            return Container(
              child:Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child: Text(isLastStep ? 'SUBMIT' : 'NEXT'),
                      onPressed: details.onStepContinue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        elevation: 0,
                      ),
                    ),
                  ),

                  SizedBox(width: 16,),

                  if(details.currentStep != 0)
                    Expanded(
                      child: ElevatedButton(
                        child: Text('BACK'),
                        onPressed: details.onStepCancel,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          elevation: 0,
                        ),
                      ),
                    ),


                ],
              ),
            );
          },
          onStepTapped: (int index){
            setState(() {stepperIndex = index;});
          },

          //steps
          steps: getSteps(),
        ),
      ),

      bottomNavigationBar: NavBar(),
    );
  }
}