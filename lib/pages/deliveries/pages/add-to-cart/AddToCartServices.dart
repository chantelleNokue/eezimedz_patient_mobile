import 'package:flutter/foundation.dart';

import '../Models/FormModel.dart';

class AddACart extends ChangeNotifier {
  List<PostModelUi> userCart = [];

  void addToCart(PostModelUi postModelUi) {
    userCart.add(postModelUi);
    notifyListeners();
  }

  List<PostModelUi> getAllCarts() {
    return userCart;
  }

  void removeFromCart(PostModelUi postModelUi) {
    userCart.remove(postModelUi);
    notifyListeners();
  }
}
