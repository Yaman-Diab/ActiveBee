import 'package:active_bee/core/app_constants/app_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySearchCubit extends Cubit<List<Map<String, String>>> {
  CategorySearchCubit() : super(categories);

 
  void filter(String query) {
    if (query.isEmpty) {
      emit(categories);
    } else {
      final result = categories.where((item) => item['label']!.toLowerCase().contains(query.toLowerCase())).toList();
      emit(result);
    }
  }

  void clearSearch() {
    emit(categories);
  }
}