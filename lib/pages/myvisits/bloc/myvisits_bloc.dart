import 'dart:async';
import 'dart:convert';


import 'package:Eezimedz_Patients/pages/myvisits/models/myvisits_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

part 'myvisits_event.dart';
part 'myvisits_state.dart';

class MyvisitsBloc extends Bloc<MyvisitsEvent, MyvisitsState> {
  MyvisitsBloc() : super(MyvisitsInitial()) {
    on<MyvisitsInitialFetchEvent>(myvisitsInitialFetchEvent);
  }

  FutureOr<void> myvisitsInitialFetchEvent(
      MyvisitsInitialFetchEvent event,
      Emitter<MyvisitsState> emit) async {
    emit(MyvisitsfetchingLoadingState());

    var client = http.Client();
    List<MyVisitsModel> myvisits= [];
    try {
      var response = await client.get(Uri.parse(
          'http://20.164.214.226:3060/mongo/patient-visits/getVisitsByEmail?email=panashebudzinike@gmail.com'));
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        MyVisitsModel myvisit =
        MyVisitsModel.fromMap(result[i] as Map<String, dynamic>);
        myvisits.add(myvisit);
      }
      print(myvisits);
      emit(MyvisitsFetchingSuccessfulState(myvisits: myvisits));
    } catch (e) {
      emit(MyvisitsfetchingErrorState());
      log(e.toString());
    }
  }
}
