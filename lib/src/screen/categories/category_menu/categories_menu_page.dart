import 'package:cauvongstore_mobile/src/bloc/categories/categories_bloc.dart';
import 'package:cauvongstore_mobile/src/bloc/categories/categories_event.dart';
import 'package:cauvongstore_mobile/src/bloc/categories/categories_state.dart';
import 'package:cauvongstore_mobile/src/model/category_model.dart';
import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/app_dialog.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:cauvongstore_mobile/src/screen/cart/cart_page.dart';
import 'package:cauvongstore_mobile/src/screen/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesMenuPage extends StatelessWidget {
  const CategoriesMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CategoriesMenuPage();
  }
}

class _CategoriesMenuPage extends StatefulWidget {
  const _CategoriesMenuPage({
    Key? key,
  }) : super(key: key);

  @override
  State<_CategoriesMenuPage> createState() => __CategoriesMenuPageState();
}

class __CategoriesMenuPageState extends State<_CategoriesMenuPage> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ProductModel> _products = <ProductModel>[];
  BlocCategories _blocCategories = BlocCategories();

  @override
  void initState() {
    super.initState();
    categories = [];
    _blocCategories = BlocCategories();
    _blocCategories.add(CategoriesInitialEvent());
  }

  @override
  void dispose() {
    _blocCategories.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        title: const Text('Loại sản phẩm'),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
          const SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: BlocListener<BlocCategories, CategoriesState>(
        cubit: _blocCategories,
        listener: (context, state) async {
          switch (state.runtimeType) {
            case CategoriesInitialState:
              {
                CategoriesInitialState res = state as CategoriesInitialState;
                setState(() {
                  categories = res.CategoriesModel;
                });
              }
              break;
            case CategoriesErrorState:
              {
                String message = (state as CategoriesErrorState).message;
                // DispErrorMsg.show(msg: message);
                bool result =
                    await DispErrorMsg.show(msg: message, context: context);
                if (result) {
                  // loadData();
                }
              }
              break;
          }
        },
        child: Column(
          children: [
            Expanded(
              child: _buildCard,
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildCard => Padding(
        // add submenu products
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: Card(
          elevation: 4.0,
          child: ListView.separated(
              itemCount: categories.length,
              shrinkWrap: true,
              separatorBuilder: (_, index) => const SizedBox(height: 15),
              itemBuilder: (_, index) {
                return ExpansionTile(
                  title: Text(
                    categories[index].name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ..._products.map((e) {
                      if (e.categoryId == categories[index].id) {
                        // return ListTile(
                        //   title: Text(
                        //     _products[index].name,
                        //     style: const TextStyle(fontSize: 17),
                        //   ),
                        //   // children: list.subMenu.map(_buildList).toList(),
                        // );
                        return ListTile(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ProductModel(list.name))),
                          },
                          leading: SizedBox(
                            width: 70,
                            height: 70,
                            child: Image.network(
                              _products[index].image,
                            ),
                          ),
                          title: Text(
                            _products[index].name,
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    }).toList(),
                  ],
                );
              }),
        ),
      );
}
