import 'package:cauvongstore_mobile/src/model/category_model.dart';
import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:equatable/equatable.dart';

class CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesInitialState extends CategoriesState with EquatableMixin {
  final List<CategoryModel> categoriesModel;

  CategoriesInitialState({required this.categoriesModel});

  @override
  List<Object> get props => [categoriesModel];
}

class CategoriesErrorState extends CategoriesState {
  final String message;

  CategoriesErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
