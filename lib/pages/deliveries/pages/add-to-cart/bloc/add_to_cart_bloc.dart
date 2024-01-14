import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/FormModel.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  AddToCartBloc() : super(AddToCartInitial(cartList: [])) {
    on<AddingToCartEvent>(_addCart);
    on<DeletingToCartEvent>(_deleteCart);
    on<UpdatingToCartEvent>(_updateUser);
  }

  FutureOr<void> _addCart(
      AddingToCartEvent event, Emitter<AddToCartState> emit) {
    final updatedCartList = List<PostModelUi>.from(state.cartList);
    final existingIndex = updatedCartList.indexWhere(
      (item) => item.id == event.postModelUi.id,
    );

    if (existingIndex != -1) {
      updatedCartList[existingIndex] = event.postModelUi;
    } else {
      updatedCartList.add(event.postModelUi);
    }

    emit(AddToCartUpdated(cartList: updatedCartList));
  }

  FutureOr<void> _deleteCart(
      DeletingToCartEvent event, Emitter<AddToCartState> emit) {
    state.cartList.remove(event.postModelUi);
    emit(AddToCartUpdated(cartList: state.cartList));
  }

  FutureOr<void> _updateUser(
      UpdatingToCartEvent event, Emitter<AddToCartState> emit) {
    for (int i = 0; i < state.cartList.length; i++) {
      if (event.postModelUi.id == state.cartList[i].id) {
        state.cartList[i] = event.postModelUi;
      }
    }
    emit(AddToCartUpdated(cartList: state.cartList));
  }
}
