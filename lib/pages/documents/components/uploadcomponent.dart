import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_x/flutter_dropdown_x.dart';
import 'package:file_picker/file_picker.dart';
import '../../../services/documents/minioservices.dart';

import '../../components/listitemsclass.dart';


class UploadComponent extends StatefulWidget{
  const UploadComponent({Key ? key}): super(key : key);


  State<UploadComponent> createState() => _UploadComponentState();
}

class _UploadComponentState extends State<UploadComponent>{

  //File
  FilePickerResult? documentResult;

  //Paths
  File? documentFile;


  //File Picker method
  getDocument() async{
    documentResult = await FilePicker.platform.pickFiles();

    if(documentResult != null){
      documentFile = File(documentResult!.files.single.path!);
    }else{
      print("No File Selected");
    }
    return documentFile;
  }


  final nameController = TextEditingController();

  String? classification;


  @override
  Widget build(BuildContext context){
    return AlertDialog(
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      title: Text('Upload Document'),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        TextButton(
          child: Text('Done'),
          onPressed: () {
            MinioServices().uploadFile(documentFile!);
            Navigator.of(context).pop();
          },
        ),
      ],
      content: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Text('Document Name'),
            SizedBox(
              width: 240,
              child:  TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Colors.black38,
                        width: 1.0
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  alignLabelWithHint: true,
                  label: Text('Document Name'),
                  hintText: 'Document Name',
                  suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: () => nameController.clear(),),
                ),
              ),
            ),

            SizedBox(height: 10,),

            Text('Document Classification'),
            SizedBox(
              height: 80,
              width: 340,
              child: DropDownField(
                value: classification,
                hintText: 'Select',
                dataSource: ListItems().classificationItems,
                onChanged: (value){
                  setState(() {
                    classification = value;
                  });
                },
                textField: 'label',
                valueField: 'value',
              ),
            ),

            SizedBox(height: 8,),

            Text('Document Upload'),
            Container(
              width: 240,
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black45,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child:  Center(
                child: (documentResult != null)?
                Text(documentResult!.files.single.name,):
                Text('No File Chosen'),
              ),
            ),

            SizedBox(height: 5,),

            MaterialButton(
              onPressed: () => getDocument(),
              elevation: 0,
              child: Text('Pick File'),
              color: Colors.blue.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(8.0),
              height: 40,
              minWidth: 100,
            ),
          ],
        ),
      ),
    );
  }

}

