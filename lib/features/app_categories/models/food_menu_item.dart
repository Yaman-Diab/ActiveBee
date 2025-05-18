class FoodMenuItemModel {
  final String title;
  final String description;
  final String price;
  final String? oldPrice;
  final String? discount;
  final String image;
  final String category;

  FoodMenuItemModel({
    required this.title,
    required this.description,
    required this.price,
    this.oldPrice,
    this.discount,
    required this.image,
    required this.category,
  });

  factory FoodMenuItemModel.fromMap(Map<String, String> map) {
    return FoodMenuItemModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      oldPrice: map['oldPrice']?.isNotEmpty == true ? map['oldPrice'] : null,
      discount: map['discount']?.isNotEmpty == true ? map['discount'] : null,
      image: map['image'] ?? '',
      category: map['category'] ?? '',
    );
  }
}
