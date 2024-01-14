import 'package:flutter/material.dart';

import '../components/newclaimcomponent.dart';


class MedicalPolicies extends StatefulWidget{
  const MedicalPolicies({Key ? key}): super(key : key);

  State<MedicalPolicies> createState() => _MedicalPoliciesState();
}

class _MedicalPoliciesState extends State<MedicalPolicies>{
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
          NewClaimComponent(
            providerName: 'Cimas',
            policyid: 'KV123423T',
            admissiondate: '2023-08-16',
            status: 'In Review',

          ),

          SizedBox(height: 10,),
     ] ),
     )));
}}
