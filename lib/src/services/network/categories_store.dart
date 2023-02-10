import 'dart:convert';

import 'package:cauvongstore_mobile/src/model/category_model.dart';
import 'package:cauvongstore_mobile/src/resources/api.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:http/http.dart' as http;

Future<dynamic> getListCategories() async {
  try {
    var url = '';
    url = API.getAllCategories;
    Uri uri = Uri.parse(url);

    final response = await http.get(
      uri,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control_Allow_Origin': '*'
      },
    );
    print('---------statusCode_Categories---------');
    print(response.statusCode.toString());
    print(" ${json.decode(utf8.decode(response.bodyBytes))}");
    print('---------statusCode_Categories---------');

    if (response.statusCode == APIStatus.apireturnOK) {
      print('have data Categories');
      return ResultStatus.fromData(
        response.statusCode,
        CategoryModel.fromJsonList(
          json.decode(utf8.decode(response.bodyBytes)),
        ),
      );
    } else {
      return ResultStatus.fromData(
        response.statusCode,
        CategoryModel.fromJsonList(
          json.decode(response.body),
        ),
      );
    }
  } catch (e) {
    print('CATCH fetchData CATEGORIES');
    print(e);
  }
}
