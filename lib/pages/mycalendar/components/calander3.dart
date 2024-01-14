import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models1/appointments.dart';
import '../bloc1/appointments_bloc.dart';

class MyCalendar2 extends StatefulWidget {
  const MyCalendar2({super.key});

  @override
  State<MyCalendar2> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar2> {
  DateTime _focusedDay = DateTime.now();
  late final ValueNotifier<List<AppointmentsModel>> _selectedEvents;
  DateTime? _selectedDay;
  TextEditingController _eventController = TextEditingController();
  // Map<DateTime, List<AppointmentsModel>> events = {};
  List<AppointmentsModel> predefinedEvents = [
    AppointmentsModel(
        procedure: 'Appointment 1',
        patientId: '',
        email: '',
        firstName: '',
        lastName: '',
        dateOfBirth: '',
        gender: '',
        nationalId: '',
        appliedService: '',
        department: '',
        outcome: [],
        preferredAppointmentDate: '2023-12-02',
        preferredAppointmentTime: '',
        appointmentid: '',
        preferredDoctor: '',
        id: '',
        status: '',
        siteid: '',
        langauge: '',
        serviceProvider: '',
        otherServices: '',
        diability: '',
        sensoryProcessing: '',
        communication: '',
        cognitiveDisability: '',
        streetAddress: '',
        city: '',
        state: '',
        postalZipcode: '',
        createdAt: '',
        updatedAt: '',
        v: 1
      // Populate other properties of AppointmentsModel as needed
    ),
    AppointmentsModel(
        procedure: 'Appointment 2',
        patientId: '',
        email: '',
        firstName: '',
        lastName: '',
        dateOfBirth: '',
        gender: '',
        nationalId: '',
        appliedService: '',
        department: '',
        outcome: [],
        preferredAppointmentDate: '2023-12-02',
        preferredAppointmentTime: '',
        appointmentid: '',
        preferredDoctor: '',
        id: '',
        status: '',
        siteid: '',
        langauge: '',
        serviceProvider: '',
        otherServices: '',
        diability: '',
        sensoryProcessing: '',
        communication: '',
        cognitiveDisability: '',
        streetAddress: '',
        city: '',
        state: '',
        postalZipcode: '',
        createdAt: '',
        updatedAt: '',
        v: 1
      // Populate other properties of AppointmentsModel as needed
    ),
    // Add more predefined events as needed
  ];

  Map<DateTime, List<AppointmentsModel>> events = {};

  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();
  @override
  void initState() {
    prescriptionBloc.add(PrescriptionInitialFetchEvent());
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    events = _buildEventsMap(predefinedEvents);
  }

  Map<DateTime, List<AppointmentsModel>> _buildEventsMap(
      List<AppointmentsModel> eventsList) {
    final Map<DateTime, List<AppointmentsModel>> eventsMap = {};
    for (final event in eventsList) {
      final eventDate = DateTime.parse(event.preferredAppointmentDate);
      eventsMap[eventDate] = eventsMap[eventDate] ?? [];
      eventsMap[eventDate]!.add(event);
    }
    return eventsMap;
  }

  List<AppointmentsModel> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  // List<AppointmentsModel> _getEventsForDay(DateTime day) {
  //   final selectedDayEvents = events[day];
  //   return selectedDayEvents ?? [];
  // }

  @override
  void dispose() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "My Calendar",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: Colors.blue,
      // ),
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
                            _selectedDay!: [
                              AppointmentsModel(
                                  procedure: _eventController.text,
                                  patientId: '',
                                  email: '',
                                  firstName: '',
                                  lastName: '',
                                  dateOfBirth: '',
                                  gender: '',
                                  nationalId: '',
                                  appliedService: '',
                                  department: '',
                                  outcome: [],
                                  preferredAppointmentDate: '',
                                  preferredAppointmentTime: '',
                                  appointmentid: '',
                                  preferredDoctor: '',
                                  id: '',
                                  status: '',
                                  siteid: '',
                                  langauge: '',
                                  serviceProvider: '',
                                  otherServices: '',
                                  diability: '',
                                  sensoryProcessing: '',
                                  communication: '',
                                  cognitiveDisability: '',
                                  streetAddress: '',
                                  city: '',
                                  state: '',
                                  postalZipcode: '',
                                  createdAt: '',
                                  updatedAt: '',
                                  v: 1)
                            ]
                          });
                          Navigator.of(context).pop();
                          _selectedEvents.value =
                              _getEventsForDay(_selectedDay!);
                        },
                        child: Text("Submit"))
                  ],
                );
              });
        },
      ),
      body: Column(children: [
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
            _focusedDay = focusedDay;
          },
        ),
        SizedBox(
          height: 08,
        ),
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          onTap: () => print(""),
                          title: Text('${value[index].procedure}'),
                        ),
                      );
                    });
              }),
        )
      ]),
    );
  }
}

class Event {
  final String? title;

  Event({
    this.title,
  });
}
