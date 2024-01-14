import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import '../profile.dart';
import 'model/claimsModel.dart';
import 'tabs/pending.dart';
import 'tabs/approved.dart';
import 'tabs/medicalpolicies.dart';
import 'tabs/rejected.dart';
import 'bloc/claims_bloc.dart';


class Claims extends StatefulWidget{
  const Claims({Key ? key}): super(key : key);

  State<Claims> createState() => _ClaimsState();
}

class _ClaimsState extends State<Claims> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();


  @override
  void initState() {
    prescriptionBloc.add(PrescriptionInitialFetchEvent());
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }



  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length: 4, vsync: this);
  // }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Claims'),
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
              icon: Icon(Icons.pending, color: Colors.blueGrey, size: 15,),
              text: 'Pending',
            ),

            Tab(
              icon: Icon(Icons.done_outline, color: Colors.greenAccent, size: 15,),
              text: 'Approved',
            ),

            Tab(
              icon: Icon(Icons.cancel, color: Colors.redAccent, size: 15,),
              text: 'Rejected',
            ),

            Tab(
              icon: Icon(Icons.medical_services, color: Colors.orangeAccent, size: 15,),
              text: 'Medical Policies',
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

              final List<ClaimsModel> claimList =
                  successState.prescriptions;

              return  TabBarView(
          controller: _tabController,
          children: [

          Pending(appointmentModel: claimList,),

          Approved(appointmentModel: claimList,),

          Rejected(appointmentModel: claimList,),

          MedicalPolicies(),

          ],
          );

            default:
              return const SizedBox();
          }
        },
      ),
      // body: TabBarView(
      //   controller: _tabController,
      //   children: [
      //
      //     Pending(),
      //
      //     Approved(),
      //
      //     Rejected(),
      //
      //     MedicalPolicies(),
      //
      //   ],
      // ),

      bottomNavigationBar: NavBar(),
    );
  }
}
