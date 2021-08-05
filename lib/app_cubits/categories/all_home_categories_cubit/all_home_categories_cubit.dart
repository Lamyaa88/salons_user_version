import 'package:bloc/bloc.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/categories/all_home_categories_cubit/all_home_categories_state.dart';
import 'package:almezyn/Models/categories_models/all_home_categories_model.dart';
class AllHomeCategoriesCubit extends Cubit<AllHomeCategoriesStates> {
  AllHomeCategoriesCubit() : super(AllHomeCategoriesInitialState());

  /// create object from class cubit and using this with Bloc provider
  static AllHomeCategoriesCubit get(context) => BlocProvider.of(context);

  List<AllHomeCategoriesModel> AllHomeCategories = [];

  void getAllHomeCategories() {
    emit(AllHomeCategoriesLoadingState());
    DioHelper.getAllData(
      url: '/AllHome-Categories',
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      AllHomeCategories =
          (item as List).map((e) => AllHomeCategoriesModel.fromJson(e)).toList();
      emit(AllHomeCategoriesGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        AllHomeCategoriesGetErrorState(error: error.toString()),
      );
    });
  }
}
