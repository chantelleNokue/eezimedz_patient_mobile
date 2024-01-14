import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../models/appointmentsmodel.dart';

import 'package:table_calendar/table_calendar.dart';

class MyAppCalenderrrrr extends StatefulWidget {
  const MyAppCalenderrrrr({super.key});

  @override
  State<MyAppCalenderrrrr> createState() => _MyAppCalenderrrrrState();
}

class _MyAppCalenderrrrrState extends State<MyAppCalenderrrrr> {
  String procedure = '';
  String preferredAppointmentDatee = '';
  String preferredAppointmentTime = '';
  String appliedService = '';





  late DateTime _focusedDay;
  late final ValueNotifier<List<AppointmentModel>> _selectedEvents;
  DateTime? _selectedDay;
  TextEditingController _eventController = TextEditingController();
  Map<DateTime, List<AppointmentModel>> eventss = {};
  late Map<DateTime, List<AppointmentModel>> groupedAppointments;


  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    fetchAppointments().then((appointments) {
      groupedAppointments = _groupAppointmentsByDate(appointments);
    });
  }

  List<AppointmentModel> _getEventsForDay(DateTime day) {
    return eventss[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    print('selectedDay: $selectedDay, focusedDay: $focusedDay');

    final appointmentsForSelectedDay = groupedAppointments[selectedDay] ?? [];
    print("chantelle: ${appointmentsForSelectedDay}");

    // You can now handle the selected day and the associated appointments
  }

  Future<List<AppointmentModel>> fetchAppointments() async {
    final response = await http.get(Uri.parse(
        'http://20.164.214.226:3060/mongo/bookings/getBookingsByEmail?email=chantellemabvura@gmail.com'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<AppointmentModel> appointments = jsonResponse.map((appointmentJson) {
        return AppointmentModel.fromJson(appointmentJson);
      }).toList();

      print('Appointments count: ${appointments.length}');
      return appointments;
    } else {
      throw Exception('Failed to load appointments');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<AppointmentModel>>(
          future: fetchAppointments(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final appointments = snapshot.data!;
              final groupedAppointmentss =
                  _groupAppointmentsByDate(appointments);
              // print("Grouped App: ${groupedAppointmentss}");
              return Column(
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
                    firstDay: DateTime(1990),
                    lastDay: DateTime(2050),
                    focusedDay: _focusedDay,
                    calendarFormat: CalendarFormat.month,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    startingDayOfWeek: StartingDayOfWeek.monday,

                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, date, appointments) {
                        final formattedDate = DateFormat('yyyy-MM-dd').format(date);

                        // Count appointments for the current date
                        int count = 0;
                        groupedAppointmentss.forEach((eventDate, events) {
                          events.forEach((event) {
                            final formattedPreferredAppointmentDate = DateFormat('yyyy-MM-dd').format(event.preferredAppointmentDate);
                            if (formattedPreferredAppointmentDate == formattedDate) {
                              count++;
                            }
                          });
                          // print("Count: $count");
                        });

                        return Container(
                          child: Visibility(
                            visible: count != 0,
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                      final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDay);
                      print('selectedDay: $formattedDate, focusedDay: $focusedDay');

                      setState(() {
                        procedure = '';
                        preferredAppointmentDatee = '';
                        preferredAppointmentTime = '';
                        appliedService = '';

                        groupedAppointmentss.forEach((date, appointmentsForSelectedDay) {
                          if (isSameDay(selectedDay, date)) {
                            for (var appointment in appointmentsForSelectedDay) {
                              procedure = appointment.procedure;
                              preferredAppointmentDatee = appointment.preferredAppointmentDate.toString();
                              appliedService = appointment.appliedService;
                              preferredAppointmentTime = appointment.preferredAppointmentTime.toString();
                            }
                          }
                          print('Appointment For day: $appointmentsForSelectedDay $procedure');
                        });

                      });
                    },
                    onPageChanged: (focusedDay) {
                      setState(() {
                        _focusedDay = focusedDay;
                      });
                    },
                    // onDaySelected: _onDaySelected,
                  ),
SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    // decoration: BoxDecoration(
                    //   border: Border.all(),
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    child: Column(
                      children: [
                        if (procedure.isNotEmpty && preferredAppointmentDatee != null) ...[
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: 'Procedure: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: '${procedure}'),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: 'Appointment Date: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: '${preferredAppointmentDatee.toString()}'),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: 'Appointment Time: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: '${preferredAppointmentTime.toString()}'),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: 'Applied Service: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: '${appliedService}'),
                              ],
                            ),
                          ),
                          // Text('Preferred Appointment Date: ${preferredAppointmentDatee.toString()}'),
                          // Text('Applied Service: ${appliedService}'),
                        ],
                        if (procedure.isEmpty || preferredAppointmentDatee == null)
                          Text('No appointments for the selected day'),
                      ],
                    ),
                  ),

                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            return Container(
              child: Text('nokutenda'),
            );
          }),
    );
  }
}

class Appointment {
  final String title;
  final DateTime date;

  Appointment({required this.title, required this.date});

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      title: json['title'],
      date: DateTime.parse(json['date']),
    );
  }
}

Map<DateTime, List<AppointmentModel>> _groupAppointmentsByDate(
    List<AppointmentModel> appointments) {
  return appointments.fold({}, (map, appointment) {
    map
        .putIfAbsent(appointment.preferredAppointmentDate, () => [])
        .add(appointment);
    // print(appointments);
    // print("Appointment Date ${appointment.preferredAppointmentDate}");
    // print(appointment.procedure);
    // print(appointments);
    return map;
  });
}


