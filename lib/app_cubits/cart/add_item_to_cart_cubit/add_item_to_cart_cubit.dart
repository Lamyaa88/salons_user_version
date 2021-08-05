import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/ads_models/all_ads_model.dart';
import 'package:almezyn/Models/cart_models/add_item_to_cart_model.dart';
import 'package:almezyn/app_cubits/ads/all_ads_cubit/all_ads_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/Models/cart_models/all_cart_product_model.dart';
import 'package:almezyn/app_cubits/cart/all_cart_products_cubit/all_cart_products_state.dart';

import 'add_item_to_cart_state.dart';

class AddItemToCartCubit extends Cubit<AddItemToCartStates> {
  AddItemToCartCubit() : super(AddItemToCartInitialState());

  /// create object from class cubit and using this with Bloc provider
  static AddItemToCartCubit get(context) => BlocProvider.of(context);

  List<AddItemToCartModel> AddItemToCart = [];
  Map AddItemToCartMap = {} ;

  void getAddItemToCart() {
    emit(AddItemToCartLoadingState());
    DioHelper.postData(
      url: '/add-to-cart/1',
      data: {"qty" :"1"},
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      AddItemToCartMap = value.data ;
      print ("AddItemToCartMap are : ${AddItemToCartMap}") ;
      AddItemToCart =
          (item as List).map((e) => AddItemToCartModel.fromJson(e)).toList();
      emit(AddItemToCartGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        AddItemToCartGetErrorState(error: error.toString()),
      );
    });
  }
}
