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
  final List<ProductModel> productModel;

  CategoriesInitialState(
      {required this.categoriesModel, required this.productModel});

  @override
  List<Object> get props => [categoriesModel, productModel];
}

class CategoriesErrorState extends CategoriesState {
  final String message;

  CategoriesErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
