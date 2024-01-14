part of 'add_to_cart_bloc.dart';

@immutable
sealed class AddToCartEvent {}

class AddingToCartEvent extends AddToCartEvent {
  final PostModelUi postModelUi;

  AddingToCartEvent(this.postModelUi);
}

class DeletingToCartEvent extends AddToCartEvent {
  final PostModelUi postModelUi;

  DeletingToCartEvent(this.postModelUi);
}

class UpdatingToCartEvent extends AddToCartEvent {
  final PostModelUi postModelUi;

  UpdatingToCartEvent(this.postModelUi);
}
