import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../models/doctornotesmodel.dart';


class NotesProvider with ChangeNotifier{
  NotesProvider(){
    notesCall();
  }

  //date variable
  DateTime currentDate = DateTime.now().subtract(Duration(days: 14));

  List<DoctorNotesModel>? _doctornotes = [];
  List<DoctorNotesModel>? _publicnotes = [];
  List<DoctorNotesModel>? _privatenotes = [];

  List<DoctorNotesModel>? get doctornotes => _doctornotes;
  List<DoctorNotesModel>? get publicnotes => _publicnotes;
  List<DoctorNotesModel>? get privatenotes => _privatenotes;

  //get notes api call
  notesCall() async{
    try{
      _doctornotes = await getDoctorNotes();

      if(_doctornotes != null){
        loopThroughNotes();
        print('Notes retrieved successfully');
        print(_doctornotes);
      }
    }catch(e){
      print(e.toString());
    }
    notifyListeners();
  }

  //TODO: get patient id from patient object

  Future<List<DoctorNotesModel>?> getDoctorNotes() async{
    try{
      var url = Uri.parse('http://20.164.214.226:3060/mongo/doctornotes/getNotesByPatientIdAndDoctor?patientId=PAT1698649720595');

      final response = await http.get(url);
      if(response.statusCode == 200){
        print('Call successful');
        print(response.body);
        return doctorNotesModelFromJson(response.body);
      }else{
        print('Call Failed');
        print(response.statusCode);
      }
    }catch(e){
      print(e.toString());
    }
  }

  loopThroughNotes(){
    _publicnotes = [];
    _privatenotes = [];

    for(var note in doctornotes!){
      if(note.status == 'public'){
        _publicnotes!.add(note);
      }else if(note.status == 'private'){
        _privatenotes!.add(note);
      }
    }
  }
}
