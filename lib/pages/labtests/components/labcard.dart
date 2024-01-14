import 'package:flutter/material.dart';


class LabCard extends StatelessWidget{

  final String? labName;
  final String? imageUrl;
  final viewLab;

  LabCard({this.labName, this.imageUrl, this.viewLab});

  //TODO: add lab logos

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: viewLab,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(11),
        child: Container(
          height: 130,
          padding: EdgeInsets.all(9.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
          ),
          child:Column(
            children: [
              Image.asset(
                imageUrl!,
                height: 50,
                width: 50,
              ),


              Text(
                labName!,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}