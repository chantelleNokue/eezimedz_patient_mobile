part of 'add_to_cart_bloc.dart';

@immutable
sealed class AddToCartState {
  List<PostModelUi> cartList;
  AddToCartState({required this.cartList});
}

final class AddToCartInitial extends AddToCartState {
  AddToCartInitial({required List<PostModelUi> cartList})
      : super(cartList: cartList);
}

final class AddToCartUpdated extends AddToCartState {
  AddToCartUpdated({required List<PostModelUi> cartList})
      : super(cartList: cartList);
}
