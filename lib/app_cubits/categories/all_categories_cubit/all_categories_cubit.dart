import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/categories_models/all_categories_model.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_categories_state.dart';

class AllCategoriesCubit extends Cubit<AllCategoriesStates> {
  AllCategoriesCubit() : super(AllCategoriesInitialState());
  static AllCategoriesCubit get(context) => BlocProvider.of(context);
AllCategoriesModel allCategoriesModel ;
  int statusCode ;
  void getAllCategories() {
    emit(AllCategoriesLoadingState());
    DioHelper.getAllData(url: '/all-categories' , token: token ).then((value) async {
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        print("all categories is ${response}") ;
        statusCode = value.statusCode ;
        allCategoriesModel  = AllCategoriesModel.fromJson(value.data);

      }
      emit(AllCategoriesGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(AllCategoriesGetErrorState(error: error.toString()));
    });
  }
}
