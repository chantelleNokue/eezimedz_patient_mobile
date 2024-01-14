import 'package:Eezimedz_Patients/pages/quotations/viewquotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_x/flutter_dropdown_x.dart';


import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import '../components/listitemsclass.dart';
import '../profile.dart';
import '../components/successdialog.dart';
import 'quotationsmenu.dart';
import 'components/viewquotationcard.dart';

class GenerateQuote extends StatefulWidget{
  const GenerateQuote({Key ? key}): super(key : key);

  State<GenerateQuote> createState() => _GenerateQuoteState();
}

class _GenerateQuoteState extends State<GenerateQuote>{
  //TODO: Get patient object and replace patient details
  //TODO: add generate quote functionality

  //CALCULATION METHODS
  //CALCULATING RANDS
  double procedureAmount = 0.0;
  calculateRands(String procedure, String quantity){
    var intQuantity = int.parse(quantity);
    double amount = 0.0;

    switch(procedure){
      case 'Cesarean Section(C-Section)':
        procedureAmount = (1230 + 110.7) * intQuantity;
        //return amount;
        break;

      case 'Multivitamin Supplement':
        procedureAmount = (5673 + 170.19) * intQuantity;
        //return amount;
        break;

      case 'Compression Therapy':
        procedureAmount = (2341 + 749.12) * intQuantity;
        //return amount;
        break;

      case 'Allergy Relief':
        procedureAmount = (8954 + 1343.10) * intQuantity;
        //return amount;
        break;

      case 'Tonsillectomy':
        procedureAmount = (98054 + 3922.16) * intQuantity;
        //return amount;
        break;

      case 'Cataract Surgery':
        procedureAmount = (12534 + 626.70) * intQuantity;
        //return amount;
        break;

      case 'Coronary Artery Bypass Graft(CABG)':
        procedureAmount = (45723 + 5943.99) * intQuantity;
        //return amount;
        break;

      case 'Antihistamine Allergy Medication':
        procedureAmount = (25412 + 4320.04) * intQuantity;
        //return amount;
        break;

      case 'Appendectomy':
        procedureAmount = (2367 + 189.36) * intQuantity;
        //return amount;
        break;
      default:
        procedureAmount = 0.0;
    }

  }

  //CALCULATE USD
  calculateUsd(String procedure, String quantity){
    var intQuantity = int.parse(quantity);

    switch(procedure){
      case 'Cesarean Section(C-Section)':
        procedureAmount = (215 + 19.35) * intQuantity;
        //return amount;
        break;

      case 'Multivitamin Supplement':
        procedureAmount = (3 + 0.09) * intQuantity;
        //return amount;
        break;

      case 'Compression Therapy':
        procedureAmount = (220 + 70.4) * intQuantity;
        //return amount;
        break;

      case 'Allergy Relief':
        procedureAmount = (150 + 22.5) * intQuantity;
        //return amount;
        break;

      case 'Tonsillectomy':
        procedureAmount = (200 + 8.0) * intQuantity;
        //return amount;
        break;

      case 'Cataract Surgery':
        procedureAmount = (205 + 10.25) * intQuantity;
        //return amount;
        break;

      case 'Coronary Artery Bypass Graft(CABG)':
        procedureAmount = (210 + 27.3) * intQuantity;
        //return amount;
        break;

      case 'Antihistamine Allergy Medication':
        procedureAmount = (112 + 19.04) * intQuantity;
        //return amount;
        break;

      case 'Appendectomy':
        procedureAmount = (218 + 17.44) * intQuantity;
        //return amount;
        break;
      default:
        procedureAmount = 0.0;
    }

  }

  //ZWL CALCULATION
  calculateZWL(String procedure, String quantity){
    var intQuantity = int.parse(quantity);

    switch(procedure){
      case 'Cesarean Section(C-Section)':
        procedureAmount = (1200 + 108.0) * intQuantity;
        //return amount;
        break;

      case 'Multivitamin Supplement':
        procedureAmount = (4000 + 120.0) * intQuantity;
        //return amount;
        break;

      case 'Compression Therapy':
        procedureAmount = (7000 + 2240.0) * intQuantity;
        //return amount;
        break;

      case 'Allergy Relief':
        procedureAmount = (3000 + 450.0) * intQuantity;
        //return amount;
        break;

      case 'Tonsillectomy':
        procedureAmount = (1500 + 60.0) * intQuantity;
        //return amount;
        break;

      case 'Cataract Surgery':
        procedureAmount = (6340 + 317.0) * intQuantity;
        //return amount;
        break;

      case 'Coronary Artery Bypass Graft(CABG)':
        procedureAmount = (7890 + 1025.7) * intQuantity;
        //return amount;
        break;

      case 'Antihistamine Allergy Medication':
        procedureAmount = (3456 + 587.52) * intQuantity;
        //return amount;
        break;

      case 'Appendectomy':
        procedureAmount = (2345 + 187.6) * intQuantity;
        //return amount;
        break;
      default:
        procedureAmount = 0.0;
    }

  }




  //success dialog
  void _showSuccessDialog(context) => showDialog(
    context: context,
    builder: (context) => SuccessDialog(toClass: QuotationsMenu()),
  );


  //controllers
  final referenceController = TextEditingController();
  final quantityController = TextEditingController();

  //variables
  DateTime invoiceDate = DateTime.now();
  DateTime dueDate = DateTime.now();
  String? immediatePayment;
  String? procedure;
  String? quantity;
  String? currency;

