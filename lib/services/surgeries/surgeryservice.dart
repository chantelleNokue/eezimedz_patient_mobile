import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../models/surgerymodel.dart';

class SurgeryProvider with ChangeNotifier{
  SurgeryProvider(){
    getSurgeries();
  }

  List<SurgeryModel>? _surgeries = [];

  List<SurgeryModel>? get surgeries => _surgeries;

  List<SurgeryModel>? _pending = [];
  List<SurgeryModel>? _approved = [];
  List<SurgeryModel>? _cancelled = [];


  List<SurgeryModel>? get pending => _pending ;
  List<SurgeryModel>? get approved => _approved;
  List<SurgeryModel>? get cancelled => _cancelled;

  loopThroughSurgeries(){
     _pending = [];
     _approved = [];
     _cancelled = [];

     for(var surgery in surgeries!){
       if(surgery.status == 'Pending'){
         _pending!.add(surgery);
       }else if(surgery.status == 'Cancelled'){
         _cancelled!.add(surgery);
       }else{
         _approved!.add(surgery);
       }
     }
  }

  getSurgeries() async{
   try{
     _surgeries = await getAllSurgeries();

     if(_surgeries != null){
       loopThroughSurgeries();
       print('Surgeries Successfuly Retrieved');
       print(_surgeries);
     }
   }catch(e){
     print('Error $e');
   }
  }


  Future<List<SurgeryModel>?> getAllSurgeries() async{
    try{
      var url = Uri.parse('http://20.164.214.226:3060/mongo/surgeries/getSurgeryByEmail?email=chantellemabvura@gmail.com');

      final response = await http.get(url);

      if(response.statusCode == 200){
        return surgeryModelFromJson(response.body);
      }else{
        print(response.statusCode);
      }

    }catch(e){
      print('Error: $e');
    }
  }

  notifyListeners();
}