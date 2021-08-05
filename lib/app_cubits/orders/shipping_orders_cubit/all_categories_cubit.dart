import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/categories_models/all_categories_model.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/categories/all_categories_cubit/all_categories_state.dart';
class AllCategoriesCubit extends Cubit<AllCategoriesStates> {
  AllCategoriesCubit() : super(AllCategoriesInitialState());

  /// create object from class cubit and using this with Bloc provider
  static AllCategoriesCubit get(context) => BlocProvider.of(context);

  List<AllCategoriesModel> allCategories = [];

  void getAllCategories() {
    emit(AllCategoriesLoadingState());
    DioHelper.getAllData(
      url: '/all-Categories',
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      allCategories =
          (item as List).map((e) => AllCategoriesModel.fromJson(e)).toList();
      emit(AllCategoriesGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        AllCategoriesGetErrorState(error: error.toString()),
      );
    });
  }
}
