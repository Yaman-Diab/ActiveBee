class RestaurantModel {
  final String name;
  final String type;
  final String openingHours;
  final String deliveryTime;
  final String deliveryFee;
  final String distance;
  final String imageAsset;
  final String logoPath;
  final bool isOpened;

  RestaurantModel({
    required this.name,
    required this.type,
    required this.openingHours,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.distance,
    required this.imageAsset,
    required this.logoPath,
    required this.isOpened,
  });
}
