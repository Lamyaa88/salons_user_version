import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/products_model/all_products_model.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsStates> {
  AllProductsCubit() : super(AllProductsInitialState());
  static AllProductsCubit get(context) => BlocProvider.of(context);
//  List<AllProductsModel> allProducts = [];
  AllProductsModel allProductsModel ;
    int statusCode ;
   void getAllProducts() {
    emit(AllProductsLoadingState());
    DioHelper.getAllData(url: '/all-products' , token: token ).then((value) async {
       allProductsModel  = AllProductsModel.fromJson(value.data);
        print("all products  model is  :  ${allProductsModel}");
      emit(AllProductsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(AllProductsGetErrorState(error: error.toString()));
    });
  }
}
