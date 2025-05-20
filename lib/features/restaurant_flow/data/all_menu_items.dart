// core/mock_data/menu_items_data.dart

import 'package:active_bee/core/constant/app_assets.dart';
import 'package:active_bee/features/restaurant_flow/models/food_menu_item.dart';

final List<FoodMenuItemModel> allMenuItems = [
  // 🟢 burgerS
  FoodMenuItemModel(
    title: 'Margherita burger',
    description: 'Classic tomato sauce with mozzarella and fresh basil',
    price: '45,000 SYP',
    oldPrice: '',
    discount: '',
    image: AppAssets.burger, // استبدل الصورة حسب توفرها عندك
    category: 'burgers',
  ),
  FoodMenuItemModel(
    title: 'Pepperoni burger',
    description: 'Spicy pepperoni with cheese blend and tomato sauce',
    price: '55,000 SYP',
    oldPrice: '70,000',
    discount: '21% Off',
    image: AppAssets.burger,
    category: 'burgers',
  ),
  FoodMenuItemModel(
    title: 'Vegetarian burger',
    description: 'Topped with mushrooms, bell peppers, onions and olives',
    price: '50,000 SYP',
    oldPrice: '',
    discount: '',
    image: AppAssets.burger,
    category: 'burgers',
  ),

  // 🔵 DRINKS
  FoodMenuItemModel(
    title: 'Coca-Cola',
    description: '330ml chilled can',
    price: '6,000 SYP',
    oldPrice: '',
    discount: '',
    image: AppAssets.juice, // عدل حسب الموجود عندك
    category: 'Drinks',
  ),
  FoodMenuItemModel(
    title: 'Fresh Orange Juice',
    description: 'Freshly squeezed orange juice (400ml)',
    price: '15,000 SYP',
    oldPrice: '20,000',
    discount: '25% Off',
    image: AppAssets.juice,
    category: 'Drinks',
  ),
  FoodMenuItemModel(
    title: 'Iced Latte',
    description: 'Cold espresso with milk and ice',
    price: '12,000 SYP',
    oldPrice: '',
    discount: '',
    image: AppAssets.juice,
    category: 'Drinks',
  ),

  // 🟣 DESSERTS
  FoodMenuItemModel(
    title: 'Chocolate Lava Cake',
    description: 'Warm chocolate cake with melted center',
    price: '22,000 SYP',
    oldPrice: '',
    discount: '',
    image: AppAssets.dessert,
    category: 'Desserts',
  ),
  FoodMenuItemModel(
    title: 'Cheesecake',
    description: 'Creamy cheesecake with strawberry topping',
    price: '25,000 SYP',
    oldPrice: '32,000',
    discount: '22% Off',
    image: AppAssets.dessert,
    category: 'Desserts',
  ),
  FoodMenuItemModel(
    title: 'Ice Cream Cup',
    description: 'Vanilla, chocolate & strawberry mix',
    price: '18,000 SYP',
    oldPrice: '',
    discount: '',
    image: AppAssets.iceCream,
    category: 'Desserts',
  ),
];
