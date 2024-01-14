import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../profile.dart';
import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import 'bloc/invoices_bloc.dart';
import 'model/invoicesmodel.dart';
import 'tabs/approved.dart';
import 'tabs/cancelled.dart';
import 'tabs/pending.dart';

class ViewInvoices extends StatefulWidget{
  const ViewInvoices({Key ? key}): super(key : key);

  State<ViewInvoices> createState() => _ViewSurgeriesState();
}

class _ViewSurgeriesState extends State<ViewInvoices> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override

  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();

  void initState() {
    prescriptionBloc.add(PrescriptionInitialFetchEvent());
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length: 3, vsync: this);
  // }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Invoices'),
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
                text: 'Pending Invoices',
                icon: FaIcon(FontAwesomeIcons.kitMedical, color: Colors.greenAccent, size: 14,),
              ),

              Tab(
                text: 'Paid Invoices',
                icon: FaIcon(FontAwesomeIcons.history, color: Colors.blueGrey, size: 14,),

              ),

              Tab(
                text: 'Declined Invoices',
                icon: FaIcon(FontAwesomeIcons.cancel, color: Colors.redAccent,size: 14,),
              ),
            ],
          ),
        ),
        drawer: DrawerClass(),

      body: BlocConsumer<PrescriptionBloc, PrescriptionState>(
        bloc: prescriptionBloc,
        listenWhen: (previous, current) =>
        current is PrescriptionActionState,
        buildWhen: ((previous, current) =>
        current is! PrescriptionActionState),
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case PrescriptionfetchingLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PrescriptionFetchingSuccessfulState:
              final successState =
              state as PrescriptionFetchingSuccessfulState;

              final List<InvoicesModel> invoicesList =
                  successState.prescriptions;

              return TabBarView(
                controller: _tabController,

                children: [
                  PendingTab(appointmentModel: invoicesList,),

                  ApprovedTab(appointmentModel: invoicesList,),

                  CancelledTab(appointmentModel: invoicesList,),

                ],
              );

            default:
              return const SizedBox();
          }
        },
      ),


      bottomNavigationBar: NavBar(),
    );
  }
}