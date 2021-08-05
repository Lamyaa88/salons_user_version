import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/ads_models/all_ads_model.dart';
import 'package:almezyn/Models/cart_models/add_item_to_cart_model.dart';
import 'package:almezyn/app_cubits/ads/all_ads_cubit/all_ads_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/Models/cart_models/all_cart_product_model.dart';
import 'package:almezyn/app_cubits/cart/all_cart_products_cubit/all_cart_products_state.dart';

import 'empty_cart_state.dart';
import 'package:almezyn/Models/cart_models/delete_item_from_cart_model.dart';
import 'package:almezyn/Models/cart_models/update_item_in_cart_model.dart';
import 'package:almezyn/Models/cart_models/empty_cart_model.dart';
class EmptyCartCubit extends Cubit<EmptyCartStates> {
  EmptyCartCubit() : super(EmptyCartInitialState());

  /// create object from class cubit and using this with Bloc provider
  static EmptyCartCubit get(context) => BlocProvider.of(context);

  List<EmptyCartModel> EmptyCart = [];
  Map EmptyCartMap = {} ;

  void getEmptyCart() {
    emit(EmptyCartLoadingState());
    DioHelper.postData(
      url: '/empty-cart',
      data: {"qty" :"1"},
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      EmptyCartMap = value.data ;
      print ("EmptyCartMap are : ${EmptyCartMap}") ;
      EmptyCart =
          (item as List).map((e) => EmptyCartModel.fromJson(e)).toList();
      emit(EmptyCartGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        EmptyCartGetErrorState(error: error.toString()),
      );
    });
  }
}
