import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/ads_models/all_ads_model.dart';
import 'package:almezyn/Models/cart_models/add_item_to_cart_model.dart';
import 'package:almezyn/Models/order_models/make_order_model.dart';
import 'package:almezyn/Models/order_models/update_order_model.dart';
import 'package:almezyn/app_cubits/ads/all_ads_cubit/all_ads_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/Models/cart_models/all_cart_product_model.dart';
import 'package:almezyn/app_cubits/cart/all_cart_products_cubit/all_cart_products_state.dart';

import 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderStates> {
  UpdateOrderCubit() : super(UpdateOrderInitialState());

  /// create object from class cubit and using this with Bloc provider
  static UpdateOrderCubit get(context) => BlocProvider.of(context);

  List<UpdateOrderModel> UpdateOrder = [];
  Map UpdateOrderMap = {} ;

  void getUpdateOrder() {
    emit(UpdateOrderLoadingState());
    DioHelper.postData(
      url: '/add-to-cart/1',
      data: {"qty" :"1"},
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      UpdateOrderMap = value.data ;
      print ("UpdateOrderMap are : ${UpdateOrderMap}") ;
      UpdateOrder =
          (item as List).map((e) => UpdateOrderModel.fromJson(e)).toList();
      emit(UpdateOrderGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        UpdateOrderGetErrorState(error: error.toString()),
      );
    });
  }
}
