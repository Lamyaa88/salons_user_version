import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/order_models/shipping_orders_model.dart';
import 'package:almezyn/app_cubits/orders/shipping_orders_cubit/shipping_orders_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ShippingOrdersCubit extends Cubit<ShippingOrdersStates> {
  ShippingOrdersCubit() : super(ShippingOrdersInitialState());

  /// create object from class cubit and using this with Bloc provider
  static ShippingOrdersCubit get(context) => BlocProvider.of(context);

  List<ShippingOrdersModel> ShippingOrders = [];

  void getShippingOrders() {
    emit(ShippingOrdersLoadingState());
    DioHelper.getAllData(
      url: '/all-Categories',
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      ShippingOrders =
          (item as List).map((e) => ShippingOrdersModel.fromJson(e)).toList();
      emit(ShippingOrdersGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        ShippingOrdersGetErrorState(error: error.toString()),
      );
    });
  }
}
