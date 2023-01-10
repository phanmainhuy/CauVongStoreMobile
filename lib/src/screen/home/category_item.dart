import 'package:cauvongstore_mobile/src/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final CategoryModel data;

  const CategoryItem({required this.data, Key? key}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      // backgroundColor: data.color.color,
      child: Image(
        width: 200,
        height: 200,
        image: NetworkImage(widget.data.image),
      ),
    );
  }
}
