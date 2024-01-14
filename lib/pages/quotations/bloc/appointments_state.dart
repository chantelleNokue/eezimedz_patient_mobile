part of 'appointments_bloc.dart';

@immutable

abstract class QuotationState{}

abstract class QuotationActionState extends QuotationState{}

class QuotationInitial extends QuotationState{}
class QuotationfetchingLoadingState extends QuotationState {}

class QuotationfetchingErrorState extends QuotationState {}

class QuotationFetchingSuccessfulState extends QuotationState{
  final List<QuotationModel> quotations;

  QuotationFetchingSuccessfulState({required this.quotations});
}