// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import '../Models/FormModel.dart';

// class PostService extends ChangeNotifier {
//   Future<void> sendCredentialsToAPI(PostModelUi postModelUi) async {
//     var url = Uri.parse(
//         'http://20.164.214.226:3060/mongo/delivery/create'); // Replace with your API endpoint URL

//     var headers = {
//       'Content-Type':
//           'application/json', // Replace with your desired content type
//     };

//     var body = {
//       'description': postModelUi.description,
//       'medicineName': postModelUi.medicineName,
//       'purpose': postModelUi.purpose,
//       'price': postModelUi.price,
//       'dosage': postModelUi.dosage,
//       'imagePath': postModelUi.imagePath,
//       'numberOfPacks': postModelUi.numberOfPacks,
//     };
//     try {
//       var response =
//           await http.post(url, headers: headers, body: jsonEncode(body));

//       if (response.statusCode == 201) {
//         // Request successful, do something with the response
//         print('Response: ${response.body}');
//       } else {
//         // Request failed, handle the error
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
