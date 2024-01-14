import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import '../bloc1/appointments_bloc.dart';
import '../models1/appointments.dart';
// import '../../appointments/bloc/appointments_bloc.dart';
// import '../../appointments/models/appointments.dart';

class MyCalendar1 extends StatefulWidget {
  final List<AppointmentsModel> appointmentModel;
  const MyCalendar1({Key? key, required this.appointmentModel}) : super(key: key);

  @override
  State<MyCalendar1> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar1> {
  late DateTime _focusedDay;
  late final ValueNotifier<List<Event>> _selectedEvents;
  DateTime? _selectedDay;
  TextEditingController _eventController = TextEditingController();
  Map<DateTime, List<Event>> events = {};

  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    prescriptionBloc.add(PrescriptionInitialFetchEvent());
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  List<AppointmentsModel> appointments = [];
  bool NewArrayEmpty = false;
  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }

    appointments = widget.appointmentModel
        .where((patient) => patient.preferredAppointmentDate.toString() == selectedDay.toString())
        .toList();

    if (appointments.isEmpty) {
      NewArrayEmpty = true;
    } else {
      NewArrayEmpty = false;
    }
    print(appointments);
    print('nokutenda');
  }

  List<AppointmentsModel> filterAppointmentsByDay(List<AppointmentsModel> appointments, DateTime selectedDay) {
    return appointments
        .where((appointment) => DateTime.parse(appointment.preferredAppointmentDate) == (selectedDay))
        .toList();


  }

  // @override
  // initState() {
  //   appointments = widget.appointmentModel
  //       .where((patient) => patient.status == 'Approved')
  //       .toList();
  //
  //   if (appointments.isEmpty) {
  //     NewArrayEmpty = true;
  //   } else {
  //     NewArrayEmpty = false;
  //   }
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                title: Text("Event Name"),
                content: Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: _eventController,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      events.addAll({
                        _selectedDay!: [Event(title: _eventController.text)]
                      });
                      Navigator.of(context).pop();
                      _selectedEvents.value = _getEventsForDay(_selectedDay!);
                    },
                    child: Text("Submit"),
                  ),
                ],
              );
            },
          );
        },
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: _onDaySelected,


            focusedDay: _focusedDay,
            eventLoader: _getEventsForDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },

          ),
          SizedBox(height: 8),
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
                        final prescription = successState.prescriptions[index];
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            onTap: () => print(""),
                            title: Text('${prescription.procedure}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Date: ${prescription.preferredAppointmentDate}'),
                                Text('Time: ${prescription.preferredAppointmentTime}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}

class Event {
  final String? title;

  Event({
    this.title,
  });
}

