import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class DocumentComponent extends StatelessWidget{
  final String? documentName;
  final viewFunction;
  final downloadFucntion;

  DocumentComponent({
    this.documentName,
    this.viewFunction,
    this.downloadFucntion,
});

  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: GestureDetector(
        onTap: viewFunction,
        child: Container(
          width: 700,
          height: 50,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue.withOpacity(0.09),
            border: Border.all(
              color: Colors.black12,
              width: 1.0,
            )
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Icon(
                   Icons.file_copy_outlined,
                   size: 20,
                 ),

                 SizedBox(width: 10,),

                 Text(documentName!, style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),),

               ],
             ),



              GestureDetector(
                onTap: () => downloadFucntion,
                child: Icon(
                  Icons.cloud_download,
                  size: 23,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
