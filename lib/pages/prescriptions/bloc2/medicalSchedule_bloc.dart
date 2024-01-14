import 'dart:async';
import 'dart:convert';


import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import '../models/medicalModel.dart';
import '../models/prescriptions.dart';
part 'medicalSchedule_event.dart';
part 'medicalSchedule_state.dart';

class PrescriptionBloc extends Bloc<PrescriptionEvent, PrescriptionState> {
  PrescriptionBloc() : super(PrescriptionInitial()) {
    on<PrescriptionInitialFetchEvent>(prescriptionInitialFetchEvent);
  }

  FutureOr<void> prescriptionInitialFetchEvent(
      PrescriptionInitialFetchEvent event,
      Emitter<PrescriptionState> emit) async {
    emit(PrescriptionfetchingLoadingState());

    var client = http.Client();
    List<MedicalModel> prescriptions = [];
    try {
      var response = await client.get(Uri.parse(
          'http://20.164.214.226:3060/mongo/medicine-schedule/PAT1698649720595'));
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        MedicalModel prescription =
        MedicalModel.fromMap(result[i] as Map<String, dynamic>);
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


