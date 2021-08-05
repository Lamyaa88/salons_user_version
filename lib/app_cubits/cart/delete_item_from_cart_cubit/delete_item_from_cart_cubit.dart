import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/ads_models/all_ads_model.dart';
import 'package:almezyn/Models/cart_models/add_item_to_cart_model.dart';
import 'package:almezyn/app_cubits/ads/all_ads_cubit/all_ads_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/Models/cart_models/all_cart_product_model.dart';
import 'package:almezyn/app_cubits/cart/all_cart_products_cubit/all_cart_products_state.dart';

import 'delete_item_from_cart_state.dart';
import 'package:almezyn/Models/cart_models/delete_item_from_cart_model.dart';
class DeleteItemFromCartCubit extends Cubit<DeleteItemFromCartStates> {
  DeleteItemFromCartCubit() : super(DeleteItemFromCartInitialState());

  /// create object from class cubit and using this with Bloc provider
  static DeleteItemFromCartCubit get(context) => BlocProvider.of(context);

  List<DeleteItemFromCartModel> DeleteItemFromCart = [];
  Map DeleteItemFromCartMap = {} ;

  void getDeleteItemFromCart() {
    emit(DeleteItemFromCartLoadingState());
    DioHelper.postData(
      url: '/delete-from-cart/1',
      data: {"qty" :"1"},
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      DeleteItemFromCartMap = value.data ;
      print ("DeleteItemFromCartMap are : ${DeleteItemFromCartMap}") ;
      DeleteItemFromCart =
          (item as List).map((e) => DeleteItemFromCartModel.fromJson(e)).toList();
      emit(DeleteItemFromCartGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        DeleteItemFromCartGetErrorState(error: error.toString()),
      );
    });
  }
}
