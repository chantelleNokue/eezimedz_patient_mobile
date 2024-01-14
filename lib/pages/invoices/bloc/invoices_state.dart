part of 'invoices_bloc.dart';

@immutable

abstract class PrescriptionState{}

abstract class PrescriptionActionState extends PrescriptionState{}

class PrescriptionInitial extends PrescriptionState{}
class PrescriptionfetchingLoadingState extends PrescriptionState {}

class PrescriptionfetchingErrorState extends PrescriptionState {}

class PrescriptionFetchingSuccessfulState extends PrescriptionState{
  final List<InvoicesModel> prescriptions;

  PrescriptionFetchingSuccessfulState({required this.prescriptions});
}