import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../models/invoices.dart';
import '../../models/surgerymodel.dart';

class InvoiceProvider with ChangeNotifier{
  InvoiceProvider(){
    getSurgeries();
  }

  List<InvoicesModel>? _surgeries = [];

  List<InvoicesModel>? get surgeries => _surgeries;

  List<InvoicesModel>? _pending = [];
  List<InvoicesModel>? _approved = [];
  List<InvoicesModel>? _cancelled = [];


  List<InvoicesModel>? get pending => _pending ;
  List<InvoicesModel>? get approved => _approved;
  List<InvoicesModel>? get cancelled => _cancelled;

  loopThroughSurgeries(){
    _pending = [];
    _approved = [];
    _cancelled = [];

    for(var surgery in surgeries!){
      if(surgery.statuses.status == 'paid'){
        _pending!.add(surgery);
      }else if(surgery.statuses.status == 'Cancelled'){
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
        print('Invoices Successfuly Retrieved');
        print(_surgeries);
      }
    }catch(e){
      print('Error $e');
    }
  }


  Future<List<InvoicesModel>?> getAllSurgeries() async{
    try{
      var url = Uri.parse('http://20.164.214.226:3060/mongo/invoice');

      final response = await http.get(url);

      if(response.statusCode == 200){
        return invoicesModelFromJson(response.body);
      }else{
        print(response.statusCode);
      }

    }catch(e){
      print('Error: $e');
    }
  }

  notifyListeners();
}