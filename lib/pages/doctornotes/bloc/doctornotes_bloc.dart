import 'dart:async';
import 'dart:convert';



import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import '../model/doctornotessmodel.dart';



part 'doctornotes_event.dart';
part 'doctornotes_state.dart';

class DoctorNotesBloc extends Bloc<DoctorNotesEvent, DoctorNotesState> {
  DoctorNotesBloc() : super(DoctorNotesInitial()) {
    on<DoctorNotesInitialFetchEvent>(doctorNotesInitialFetchEvent);
  }
  final _user = FirebaseAuth.instance.currentUser!;


  FutureOr<void> doctorNotesInitialFetchEvent(

      DoctorNotesInitialFetchEvent event,
      Emitter<DoctorNotesState> emit) async {

    emit(DoctorNotesfetchingLoadingState());
// print(_user.email);
    var client = http.Client();
    List<DoctorNotesModel> doctornotes = [];
    try {
      var response = await client.get(Uri.parse(
          'http://20.164.214.226:3060/mongo/doctornotes/getNotesByPatientIdAndDoctor?patientId=PAT1698649720595'));
      // ${_user.email}
      print(response.body);
      print("Chanty");
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        DoctorNotesModel doctornote =
        DoctorNotesModel.fromMap(result[i] as Map<String, dynamic>);
        doctornotes.add(doctornote);
      }
      print(doctornotes);

      emit(DoctorNotesFetchingSuccessfulState(doctorNotes: doctornotes));
    } catch (e) {
      emit(DoctorNotesfetchingErrorState());
      log(e.toString());
    }
  }
}
