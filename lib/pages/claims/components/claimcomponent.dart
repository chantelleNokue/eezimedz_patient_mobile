import 'package:flutter/material.dart';

class ClaimComponent extends StatefulWidget{
  final String? claimid;
  final String? policyid;
  final String? creationdate;
  final String? status;
  final actionfunction;

  const ClaimComponent({
    Key ? key,
    this.claimid,
    this.policyid,
    this.creationdate,
    this.status,
    this.actionfunction,
  }): super(key : key);

  State<ClaimComponent> createState() => _ClaimComponentState();
}


class _ClaimComponentState extends State<ClaimComponent>{
  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 800,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue.withOpacity(0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Claim ID:'),

                SizedBox(width: 50,),

                Text(widget.claimid!),
              ],
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Policy ID:'),

                SizedBox(width: 50,),

                Text(widget.policyid!),
              ],
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Status:'),

                SizedBox(width: 60,),

                Text(widget.status!),
              ],
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Creation Date:'),

                SizedBox(width: 20,),

                Text(widget.creationdate!),
              ],
            ),





            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed:widget.actionfunction,
                  icon: Icon(Icons.remove_red_eye_rounded),
                  label: Text('View Claim'),
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
