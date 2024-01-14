import 'package:flutter/material.dart';

class NewClaimComponent extends StatefulWidget{
  final String? providerName;
  final String? policyid;
  final String? admissiondate;
  final String? status;
  final String? patientImage;

  final actionfunction;

  const NewClaimComponent({
    Key ? key,
    this.providerName,
    this.policyid,
    this.admissiondate,
    this.status,
    this.actionfunction, this.patientImage,
  }): super(key : key);

  State<NewClaimComponent> createState() => _ClaimComponentState();
}


class _ClaimComponentState extends State<NewClaimComponent>{
  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 800,

        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
           border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.patientImage.toString()),
                      backgroundColor: Colors.blue,// Replace with the path to your image
                    ),
                    SizedBox(width: 2,),
                    Text(widget.providerName!, style: TextStyle( fontWeight: FontWeight.w600)),

                    // SizedBox(width: 50,),
                    Spacer(),

                    Container(  color: Colors.blue,child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(widget.status!, style: TextStyle( color: Colors.white, fontWeight: FontWeight.w600)),
                    )),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Policy Number:', style: TextStyle(fontSize: 11, color: Colors.grey)),

                      SizedBox(width: 50,),

                      Text(widget.policyid!, style: TextStyle( color: Colors.grey, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Admitted Date', style: TextStyle(fontSize: 11, color: Colors.grey)),

                      SizedBox(width: 60,),

                      Text(widget.admissiondate!, style: TextStyle( color: Colors.grey, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),



            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Text('Creation Date:'),
            //
            //     SizedBox(width: 20,),
            //
            //     Text(widget.creationdate!),
            //   ],
            // ),





            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed:widget.actionfunction,
                  icon: Icon(Icons.remove_red_eye_rounded),
                  label: Text('View'),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    minimumSize: Size(50, 40),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
