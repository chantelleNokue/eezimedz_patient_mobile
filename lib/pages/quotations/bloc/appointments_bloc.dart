import 'dart:async';
import 'dart:convert';


import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import '../model/quotation.dart';

// import 'package:Eezimedz_Patients/models/appointmentsmodel.dart';

part 'appointments_event.dart';
part 'appointments_state.dart';

class QuotationBloc extends Bloc<QuotationEvent, QuotationState> {
  QuotationBloc() : super(QuotationInitial()) {
    on<QuotationInitialFetchEvent>(quotationInitialFetchEvent);
  }
  final _user = FirebaseAuth.instance.currentUser!;


  FutureOr<void> quotationInitialFetchEvent(

      QuotationInitialFetchEvent event,
      Emitter<QuotationState> emit) async {

    emit(QuotationfetchingLoadingState());
// print(_user.email);
    var client = http.Client();
    List<QuotationModel> prescriptions = [];
    try {
      var response = await client.get(Uri.parse(
          'http://20.164.214.226:3060/mongo/quotation'));
      // ${_user.email}
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        QuotationModel prescription =
        QuotationModel.fromMap(result[i] as Map<String, dynamic>);
        prescriptions.add(prescription);
      }
      print(prescriptions);
      emit(QuotationFetchingSuccessfulState(quotations: prescriptions));
    } catch (e) {
      emit(QuotationfetchingErrorState());
      log(e.toString());
    }
  }
}
