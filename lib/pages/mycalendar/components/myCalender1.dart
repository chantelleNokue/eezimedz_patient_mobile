import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../models1/appointments.dart';
import '../bloc1/appointments_bloc.dart';
// class MyAppCalender extends StatelessWidget {
//   const MyAppCalender({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SfCalendar(
//         view: CalendarView.month,
//         monthViewSettings: MonthViewSettings(
//           appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
//           showAgenda: true,
//         ),
//         dataSource: MeetingDataSource(getAppointments()),
//       ),
//     );
//   }
// }



class MyAppCalender extends StatefulWidget {
  const MyAppCalender({super.key});

  @override
  State<MyAppCalender> createState() => _MyAppCalenderState();
}

class _MyAppCalenderState extends State<MyAppCalender> {
  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();

  @override
  void initState() {
    prescriptionBloc.add(PrescriptionInitialFetchEvent());
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        view: CalendarView.month,
        monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
          showAgenda: true,
        ),
        dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }
}
final PrescriptionBloc prescriptionBloc = PrescriptionBloc();

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];

  final DateTime today = DateTime.now();
  final DateTime startTime =
  DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'meet',
      color: Colors.blue)
  );
  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'meet 2',
      color: Colors.lightBlueAccent)


  );
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

List<AppointmentsModel> getAppointmentss() {
  List<AppointmentsModel> meetings = <AppointmentsModel>[];

  final DateTime today = DateTime.now();
  final DateTime startTime =
  DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  BlocConsumer<PrescriptionBloc, PrescriptionState>(
    bloc: prescriptionBloc,
    listenWhen: (previous, current) => current is PrescriptionActionState,
    buildWhen: (previous, current) => current is! PrescriptionActionState,
    listener: (context, state) {
      // Implementation
    },
    builder: (context, state) {
      if (state is PrescriptionfetchingLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is PrescriptionFetchingSuccessfulState) {
        final successState = state;

        if (successState.prescriptions.isEmpty) {
          return const Center(
            child: Text('No appointments for this day'),
          );
        }

        return Expanded(
          child: SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: successState.prescriptions.length,
              itemBuilder: (context, index) {
                final prescription = meetings[index];
                // final prescription = successState.prescriptions[index];
                return Column(
                  children: [
                   Text('proceure: ${prescription.procedure}'),
                    Text('Prefered Appointment Date: ${prescription.preferredAppointmentDate}')
                  ],
                );
              },
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
    },
  );
  return meetings;
}

class MeetingDataSource2 extends CalendarDataSource {
  MeetingDataSource2(List<AppointmentsModel> source) {
    appointments = source;
  }
}



