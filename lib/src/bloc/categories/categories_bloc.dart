import 'package:bloc/bloc.dart';
import 'package:cauvongstore_mobile/src/bloc/categories/categories_event.dart';
import 'package:cauvongstore_mobile/src/bloc/categories/categories_state.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:cauvongstore_mobile/src/services/network/categories_store.dart';
import 'package:equatable/equatable.dart';

class BlocCategories extends Bloc<CategoriesEvent, CategoriesState> {
  BlocCategories() : super(CategoriesState());

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    switch (event.runtimeType) {
      case CategoriesInitialEvent:
        ResultStatus result = await getListCategories();
        print('-----------statusCode BlocCategories----------------');
        print(result.statusCode);
        if (result.statusCode == 200) {
          print('co data ne');
          yield CategoriesInitialState(CategoriesModel: result.data);
        } else {
          print('Khong load duoc data');
          yield CategoriesErrorState(message: 'Khong load duoc data');
        }

        break;

      default:
        break;
    }
  }
}