  //widgets
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
          child: Center(child:Text('Nyasha Chaingei', style: TextStyle(fontSize: 15)),),
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

  Widget buildQuote() => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        Text('Invoice Date'),
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
                  "${invoiceDate.year} - ${invoiceDate.month} - ${invoiceDate.day}",
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
                  initialDate: invoiceDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                );

                if(dateTime != null){
                  setState(() {
                    invoiceDate = dateTime;
                  });
                }
              },
            ),
          ],
        ),

        SizedBox(height: 10,),

        Text('Payment Reference'),
        SizedBox(
          width: 300,
          child: TextFormField(
            controller: referenceController,
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
              label: Text('Payment Reference'),
              hintText: 'Payment Reference',
              suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: () => referenceController.clear(),),
            ),
          ),
        ),

        SizedBox(height: 10,),

        Text('Immediate Payment'),
        SizedBox(
          height: 80,
          width: 320,
          child: DropDownField(
            value: immediatePayment,
            hintText: 'Select',
            dataSource: ListItems().optionItems,
            onChanged: (value){
              setState(() {
                immediatePayment = value;
              });
            },
            textField: 'label',
            valueField: 'value',
          ),
        ),

        SizedBox(height: 8,),

        (immediatePayment == 'No')?
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Due Date'),
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
                      "${dueDate.year} - ${dueDate.month} - ${dueDate.day}",
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
                      initialDate: dueDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000),
                    );

                    if(dateTime != null){
                      setState(() {
                        dueDate = dateTime;
                      });
                    }
                  },
                ),
              ],
            )
          ],
        ):
            Container(height: 0),

        SizedBox(height: 10,),

        Text('Procedure'),
        SizedBox(
          height: 80,
          width: 320,
          child: DropDownField(
            value: procedure,
            hintText: 'Select Procedure',
            dataSource: ListItems().procedureItems,
            onChanged: (value){
              setState(() {
                procedure = value;
              });
            },
            textField: 'label',
            valueField: 'value',
          ),
        ),


        SizedBox(height: 10,),

        Text('Quantity'),
       SizedBox(
         width: 300,
         child:  TextFormField(
           keyboardType: TextInputType.number,
           controller: quantityController,
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
             label: Text('Quantity'),
             hintText: 'Quantity',
             suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: () => quantityController.clear(),),
           ),
         ),
       ),

        SizedBox(height: 10,),

        Text('Currency'),
        SizedBox(
          height: 80,
          width: 320,
          child: DropDownField(
            value: currency,
            hintText: 'Select Currency',
            dataSource: ListItems().currencyItems,
            onChanged: (value){
              setState(() {
                currency = value;
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
      title: Text('Quotation Details', style: TextStyle(fontSize: 13),),
      subtitle: Text('Please enter the necessary details.', style: TextStyle(fontSize: 9),),
      content: buildQuote(),
      isActive: stepperIndex >= 1,
    ),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Quotations'),
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
              //amount calculations
              if(currency == 'USD'){
                calculateUsd(procedure!, '1');
                quotations.add(Quotation(status: 'Pending', date: invoiceDate.toString(), dueDate: dueDate.toString(), immediatePaymemt: immediatePayment, products: procedure, patientName: 'Nyasha Chaingei', total: procedureAmount.toString(),currency: currency));
              }else if(currency == 'Rand'){
                calculateRands(procedure!, '1');
                quotations.add(Quotation(status: 'Pending', date: invoiceDate.toString(), dueDate: dueDate.toString(), immediatePaymemt: immediatePayment, products: procedure, patientName: 'Nyasha Chaingei', total: procedureAmount.toString(),currency: currency));
              }else if(currency == 'ZWL'){
                calculateZWL(procedure!, '1');
                quotations.add(Quotation(status: 'Pending', date: invoiceDate.toString(), dueDate: dueDate.toString(), immediatePaymemt: immediatePayment, products: procedure, patientName: 'Nyasha Chaingei', total: procedureAmount.toString(),currency: currency));
              }


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

class Quotation{
  final String? status;
  final String? date;
  final String? immediatePaymemt;
  final String? dueDate;
  final String? products;
  final String? patientName;
  final String? total;
  final String? currency;

  Quotation({
    this.status,
    this.date,
    this.immediatePaymemt,
    this.dueDate,
    this.products,
    this.patientName,
    this.total,
    this.currency,
});

}

List<Quotation> quotations = [
  Quotation(
    patientName: 'Nyasha Chaingei',
    status: 'Pending',
    date: '2023-07-31',
    dueDate: '2023-08-01',
    immediatePaymemt: 'No',
    products: 'Allergy Relief',
    total: '235',
    currency: 'USD',
  ),
];




// class PendingTab extends StatelessWidget{
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: ListView.builder(
//         padding: EdgeInsets.all(8.0),
//         physics: AlwaysScrollableScrollPhysics(),
//
//         itemCount: quotations.length,
//         itemBuilder: (context, index){
//           Quotation quotation = quotations[index];
//           return Column(
//             children: [
//               ViewCard(
//                 status: quotation.status,
//                 date: quotation.date,
//                 dueDate: quotation.dueDate,
//                 immediatePaymemt: quotation.immediatePaymemt,
//                 products: quotation.products,
//                 patientName: quotation.patientName,
//                 total: quotation.total,
//                 currency: quotation.currency,
//               ),
//
//               SizedBox(height: 10,),
//             ],
//           );
//
//         },
//
//       ),
//     );
//   }
// }

