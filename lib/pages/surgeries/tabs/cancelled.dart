import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/viewComponent.dart';
import '../../../models/surgerymodel.dart';
import '../../../services/surgeries/surgeryservice.dart';


class CancelledTab extends StatefulWidget{
  const CancelledTab({Key ? key}): super(key : key);

  State<CancelledTab> createState() => _CancelledTabState();
}

class _CancelledTabState extends State<CancelledTab>{
  final searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //search bar
            SizedBox(
              height: 80,
              child: //search bar
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value){

                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                        alignLabelWithHint: true,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(width: 0.8),
                        ),
                        hintText: 'search by doctor name',
                        suffixIcon: IconButton(icon: Icon(Icons.search, size: 28.0,), onPressed:(){} ,)

                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 600,
              child: Consumer<SurgeryProvider>(
                builder: (context, SurgeryProvider, _){
                  List<SurgeryModel>? surgery = SurgeryProvider.cancelled;

                  if(surgery == null){
                    return Center(child: CircularProgressIndicator(),);
                  }else if(surgery.isEmpty){
                    return Center(child: Text('Surgeries not found'));
                  }else{
                    return  ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.all(8.0),
                      shrinkWrap: true,
                      itemCount: surgery.length,
                      itemBuilder: (context, index){
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ViewComponent(
                              doctorName: surgery[index].doctorName,
                              surgeryDate: surgery[index].surgeryDate.toString(),
                              surgeryType: surgery[index].surgeryType,
                              surgeryVenue: surgery[index].location,
                              description: surgery[index].surgeryDescription,
                            ),

                            SizedBox(height: 10,),
                          ],
                        );

                      },

                    );
                  }
                },
              ),


            ),

          ],
        ),
      ),
    );
  }
}

