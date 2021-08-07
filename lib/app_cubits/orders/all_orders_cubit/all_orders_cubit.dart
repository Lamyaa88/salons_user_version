import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/order_models/all_orders_model.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/orders/all_orders_cubit/all_orders_state.dart';
class AllOrdersCubit extends Cubit<AllOrdersStates> {
  AllOrdersCubit() : super(AllOrdersInitialState());

  /// create object from class cubit and using this with Bloc provider
  static AllOrdersCubit get(context) => BlocProvider.of(context);

AllOrdersModel allOrdersModel ;
  void getAllOrders() {
    emit(AllOrdersLoadingState());
    DioHelper.getAllData(
      url: '/all-orders',
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      allOrdersModel = AllOrdersModel.fromJson(value.data) ;

      print("status code for all orders : ${value.statusCode}");
      print("response in all orders is  : ${response}");
      print("all orders model :  ${allOrdersModel}");
      emit(AllOrdersGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        AllOrdersGetErrorState(error: error.toString()),
      );
    });
  }
}
