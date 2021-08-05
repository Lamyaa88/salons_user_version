import 'package:almezyn/Models/products_model/search_products_model.dart';
import 'package:almezyn/app_cubits/products/search_products_cubit/search_products_state.dart';
import 'package:bloc/bloc.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProdustsCubit extends Cubit<SearchProductsStates> {
  SearchProdustsCubit() : super(SearchProductsInitialState());
  static SearchProdustsCubit get(context) => BlocProvider.of(context);
  SearchProductsModel searchProdustsModel ;
  int statusCode ;
  void getSearchProdusts( String searchWord) {
    emit(SearchProductsLoadingState());
    DioHelper.getAllData(url: '/search-product?name${searchWord}' , token: token ).then((value) async {
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        print(response) ;
        statusCode = value.statusCode ;
        searchProdustsModel  = SearchProductsModel.fromJson(value.data);

      }
      emit(SearchProductsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SearchProductsGetErrorState(error: error.toString()));
    });
  }
}
