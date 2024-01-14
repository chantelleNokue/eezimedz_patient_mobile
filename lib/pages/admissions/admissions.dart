import 'package:Eezimedz_Patients/pages/admissions/model/admisiionmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import 'bloc/admissions_bloc.dart';
import 'components/admissioncomponent.dart';
import 'components/viewcomponent.dart';

class Admissions extends StatefulWidget {

  const Admissions({Key? key}) : super(key: key);

  State<Admissions> createState() => _AdmissionsState();
}

class _AdmissionsState extends State<Admissions> {
  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();

  // List<Admission> admissions = [
  //   Admission(
  //     reference: '64ca68ce454',
  //     reason: 'Fever',
  //     admissiondate: '2023-01-02',
  //     dischargedate: '2023-01-07',
  //     ward: '103',
  //   ),
  //   Admission(
  //     reference: '75ca78ce654',
  //     reason: 'Body Ache',
  //     admissiondate: '2022-10-02',
  //     dischargedate: '2022-10-07',
  //     ward: '553',
  //   ),
  //   Admission(
  //     reference: '65ca69ce432',
  //     reason: 'Ulcers',
  //     admissiondate: '2023-06-11',
  //     dischargedate: '2023-06-13',
  //     ward: '109',
  //   ),
  //   Admission(
  //     reference: '64ca68ce454',
  //     reason: 'Fever',
  //     admissiondate: '2023-01-02',
  //     dischargedate: '2023-01-07',
  //     ward: '103',
  //   ),
  // ];

  //search controller
  final searchController = TextEditingController();

  List<AdmissionModel> filteredDataList = [];
  List<AdmissionModel> admission = [];

  @override
  void initState() {
    prescriptionBloc.add(PrescriptionInitialFetchEvent());
    super.initState();
    filteredDataList = admission;
  }


  void _filterData(String searchQuery) {
    List<AdmissionModel> filteredList = [];
    if (searchQuery.isNotEmpty) {
      // Filter the data based on the search query
      filteredList = admission
          .where((admissions) => admissions.bedNumber!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList();
    } else {
      // If the search query is empty, show all the data
      filteredList = admission;
    }
    setState(() {
      filteredDataList = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Admissions'),
        automaticallyImplyLeading: false,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu_sharp,
                color: Colors.white,
              ));
        }),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Profile())),
            icon: Icon(Icons.person),
          ),
        ],
      ),
      drawer: DrawerClass(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: //search bar
                    Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        _filterData(value);
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 15.0),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 0.8),
                          ),
                          hintText: 'search by ward',
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                              size: 28.0,
                            ),
                            onPressed: () {},
                          )),
                    ),
                  ),
                ),
              ),

              BlocConsumer<PrescriptionBloc, PrescriptionState>(
                bloc: prescriptionBloc,
                listenWhen: (previous, current) => current is PrescriptionActionState,
                buildWhen: (previous, current) => current is! PrescriptionActionState,
                listener: (context, state) {
                  // Implementation
                },
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case PrescriptionfetchingLoadingState:
                      return const Center(
                        child: Text('loading'),
                      );
                    case PrescriptionFetchingSuccessfulState:
                      final successState = state as PrescriptionFetchingSuccessfulState;

                      if (successState.prescriptions.isEmpty) {
                        return const Center(
                          child: Text('No prescriptions available'),
                        );
                      }

                      return SizedBox(
                        height: 600,
                        child: ListView.builder(
                          itemCount: successState.prescriptions.length,
                          itemBuilder: (context, index) {
                            final prescription = successState.prescriptions[index];
                            final dischargeDate = prescription.dischargeDetails?.date;
                            final formattedDate = dischargeDate != null
                                ? DateFormat('yyyy-MM-dd').format(dischargeDate)
                                : 'N/A';

                            final admissionDate = DateTime.parse(prescription.patientadmissiondate);
                            final formattedAdmissionDate = admissionDate != null
                                ? DateFormat('yyyy-MM-dd').format(admissionDate)
                                : 'N/A';

                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AdmissionComponent(
                                  ward: prescription.bedNumber,
                                  admissiondate: formattedAdmissionDate,
                                  dischargedate: formattedDate,
                                  viewFunction: () => showDialog(
                                    context: context,
                                    builder: (context) => ViewComponent(
                                      ward: prescription.bedNumber,
                                      reason: prescription.reason,
                                      reference: prescription.caseNumber,
                                      admissiondate: formattedAdmissionDate,
                                      dischargedate: formattedDate,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            );
                          },
                        ),
                      );
                    default:
                      return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

class Admission {
  final String? reference;
  final String? ward;
  final String? reason;
  final String? admissiondate;
  final String? dischargedate;

  Admission({
    this.reference,
    this.ward,
    this.reason,
    this.admissiondate,
    this.dischargedate,
  });
}
