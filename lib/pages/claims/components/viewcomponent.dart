import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../../components/bottomnavigationbar.dart';
import '../../components/drawercomponent.dart';
import '../../profile.dart';
import '../../documents/components/documentcomponent.dart';

class ViewComponent extends StatefulWidget{
  final String? provider;
  final String? network;
  final String? receiveddate;
  final String? incident;
  final String? payername;
  final String? group;
  final String? address;
  final String? phonenumber;
  final String? amount;
  final String? paymenttype;
  final String? holdername;
  final String? accountnumber;
  final String? branch;
  final String? branchcode;
  final String? currency;


  const ViewComponent({
    Key ? key,
    this.provider,
    this.network,
    this.receiveddate,
    this.incident,
    this.payername,
    this.group,
    this.address,
    this.phonenumber,
    this.amount,
    this.paymenttype,
    this.holdername,
    this.accountnumber,
    this.branch,
    this.branchcode,
    this.currency,
  }): super(key : key);

  State<ViewComponent> createState() => _ViewComponentState();
}

class _ViewComponentState extends State<ViewComponent> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  //edit payment details
  //controllers
  final typeController = TextEditingController();
  final nameController = TextEditingController();
  final accountController = TextEditingController();
  final branchController = TextEditingController();
  final codeController = TextEditingController();


  showEditDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Details'),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),

          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Save'),
          )
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Payment Type'),
            TextFormField(
              controller: typeController,
              decoration: InputDecoration(
                labelText: 'Payment Type',
                hintText: 'Payment Type',
                suffixIcon: typeController.text.isEmpty
                    ? Container(width:0)
                    : IconButton(
                  icon:Icon(Icons.close),
                  onPressed: () => typeController.clear(),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'type required';
                }else{
                  return null;
                }
              },
            ),

            SizedBox(height: 5,),

            Text('Holder Name'),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Holder Name',
                hintText: 'Holder Name',
                suffixIcon: nameController.text.isEmpty
                    ? Container(width:0)
                    : IconButton(
                  icon:Icon(Icons.close),
                  onPressed: () => nameController.clear(),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'name required';
                }else{
                  return null;
                }
              },
            ),

            SizedBox(height: 5,),

            Text('Account Number'),
            TextFormField(
              controller: accountController,
              decoration: InputDecoration(
                labelText: 'Account Number',
                hintText: 'Account Number',
                suffixIcon: accountController.text.isEmpty
                    ? Container(width:0)
                    : IconButton(
                  icon:Icon(Icons.close),
                  onPressed: () => accountController.clear(),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'account number required';
                }else{
                  return null;
                }
              },
            ),

            SizedBox(height: 5,),

            Text('Bank Branch'),
            TextFormField(
              controller: branchController,
              decoration: InputDecoration(
                labelText: 'Bank Branch',
                hintText: 'Bank Branch',
                suffixIcon: branchController.text.isEmpty
                    ? Container(width:0)
                    : IconButton(
                  icon:Icon(Icons.close),
                  onPressed: () => branchController.clear(),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'branch required';
                }else{
                  return null;
                }
              },
            ),

            SizedBox(height: 5,),

            Text('Branch Code'),
            TextFormField(
              controller: codeController,
              decoration: InputDecoration(
                labelText: 'Branch Code',
                hintText: 'Branch Code',
                suffixIcon: codeController.text.isEmpty
                    ? Container(width:0)
                    : IconButton(
                  icon:Icon(Icons.close),
                  onPressed: () => codeController.clear(),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'code required';
                }else{
                  return null;
                }
              },
            ),

          ],
        ),
      )
  );
  //document upload
  //File
  FilePickerResult? insuranceCardResult;

  //Paths
  File? insuranceCardFile;


  //File Picker method
  getDocument() async{
    insuranceCardResult = await FilePicker.platform.pickFiles();

    if(insuranceCardResult != null){
      insuranceCardFile = File(insuranceCardResult!.files.single.path!);
    }else{
      print("No File Selected");
    }
    return insuranceCardFile;
  }


  Widget buildClaimInformation() => Padding(
    padding: EdgeInsets.all(8),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        //overview
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 800,
            height: 200,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blueAccent.withOpacity(0.1),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Provider:'),

                      SizedBox(width: 60,),

                      Text(widget.provider!),
                    ],
                  ),

                  SizedBox(height: 15,),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Network:'),

                      SizedBox(width: 60,),

                      Text(widget.network!),
                    ],
                  ),

                  SizedBox(height: 15,),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Date Received:'),

                      SizedBox(width: 20,),

                      Text(widget.receiveddate!),
                    ],
                  ),

                  SizedBox(height: 15,),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Incident:'),

                      SizedBox(width: 60,),

                      Text(widget.incident!),
                    ],
                  ),

                  SizedBox(height: 15,),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Amount:'),

                      SizedBox(width: 60,),

                      Text(widget.amount!),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: 30,),

        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 800,
            height: 300,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blueAccent.withOpacity(0.1),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Payer Name:'),

                      SizedBox(width: 30,),

                      Text(widget.payername!),
                    ],
                  ),

                  SizedBox(height: 20,),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Group:'),

                      SizedBox(width: 70,),

                      Text(widget.group!),
                    ],
                  ),

                  SizedBox(height: 20,),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Address:'),

                      SizedBox(width: 50,),

                      Text(widget.address!),
                    ],
                  ),

                  SizedBox(height: 20,),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Phone:'),

                      SizedBox(width: 60,),

                      Text(widget.phonenumber!),
                    ],
                  ),


                  SizedBox(height: 20,),


                  //upload image
                 Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Container(
                       width: 300,
                       height: 50,
                       padding: EdgeInsets.all(10),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                         border: Border.all(
                             color: Colors.black45,
                             width: 1
                         ),
                       ),
                       child: Center(
                         child: (insuranceCardResult != null)?
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               insuranceCardResult!.files.single.name,
                               style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.w400,
                               ),
                             ),

                             SizedBox(width: 10,),

                             IconButton(
                               onPressed: (){},
                               icon: Icon(Icons.delete),
                               color: Colors.redAccent,
                               iconSize: 16,
                             )
                           ],
                         ):
                             Text('Insurance Card', style: TextStyle(fontSize: 15),),
                       ),
                     ),

                     SizedBox(height: 5,),

                     ElevatedButton.icon(
                       icon: Icon(Icons.file_upload_outlined),
                       label: Text('Upload Image'),
                       onPressed: () => getDocument(),
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.blue,
                         elevation: 0,
                         minimumSize: Size(90,40),
                       ),
                     )
                   ],
                 ),

                ],
              ),
            ),
          ),
        )
      ],
    ),
  );

  Widget buildPayment() => Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
       Material(
         elevation: 2,
         borderRadius: BorderRadius.circular(11),
         child: Container(
           width: 800,
           padding: EdgeInsets.all(10),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(11),
             color: Colors.blueAccent.withOpacity(0.1),
           ),
           child: Center(
             child: SingleChildScrollView(
               physics: ClampingScrollPhysics(),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Center(
                     child: Text(
                       'Payment Details',
                       style: TextStyle(
                         fontSize: 17, fontWeight: FontWeight.w500,
                       ),
                     ),
                   ),

                   SizedBox(height: 20,),

                   Row(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Payment Type:'),

                       SizedBox(width: 72,),

                       Text(widget.paymenttype!),
                     ],
                   ),

                   SizedBox(height: 10,),


                   Row(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Holder Name:'),



                       SizedBox(width: 75,),

                       Text(widget.holdername!),
                     ],
                   ),

                   SizedBox(height: 10,),

                   Row(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Account Number:'),

                       SizedBox(width: 50,),

                       Text(widget.accountnumber!),
                     ],
                   ),

                   SizedBox(height: 10,),

                   Row(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Bank Branch:'),

                       SizedBox(width: 75,),

                       Text(widget.branch!),
                     ],
                   ),

                   SizedBox(height: 10,),

                   Row(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Branch Code:'),

                       SizedBox(width: 75,),

                       Text(widget.branchcode!),
                     ],
                   ),

                   SizedBox(height: 10,),

                   Row(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Currency:'),

                       SizedBox(width: 100,),

                       Text(widget.currency!),
                     ],
                   ),

                   SizedBox(height: 10,),

                 ],
               ),
             ),
           ),
         ),
       ),

        SizedBox(height: 10,),

        ElevatedButton.icon(
          icon: Icon(Icons.edit),
          label: Text('Edit Payment Details'),
          onPressed: () => showEditDialog(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: Size(400, 40),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            )
          ),

        ),


      ],
    ),
  );

  Widget buildDocuments() => Padding(
    padding: EdgeInsets.all(15),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 65,
          child:
          //search bar
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                onChanged: (value){
                  //_filterData(value);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: 0.8),
                  ),
                  hintText: 'search by document name',
                  suffixIcon: IconButton(icon: Icon(Icons.search, size: 28.0,), onPressed:(){} ,),
                ),
              ),
            ),
          ),
        ),

        SizedBox(
          height: 500,
          child: ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              DocumentComponent(
                viewFunction: (){},
                downloadFucntion: (){},
                documentName: 'Hospital Bill',
              ),

              SizedBox(height: 10,),

              DocumentComponent(
                viewFunction: (){},
                downloadFucntion: (){},
                documentName: 'National ID',
              ),

              SizedBox(height: 10,),

              DocumentComponent(
                viewFunction: (){},
                downloadFucntion: (){},
                documentName: 'Prescription Document',
              ),

            ],
          ),
        ),


      ],
    ),
  );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Claims'),
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
        bottom: TabBar(
          controller: _tabController,
          physics: AlwaysScrollableScrollPhysics(),
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: EdgeInsets.symmetric(horizontal: 35),
          padding: EdgeInsets.all(8.0),
          tabs: [
            Tab(
              text: 'Information',
            ),

            Tab(
              text: 'Payment',
            ),

            Tab(
              text: 'Documents',
            ),

          ],
        ),
      ),
      drawer: DrawerClass(),

      body: TabBarView(
        controller: _tabController,
        children: [
          buildClaimInformation(),

          buildPayment(),

          buildDocuments(),
        ],
      ),

      bottomNavigationBar: NavBar(),

    );
  }
}