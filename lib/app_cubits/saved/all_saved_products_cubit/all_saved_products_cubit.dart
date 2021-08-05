import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/saved_models/all_saved_products_model.dart';
import 'package:almezyn/Models/saved_models/all_saved_products_model.dart';

import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all_saved_products_state.dart';
class AllSavedProductsCubit extends Cubit<AllSavedProductsStates> {
  AllSavedProductsCubit() : super(AllSavedProductsInitialState());
  static AllSavedProductsCubit get(context) => BlocProvider.of(context);
  AllSavedProductsModel allSavedProductsModel ;
  Map AllSavedProductsMap = {};
  int statusCode ;
  void getAllSavedProducts() {
    emit(AllSavedProductsLoadingState());
    DioHelper.getAllData(url: '/saved-products' , token: token ).then((value) async {
        final response = await value.data;
        final item = response['data'];
        AllSavedProductsMap = value.data ;
        statusCode = value.statusCode ;
        allSavedProductsModel  = AllSavedProductsModel.fromJson(value.data);
        print("all  saved products  model is  :  ${AllSavedProductsModel}");
        print("response for all saved products is ${value.data}");
      emit(AllSavedProductsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(AllSavedProductsGetErrorState(error: error.toString()));
    });
  }
}
