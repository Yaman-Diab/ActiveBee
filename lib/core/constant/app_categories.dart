import 'package:active_bee/core/constant/app_assets.dart';
import 'package:flutter/material.dart';

final appCategories = [
  {"title": "Restaurants", "icon": Icons.restaurant},
  {"title": "Supermarket", "icon": Icons.local_grocery_store},
  {"title": "Stores", "icon": Icons.storefront},
  {"title": "Electronics", "icon": Icons.electrical_services},
  {"title": "Cosmetics", "icon": Icons.auto_awesome},
  {"title": "Stationery", "icon": Icons.architecture_rounded},
];

final List<Map<String, String>> foodCategories = [
  {"label": "Chicken", "image": AppAssets.chicken},
  {"label": "Grills", "image": AppAssets.grill1},
  {"label": "Mandi", "image": AppAssets.mandi},
  {"label": "Sandwich", "image": AppAssets.sandwich},
  {"label": "Salad", "image": AppAssets.salad},
  {"label": "Dessert", "image": AppAssets.dessert},
  {"label": "Stationery", "image": AppAssets.stationery},
  {"label": "Cosmetics", "image": AppAssets.cosmetics},
];

final List<Map<String, String>> filteredCategories = [];
