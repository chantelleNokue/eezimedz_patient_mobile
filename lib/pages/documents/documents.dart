import 'package:flutter/material.dart';
import 'Dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart' as perm;

import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import '../profile.dart';
import 'components/documentcomponent.dart';
import 'components/uploadcomponent.dart';
import '../../services/documents/minioservices.dart';
import '../../models/documentsmodel.dart';


class Documents extends StatefulWidget{
  const Documents({Key ? key}): super(key : key);

  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents>{
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
  //UPLOAD DOCUMENT DIALOG
  showUploadDialog(context) => showDialog(
    context: context,
    builder: (context) => UploadComponent(),
  );

  List<DocumentsModel>? documentsList;

  //loaded boolean
  bool isLoaded = false;

  //get list of documents
  getDocuments() async{
    documentsList = await MinioServices().listDocuments('flutterdocuments');

    if(documentsList != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState(){
    super.initState();
    //retrieve list of documents every time page reloads
    getDocuments();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Documents'),
        automaticallyImplyLeading: false,
        leading: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: (){
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu_sharp, color: Colors.white,)
              );
            }
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile())),
            icon: Icon(Icons.person),
          ),
        ],
      ),
        drawer: DrawerClass(),
      body: (isLoaded == true)?
      Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(11),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.grey[200],
                  ),
                  child: Center(
                    child: Text(
                      'My Documents',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),


              SizedBox(
                height: 530,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.all(8.0),
                  shrinkWrap: true,
                  itemCount: documentsList!.length,
                  itemBuilder: (context, index){
                    DocumentsModel model = documentsList![index];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DocumentComponent(
                          viewFunction: (){},
                          documentName: model.name,
                          downloadFucntion: () => downloadFile(context, model.name),
                        ),

                        SizedBox(height: 10,),
                      ],
                    );
                  },

                ),
              ),

              SizedBox( height: 20,),

              ElevatedButton.icon(
                onPressed: () => showUploadDialog(context),
                icon: Icon(Icons.cloud_upload_sharp, size: 23,),
                label: Text('Upload Document'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    elevation: 0,
                    minimumSize: Size(300,50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    )
                ),
              ),



            ],
          ),
        ),
      ):
      Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
          strokeWidth: 5,
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }

}