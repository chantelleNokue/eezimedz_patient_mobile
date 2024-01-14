import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart' as perm;

import '../../models/documentsmodel.dart';



class MinioServices{
  //upload file to Minio
  //TODO: replace api url
  Future uploadFile(File file) async{
    try{
      var _url = Uri.parse('http://192.168.1.131:5000/upload');

      var request = http.MultipartRequest('POST', _url);
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

      var response = await request.send();


      if(response.statusCode == 200){
        print('Post Request Successful');
        Fluttertoast.showToast(
          msg: "Document Upload Successful",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 18.0,
        );
      }
    }catch (e){
      Fluttertoast.showToast(
        msg: "Document Upload Failed",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 18.0,
      );
      print(e.toString());
    }

  }

  //download file from minio
  Future<void> downloadFile(BuildContext context, objectName) async {
    try {
      final url = "http://192.168.1.131:5000/view/$objectName"; // Replace with your API URL
      final response = await http.get(Uri.parse(url));

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {

        final contentType = response.headers["content-type"];
        final extension = path.extension(objectName);
        final mimeType = contentType ?? "application/octet-stream";

        final fileBytes = response.bodyBytes;
        final status = await Permission.storage.request();

        if (status.isGranted) {
          final downloadsDirectory = await getExternalStorageDirectory();
          final filePath = path.join(downloadsDirectory!.path, objectName);

          await File(filePath).writeAsBytes(fileBytes);

          await OpenFile.open(filePath, type: mimeType);

          Fluttertoast.showToast(
            msg: "Document Download Successful",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 18.0,
          );
        }
        // } else if (status.isPermanentlyDenied) {
        //   // Permission permanently denied, guide user to app settings
        //   await showDialog(
        //     context: context,
        //     builder: (context) =>
        //         AlertDialog(
        //           title: Text("Permission Denied"),
        //           content: Text("You have denied storage access permanently. "
        //               "To enable this feature, please go to App Settings and grant the required permission."),
        //           actions: <Widget>[
        //             TextButton(
        //               onPressed: () {
        //                 Navigator.pop(context);
        //                 perm.openAppSettings(); // Open app settings page
        //               },
        //               child: Text("Open Settings"),
        //             ),
        //           ],
        //         ),
        //   );
        // }
        else {
          print(status.toString());
          Fluttertoast.showToast(
            msg: "Permission denied to access storage",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18.0,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "Document Download Failed",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18.0,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //view lis of documents
  Future<List<DocumentsModel>?> listDocuments(bucketName) async{
    try{
      var url = Uri.parse('http://192.168.1.131:5000/list_objects/$bucketName');

      final response = await http.get(url);

      if(response.statusCode == 200){
        //print(response.body);
        return documentsModelFromJson(response.body);
      }

    }catch (e){
      print(e.toString());
    }
  }



}