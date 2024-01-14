import 'package:flutter/material.dart';

class TopBarContainer extends StatelessWidget{

  final function;
  final Icon? icon;
  final String? label;

  TopBarContainer({this.function, this.icon, this.label});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: function,
        child: Container(
          height: 45,
          width: 120,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  icon!,


                  SizedBox(height: 10,),

                  Expanded(
                    child: Text(
                      label!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}