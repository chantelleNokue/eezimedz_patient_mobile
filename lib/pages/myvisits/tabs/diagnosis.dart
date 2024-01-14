import 'package:Eezimedz_Patients/pages/myvisits/components/vitals.dart';
import 'package:flutter/material.dart';

class Diagnosis extends StatefulWidget{
  const Diagnosis({Key ? key}): super(key : key);


  State<Diagnosis> createState() => _DiagnosisState();
}


class _DiagnosisState extends State<Diagnosis>{
  @override
  Widget build(BuildContext context){
    return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: Container(
            width: 800,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue.withOpacity(0.1),
            ),
            child: SizedBox(
              height: 500,
              child: ListView(
                  padding: EdgeInsets.all(5),
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Vitals(
                      height: "65",
                      bloodPressure: '29',
                      bloodSugar: '8',
                      bm1: '0.01',
                      breathing: 'Irregular',
                      haemoglobinCount: 'g',
                      pulse: 'Irregular',
                      temperature: '23',
                      weight: '60',

                    ),

                    SizedBox(height: 10,),
                  ] ),
            )));
    //   Container(
    //   child: DataTable(columns: [
    //     DataColumn(label: Text('name')),
    //     DataColumn(label: Text('surname')),
    //   ], rows: [
    //     DataRow(cells: [
    //       DataCell(Text('Chantelle')),
    // DataCell(Text('Chantelle')),
    //
    //   ])
    // ]
    // ));
  }
}