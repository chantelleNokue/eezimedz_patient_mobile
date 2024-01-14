part of 'appointments_bloc.dart';

@immutable
abstract class PrescriptionEvent{}

class PrescriptionInitialFetchEvent extends PrescriptionEvent{

}
class FetchPrescriptionsByDateEvent extends PrescriptionEvent {
  final DateTime date;

  FetchPrescriptionsByDateEvent({required this.date});
}


