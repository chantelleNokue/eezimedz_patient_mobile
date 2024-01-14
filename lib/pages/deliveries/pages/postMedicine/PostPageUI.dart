// import 'dart:io';

// import 'package:eezimed_deliveries/pages/postMedicine/postMedService.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../Models/FormModel.dart';

// class PostMed extends StatefulWidget {
//   const PostMed({super.key});

//   @override
//   State<PostMed> createState() => _PostMedState();
// }

// class _PostMedState extends State<PostMed> {
//   TextEditingController medicineName = TextEditingController();
//   TextEditingController Description = TextEditingController();
//   TextEditingController Dosage = TextEditingController();
//   TextEditingController NumberOfPacks = TextEditingController();
//   TextEditingController Purpose = TextEditingController();
//   TextEditingController Price = TextEditingController();

//   bool ShowCircles = false;

//   final _formKey = GlobalKey<FormState>();
//   FilePickerResult? result;
//   String? _fileName;
//   PlatformFile? pickedFile;
//   bool isloading = false;
//   File? fileToDispay;

//   UploadTask? uploadTask;

//   Future<void> SubmitForm() async {
//     final path = 'files/${pickedFile!.name}';
//     final file = File(pickedFile!.path!);
//     final ref = FirebaseStorage.instance.ref().child(path);
//     uploadTask = ref.putFile(file);
//     final snapshot = await uploadTask!.whenComplete(() {});
//     final urlDownload = await snapshot.ref.getDownloadURL();
//     print("$urlDownload");

//     PostModelUi formData = PostModelUi(
//         medicineName: medicineName.text,
//         description: Description.text,
//         dosage: Dosage.text,
//         imagePath: urlDownload,
//         numberOfPacks: NumberOfPacks.text,
//         purpose: Purpose.text,
//         price: Price.text);

//     final authService = Provider.of<PostService>(context,
//         listen: false); // ignore: non_constant_identifier_names
//     try {
//       authService.sendCredentialsToAPI(formData);
//       setState(() {
//         ShowCircles = false;
//       });
//       showDialog(
//           context: context,
//           builder: (context) {
//             return const Center(
//               child: Card(
//                   child: SizedBox(
//                 height: 100,
//                 width: 250,
//                 child: Padding(
//                   padding: EdgeInsets.all(15.0),
//                   child: Text(
//                     "You have successfilly uploaded the medicine",
//                     style: TextStyle(color: Colors.greenAccent),
//                   ),
//                 ),
//               )),
//             );
//           });
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.toString())));
//     }
//   }

//   void PickFile() async {
//     try {
//       setState(() {
//         isloading = true;
//       });

//       result = await FilePicker.platform
//           .pickFiles(type: FileType.image, allowMultiple: false);
//       if (result != null) {
//         _fileName = result?.files.first.name;
//         pickedFile = result?.files.first;
//         fileToDispay = File(pickedFile!.path.toString());

//         print("File Name: ${_fileName}");
//       }

