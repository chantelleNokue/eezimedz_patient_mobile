import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class PaymentMethod extends StatefulWidget{
  const PaymentMethod({Key ? key}): super(key : key);

  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod>{
  @override
  Widget build(BuildContext context){
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[



        Center(
          child: Text(
            'You have 3 active payment methods.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),

        SizedBox(height: 20,),

        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Slidable(
                startActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: <Widget>[
                    SlidableAction(
                      icon: Icons.remove_red_eye_outlined,
                      backgroundColor: Colors.lightBlueAccent,
                      label: 'View Details',
                      onPressed: (context) => print('view'),
                    ),

                    SlidableAction(
                      icon: Icons.delete_forever_outlined,
                      backgroundColor: Colors.deepOrangeAccent,
                      label: 'Remove',
                      onPressed: (context) => print('remove'),
                    ),
                  ],
                ),

                child: ListTile(
                  leading: Icon(Icons.paypal, color: Colors.blue,),
                  title: Text('PayPal: brianmashavakure@gmail.com '),
                ),
              ),
            ),

            SizedBox(height: 5,),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Slidable(
                startActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: <Widget>[
                    SlidableAction(
                      icon: Icons.remove_red_eye_outlined,
                      backgroundColor: Colors.lightBlueAccent,
                      label: 'View Details',
                      onPressed: (context) => print('view'),
                    ),

                    SlidableAction(
                      icon: Icons.delete_forever_outlined,
                      backgroundColor: Colors.deepOrangeAccent,
                      label: 'Remove',
                      onPressed: (context) => print('remove'),
                    ),
                  ],
                ),

                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.bank, color: Colors.teal,),
                  title: Text('Capitec Bank , Account number AED2345678'),
                ),
              ),
            ),

            SizedBox(height: 5,),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Slidable(
                startActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: <Widget>[
                    SlidableAction(
                      icon: Icons.remove_red_eye_outlined,
                      backgroundColor: Colors.lightBlueAccent,
                      label: 'View Details',
                      onPressed: (context) => print('view'),
                    ),

                    SlidableAction(
                      icon: Icons.delete_forever_outlined,
                      backgroundColor: Colors.deepOrangeAccent,
                      label: 'Remove',
                      onPressed: (context) => print('remove'),
                    ),
                  ],
                ),

                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.creditCard, color: Colors.greenAccent,),
                  title: Text('FNB Wealth Management Fund card'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}