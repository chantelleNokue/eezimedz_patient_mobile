import 'package:flutter/material.dart';

import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import '../profile.dart';
import 'components/topbarcontainer.dart';
import 'components/makepayment/makepayment.dart';
import 'components/paymentmethod/paymentmethod.dart';
import 'components/viewpayments/payments.dart';

class ViewPayments extends StatefulWidget{
  const ViewPayments({Key ? key}): super(key : key);

  State<ViewPayments> createState() => _ViewPaymentsState();
}

class _ViewPaymentsState extends State<ViewPayments>{

 String tabVariable = '';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('My Payments'),
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

      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[

                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      //top part with new payment, total refunds and total payments
                      SizedBox(
                          height: 100,
                          child: Center(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: ClampingScrollPhysics(),
                              padding: EdgeInsets.all(10.0),
                              children: <Widget>[
                                TopBarContainer(
                                  function: (){
                                    setState(() {
                                      tabVariable = 'viewpayment';
                                    });
                                  } ,
                                  icon: Icon(Icons.attach_money_outlined, color: Colors.white,),
                                  label: 'View Payments',
                                ),

                                SizedBox(width: 10,),

                                TopBarContainer(
                                  function: () {
                                    setState(() {
                                      tabVariable = 'makepayment';
                                    });
                                  },
                                  icon: Icon(Icons.download_outlined, color: Colors.white,),
                                  label: 'Make  Payment',
                                ),

                                SizedBox(width: 10,),

                                TopBarContainer(
                                  function: (){
                                    setState(() {
                                      tabVariable = 'addmethod';
                                    });
                                  } ,
                                  icon: Icon(Icons.add_card_outlined, color: Colors.white,),
                                  label: 'Payment Methods',
                                ),

                              ],
                            ),
                          )
                      ),

                    ],
                  ),
                ),

                (tabVariable == 'viewpayment')?
                   Expanded(
                     flex: 4,
                       child: Payments()
                   ) :

                (tabVariable == 'makepayment')?
                   Expanded(
                     flex: 3,
                       child: MakePayment()
                   ) :

                (tabVariable == 'addmethod')?
                   Expanded(
                     flex: 4,
                       child: PaymentMethod()
                   ) :

                  Container(
                    child: Center(
                      child: Text('Pick Tab'),
                      ),
                      ),






              ],
            ),
          )
      ),



      bottomNavigationBar: NavBar(),
    );
  }
}