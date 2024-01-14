part of 'myvisits_bloc.dart';

@immutable

abstract class MyvisitsState{}

abstract class MyvisitsActionState extends MyvisitsState{}

class MyvisitsInitial extends MyvisitsState{}
class MyvisitsfetchingLoadingState extends MyvisitsState {}

class MyvisitsfetchingErrorState extends MyvisitsState {}

class MyvisitsFetchingSuccessfulState extends MyvisitsState{
  final List<MyVisitsModel> myvisits;

  MyvisitsFetchingSuccessfulState({required this.myvisits});
}