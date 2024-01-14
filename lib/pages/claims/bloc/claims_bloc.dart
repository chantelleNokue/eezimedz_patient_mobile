import 'dart:async';
import 'dart:convert';


import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import '../model/claimsModel.dart';

// import 'package:Eezimedz_Patients/models/appointmentsmodel.dart';

part 'claims_event.dart';
part 'claims_state.dart';

class PrescriptionBloc extends Bloc<PrescriptionEvent, PrescriptionState> {
  PrescriptionBloc() : super(PrescriptionInitial()) {
    on<PrescriptionInitialFetchEvent>(prescriptionInitialFetchEvent);
  }
  final _user = FirebaseAuth.instance.currentUser!;


  FutureOr<void> prescriptionInitialFetchEvent(

      PrescriptionInitialFetchEvent event,
      Emitter<PrescriptionState> emit) async {

    emit(PrescriptionfetchingLoadingState());
print(_user.email);
    var client = http.Client();
    List<ClaimsModel> prescriptions = [];
    try {
      var response = await client.get(Uri.parse(
          'http://20.164.214.226:3060/mongo/claims/medical/all'));
      // ${_user.email}
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        ClaimsModel prescription =
        ClaimsModel.fromMap(result[i] as Map<String, dynamic>);
        prescriptions.add(prescription);
      }
      print(prescriptions);
      emit(PrescriptionFetchingSuccessfulState(prescriptions: prescriptions));
    } catch (e) {
      emit(PrescriptionfetchingErrorState());
      log(e.toString());
    }
  }
}
