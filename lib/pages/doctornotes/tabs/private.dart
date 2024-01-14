import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/doctornotesmodel.dart';
import '../../../services/doctornotes/notesservice.dart';
import '../components/notecard.dart';
import '../components/viewcomponent.dart';


class PrivateNotes extends StatefulWidget{
  const PrivateNotes({Key ? key}): super(key : key);


  State<PrivateNotes> createState() => _PrivateNotesState();
}


class _PrivateNotesState extends State<PrivateNotes>{


  //TODO: Implement search for all the api data
  //view note dialog method
  viewDialog(context, String noteTitle, String noteBody, String doctorName, String time, String date) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        title: Text(noteTitle),
        content: ViewComponent(noteBody: noteBody,doctorName: doctorName, time: time, date: date),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          )
        ],
      )
  );

  final searchController = TextEditingController();




  @override
  void initState() {
    super.initState();
    // At the beginning, show all the data

  }


  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 65,
              child: //search bar
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
                      hintText: 'search by doctor',
                      suffixIcon: IconButton(icon: Icon(Icons.search, size: 28.0,), onPressed:(){} ,),
                    ),
                  ),
                ),
              ),
            ),

            Consumer<NotesProvider>(
                builder:(context, NotesProvider, _){
                  List<DoctorNotesModel>? notes = NotesProvider.privatenotes;

                  if(notes == null){
                    return Center(child: CircularProgressIndicator(),);
                  }else if(notes.isEmpty){
                    return Center(child: Text('Doctor\'s Notes Not Found'),);
                  }else {
                    return SizedBox(
                      height: 600,
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.all(8.0),
                        shrinkWrap: true,
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              NoteCard(
                                doctor: notes[index].doctor,
                                date: notes[index].date,
                                function: () =>
                                    viewDialog(
                                      context, notes[index].disgnosis, notes[index].note,
                                      notes[index].doctor, notes[index].time.toString(),
                                      notes[index].date.toString(),
                                    ),
                                noteTitle: notes[index].disgnosis,
                                noteBody: notes[index].note,
                              ),

                              SizedBox(height: 10,),
                            ],
                          );
                        },
                      ),
                    );
                  }
                }
            ),


          ],
        ),
      ),
    );
  }
}