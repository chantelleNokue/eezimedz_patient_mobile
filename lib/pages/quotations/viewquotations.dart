import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';

import 'bloc/appointments_bloc.dart';
import 'generatequote.dart';
import 'model/quotation.dart';
import 'tabs/approved.dart';
import 'tabs/pending.dart';

class ViewQuotations extends StatefulWidget{

  const ViewQuotations({Key ? key, }): super(key : key);

  State<ViewQuotations> createState() => _ViewQuotationsState();
}

class _ViewQuotationsState extends State<ViewQuotations> with SingleTickerProviderStateMixin{
  final QuotationBloc prescriptionBloc = QuotationBloc();
  late TabController tabController;

  void initState() {
    prescriptionBloc.add(QuotationInitialFetchEvent());
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }


  // @override
  // void initState() {
  //   super.initState();
  //   tabController = TabController(length: 2, vsync: this);
  // }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Quotations'),
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
          controller: tabController,
          physics: AlwaysScrollableScrollPhysics(),
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: EdgeInsets.symmetric(horizontal: 60),
          tabs: [
            Tab(
              text: 'Approved',
              icon: Icon(Icons.done_outline, color: Colors.blueGrey, size: 16,),
            ),

            Tab(
              text: 'Pending',
              icon: Icon(Icons.pending, color: Colors.greenAccent, size: 16,),
            ),
          ],
        ),
      ),
        drawer: DrawerClass(),
      body: BlocConsumer<QuotationBloc, QuotationState>(
        bloc: prescriptionBloc,
        listenWhen: (previous, current) =>
        current is QuotationActionState,
        buildWhen: ((previous, current) =>
        current is! QuotationActionState),
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case QuotationfetchingLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case QuotationFetchingSuccessfulState:
              final successState =
              state as QuotationFetchingSuccessfulState;

              final List<QuotationModel> quotationList =
                  successState.quotations;

              return TabBarView(
          controller: tabController,
          physics: AlwaysScrollableScrollPhysics(),
          children: [
          ApprovedTab(appointmentModel: quotationList,),

          PendingTab(appointmentModel: quotationList,),
          ],
          );

            default:
              return const SizedBox();
          }
        },
      ),
      // body: TabBarView(
      //   controller: tabController,
      //   physics: AlwaysScrollableScrollPhysics(),
      //   children: [
      //     ApprovedTab(),
      //
      //     PendingTab(),
      //   ],
      // ),

      bottomNavigationBar: NavBar(),
    );
  }
}
