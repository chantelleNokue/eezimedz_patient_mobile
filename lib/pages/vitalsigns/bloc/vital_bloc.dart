import 'dart:async';
import 'dart:convert';


import 'package:Eezimedz_Patients/pages/myvisits/models/myvisits_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import '../model/vitalmodel.dart';

part 'vital_event.dart';
part 'vital_state.dart';

class MyvisitsBloc extends Bloc<MyvisitsEvent, MyvisitsState> {
  MyvisitsBloc() : super(MyvisitsInitial()) {
    on<MyvisitsInitialFetchEvent>(myvisitsInitialFetchEvent);
  }

  FutureOr<void> myvisitsInitialFetchEvent(
      MyvisitsInitialFetchEvent event,
      Emitter<MyvisitsState> emit,
      ) async {
    emit(MyvisitsfetchingLoadingState());

    var client = http.Client();
    VitalsModel? myvisit;
    try {
      var response = await client.get(Uri.parse(
          'http://20.164.214.226:3060/mongo/patient/getPatientByEmail?email=Sphesihle@kaributech-ai.com'));

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body) as Map<String, dynamic>?;
        if (result != null) {
          myvisit = VitalsModel.fromMap(result);
          print(myvisit);
          emit(MyvisitsFetchingSuccessfulState(myvisits: myvisit));
        } else {
          emit(MyvisitsfetchingErrorState());
        }
      } else {
        emit(MyvisitsfetchingErrorState());
      }
    } catch (e) {
      emit(MyvisitsfetchingErrorState());
      log(e.toString());
    }
  }
}
