import 'package:active_bee/core/app_constants/app_assets.dart';
import 'package:active_bee/features/app_categories/models/restaurant_model.dart';

final List<RestaurantModel> allRestaurant = [
  RestaurantModel(
    isOpened: false,
    name: "Wingo",
    type: "Sandwich, Fast food",
    openingHours: "01:00 PM - 11:30 PM",
    deliveryTime: "90 - 100 min",
    deliveryFee: "30,000 SYP",
    distance: "10 KM",
    imageAsset: AppAssets.hamburger,
    logoPath: AppAssets.logo,
  ),
  RestaurantModel(
    isOpened: true,
    name: "KFC",
    type: "Sandwich, Fast food",
    openingHours: "10 AM - 11 PM",
    deliveryTime: "25 mins",
    deliveryFee: "29,900 SYP",
    distance: "2.5 km",
    imageAsset: AppAssets.chicken,
    logoPath: AppAssets.kfcLogo,
  ),
  RestaurantModel(
    isOpened: true,
    name: "Al Mahaba",
    type: "Manakish, Breakfast",
    openingHours: "8 AM - 2 PM",
    deliveryTime: "20 mins",
    deliveryFee: "8,900 SYP",
    distance: "3.2 km",
    imageAsset: AppAssets.taco,
    logoPath: AppAssets.logo,
  ),
  RestaurantModel(
    isOpened: false,
    name: "Wingo",
    type: "Sandwich, Fast food",
    openingHours: "01:00 PM - 11:30 PM",
    deliveryTime: "90 - 100 min",
    deliveryFee: "30,000 SYP",
    distance: "10 KM",
    logoPath: AppAssets.logo,
    imageAsset: AppAssets.hamburger,
  ),
];
