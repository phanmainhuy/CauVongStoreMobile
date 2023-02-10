import 'dart:convert';

import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:cauvongstore_mobile/src/resources/api.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:http/http.dart' as http;

Future<dynamic> getListProducts() async {
  try {
    var url = '';

    url = API.getAllProducts + '?page=1&size=100';
    Uri uri = Uri.parse(url);

    final response = await http.get(
      uri,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control_Allow_Origin': '*'
      },
    );
    print('---------statusCode_Products---------');
    print(response.statusCode.toString());
    print(jsonDecode(response.body));
    print('---------statusCode_Products---------');

    if (response.statusCode == APIStatus.apireturnOK) {
      return ResultStatus.fromData(
        response.statusCode,
        ProductDataModel.fromJson(
          json.decode(response.body),
        ),
      );
    } else {
      return ResultStatus.fromData(
        response.statusCode,
        ProductDataModel.fromJson(
          json.decode(response.body),
        ),
      );
    }
  } catch (e) {
    print('CATCH fetchData Products');
    print(e);
  }
}
