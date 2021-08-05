import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/ads_models/all_ads_model.dart';
import 'package:almezyn/Models/cart_models/add_item_to_cart_model.dart';
import 'package:almezyn/Models/order_models/make_order_model.dart';
import 'package:almezyn/app_cubits/ads/all_ads_cubit/all_ads_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/Models/cart_models/all_cart_product_model.dart';
import 'package:almezyn/app_cubits/cart/all_cart_products_cubit/all_cart_products_state.dart';

import 'make_order_state.dart';

class MakeOrderCubit extends Cubit<MakeOrderStates> {
  MakeOrderCubit() : super(MakeOrderInitialState());

  /// create object from class cubit and using this with Bloc provider
  static MakeOrderCubit get(context) => BlocProvider.of(context);

  List<MakeOrderModel> MakeOrder = [];
  Map MakeOrderMap = {} ;

  void getMakeOrder() {
    emit(MakeOrderLoadingState());
    DioHelper.postData(
      url: '/add-to-cart/1',
      data: {"qty" :"1"},
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      MakeOrderMap = value.data ;
      print ("MakeOrderMap are : ${MakeOrderMap}") ;
      MakeOrder =
          (item as List).map((e) => MakeOrderModel.fromJson(e)).toList();
      emit(MakeOrderGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        MakeOrderGetErrorState(error: error.toString()),
      );
    });
  }
}
