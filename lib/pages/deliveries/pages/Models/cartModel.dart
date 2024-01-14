class CartModel {
  String path, name, description;
  int price, numberOfPacks;

  CartModel(
      {required this.name,
      required this.path,
      required this.description,
      required this.price,
      required this.numberOfPacks});
}
