import 'package:cauvongstore_mobile/src/model/category_model.dart';
import 'package:cauvongstore_mobile/src/utils/extension_string.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel data;

  const CategoryItem({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      // backgroundColor: data.color.color,
      child: Image(
        width: 200,
        height: 200,
        image: NetworkImage(data.image),
      ),
    );
  }
}
