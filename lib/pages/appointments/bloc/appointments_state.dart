part of 'appointments_bloc.dart';

@immutable

abstract class PrescriptionState{}

abstract class PrescriptionActionState extends PrescriptionState{}

class PrescriptionInitial extends PrescriptionState{}
class PrescriptionfetchingLoadingState extends PrescriptionState {}

class PrescriptionfetchingErrorState extends PrescriptionState {}

class PrescriptionFetchingSuccessfulState extends PrescriptionState{
  final List<AppointmentsModel> prescriptions;

  PrescriptionFetchingSuccessfulState({required this.prescriptions});
}