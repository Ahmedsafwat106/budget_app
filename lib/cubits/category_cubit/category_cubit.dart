import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/category_model.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final List<CategoryModel> categories = [];

  void addCategory(CategoryModel category) {
    categories.add(category);
    emit(CategoryLoaded(List<CategoryModel>.from(categories)));
  }

  void loadCategories() {
    emit(CategoryLoaded(List<CategoryModel>.from(categories)));
  }
}
