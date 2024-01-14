import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../models/labtestmodel.dart';


class LabtestProvider with ChangeNotifier{
  LabtestProvider(){
    getTestResults();
  }


  List<LabtestModel>? _labtestresults = [];

  List<LabtestModel>? get labtestresults => _labtestresults;


  getResults() async{
    try{
      _labtestresults = await getTestResults();

      if(_labtestresults != null){
        print('Lab Test Results Successfully Retrieved');
        print(_labtestresults);
        return _labtestresults;
      }
    }catch(e){
      print('Error $e');
    }

  }

  Future<List<LabtestModel>?> getTestResults() async{
    try{
      var url = Uri.parse('http://20.164.214.226:3060/mongo/labtests/getLabTestByEmail?email=chantellemabvura@gmail.com');

      final response = await http.get(url);

      if(response.statusCode == 200){
        print('Test Results retrieved successfully');
        print(response.body);
        return labtestModelFromJson(response.body);
      }
    }catch(e){
      print('Error $e');
    }
  }

  notifyListeners();
}