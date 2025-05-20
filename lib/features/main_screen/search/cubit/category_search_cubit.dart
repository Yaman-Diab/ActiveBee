import 'package:active_bee/core/constant/app_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySearchCubit extends Cubit<List<Map<String, String>>> {
  CategorySearchCubit() : super(foodCategories);

 
  void filter(String query) {
    if (query.isEmpty) {
      emit(foodCategories);
    } else {
      final result = foodCategories.where((item) => item['label']!.toLowerCase().contains(query.toLowerCase())).toList();
      emit(result);
    }
  }

  void clearSearch() {
    emit(foodCategories);
  }
}