//       setState(() {
//         isloading = false;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: SingleChildScrollView(
//       child: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 720,
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(30.0),
//                         bottomRight: Radius.circular(30.0),
//                       ),
//                       color: Colors.blue),
//                   child: Padding(
//                       padding: EdgeInsets.only(top: 0),
//                       child: ListTile(
//                         leading: const CircleAvatar(
//                           backgroundImage:
//                               AssetImage('assets/images/woman.png'),
//                           radius: 28,
//                         ),
//                         title: const Row(
//                           children: [
//                             Padding(
//                               padding: EdgeInsetsDirectional.only(
//                                 top: 20,
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Prince",
//                                     style: TextStyle(
//                                         fontSize: 20, color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             GestureDetector(
//                               onTap: () {},
//                               child: const Icon(
//                                 Icons.search,
//                                 size: 30.0,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {},
//                               child: const Icon(
//                                 Icons.assignment_outlined,
//                                 size: 30.0,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )),
//                 ),
//                 Padding(
//                     padding: EdgeInsets.only(top: 75, left: 14, right: 14),
//                     child: Container(
//                         decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey
//                                     .withOpacity(0.5), // Shadow color
//                                 spreadRadius: 5, // Spread radius
//                                 blurRadius: 7, // Blur radius
//                                 offset:
//                                     Offset(0, 3), // Offset in x and y direction
//                               ),
//                             ],
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(40),
//                             ),
//                             color: Colors.white),
//                         child: const Column(
//                           children: [
//                             Center(
//                                 child: Padding(
//                               padding: EdgeInsets.all(4.0),
//                               child: Text(
//                                 "Sale Medicine",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500, fontSize: 20),
//                               ),
//                             )),
//                           ],
//                         ))),
//                 Padding(
//                     padding: EdgeInsets.only(top: 117, left: 5, right: 5),
//                     child: Container(
//                         height: 623,
//                         decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(15),
//                             ),
//                             color: Colors.white),
//                         child: ListView(
//                           children: [
//                             Form(
//                               key: _formKey,
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 10.0, left: 15, right: 15),
//                                     child: TextFormField(
//                                       controller: medicineName,
//                                       decoration: const InputDecoration(
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Medicine Name',
//                                       ),
//                                       // The validator receives the text that the user has entered.
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return 'Please enter some text';
//                                         }
//                                         return null;
//                                       },
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 10.0, left: 15, right: 15),
//                                     child: TextFormField(
//                                       controller: Description,
//                                       decoration: const InputDecoration(
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Description',
//                                       ),
//                                       // The validator receives the text that the user has entered.
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return 'Please enter some text';
//                                         }
//                                         return null;
//                                       },
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 10.0, left: 15, right: 15),
//                                     child: TextFormField(
//                                       controller: Dosage,
//                                       decoration: const InputDecoration(
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Dosage',
//                                       ),
//                                       // The validator receives the text that the user has entered.
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return 'Please enter some text';
//                                         }
//                                         return null;
//                                       },
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 10.0, left: 15, right: 15),
//                                     child: TextFormField(
//                                       controller: NumberOfPacks,
//                                       decoration: const InputDecoration(
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Number of packs',
//                                       ),
//                                       // The validator receives the text that the user has entered.
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return 'Please enter some text';
//                                         }
//                                         return null;
//                                       },
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 10.0, left: 15, right: 15),
//                                     child: TextFormField(
//                                       controller: Purpose,
//                                       decoration: const InputDecoration(
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Purpose',
//                                       ),
//                                       // The validator receives the text that the user has entered.
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return 'Please enter some text';
//                                         }
//                                         return null;
//                                       },
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 10.0, left: 15, right: 15),
//                                     child: TextFormField(
//                                       controller: Price,
//                                       decoration: const InputDecoration(
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Price',
//                                       ),
//                                       // The validator receives the text that the user has entered.
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return 'Please enter some text';
//                                         }
//                                         return null;
//                                       },
//                                     ),
//                                   ),

//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 10.0, left: 15, right: 15),
//                                     child: Column(
//                                       children: [
//                                         Center(
//                                           child: isloading
//                                               ? CircularProgressIndicator()
//                                               : GestureDetector(
//                                                   onTap: () {
//                                                     PickFile();
//                                                   },
//                                                   child: Container(
//                                                     width: double.maxFinite,
//                                                     decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20.0),
//                                                       border: Border.all(
//                                                         color: Colors.blue,
//                                                         width: 2.0,
//                                                       ),
//                                                     ),
//                                                     child: const Padding(
//                                                       padding:
//                                                           EdgeInsets.all(8.0),
//                                                       child: Center(
//                                                         child: Text(
//                                                             "Add  image",
//                                                             style: TextStyle(
//                                                                 color: Colors
//                                                                     .blue)),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                         ),
//                                         if (pickedFile != null)
//                                           SizedBox(
//                                               height: 300,
//                                               width: 400,
//                                               child: Image.file(fileToDispay!))
//                                       ],
//                                     ),
//                                   ),

//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 10.0, left: 15, right: 15),
//                                     child: ElevatedButton(
//                                       style: ButtonStyle(
//                                         shape: MaterialStateProperty.all<
//                                             RoundedRectangleBorder>(
//                                           RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(50.0),
//                                           ),
//                                         ),
//                                       ),
//                                       onPressed: () {
//                                         // Validate returns true if the form is valid, or false otherwise.
//                                         if (_formKey.currentState!.validate()) {
//                                           SubmitForm();
//                                           setState(() {
//                                             ShowCircles = true;
//                                           });

//                                           // If the form is valid, display a snackbar. In the real world,
//                                           // you'd often call a server or save the information in a database.
//                                           if (ShowCircles) {
//                                             showDialog(
//                                                 context: context,
//                                                 builder: (context) {
//                                                   return const Center(
//                                                     child:
//                                                         CircularProgressIndicator(),
//                                                   );
//                                                 });
//                                           }
//                                         }
//                                       },
//                                       child: const Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Text('Add Medicine'),
//                                         ],
//                                       ),
//                                     ),
//                                   ),

//                                   // Add TextFormFields and ElevatedButton here.
//                                 ],
//                               ),
//                             )
//                           ],
//                         )))
//               ],
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }


// // 