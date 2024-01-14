part of 'doctornotes_bloc.dart';

@immutable

abstract class DoctorNotesState{}

abstract class DoctorNotesActionState extends DoctorNotesState{}

class DoctorNotesInitial extends DoctorNotesState{}
class DoctorNotesfetchingLoadingState extends DoctorNotesState {}

class DoctorNotesfetchingErrorState extends DoctorNotesState {}

class DoctorNotesFetchingSuccessfulState extends DoctorNotesState{
  final List<DoctorNotesModel> doctorNotes;

  DoctorNotesFetchingSuccessfulState({required this.doctorNotes});
}