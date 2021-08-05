import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/order_models/pending_orders_model.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/orders/pending_orders_cubit/pending_orders_state.dart';
class PendingOrdersCubit extends Cubit<PendingOrdersStates> {
  PendingOrdersCubit() : super(PendingOrdersInitialState());

  /// create object from class cubit and using this with Bloc provider
  static PendingOrdersCubit get(context) => BlocProvider.of(context);

  List<PendingOrdersModel> PendingOrders = [];

  void getPendingOrders() {
    emit(PendingOrdersLoadingState());
    DioHelper.getAllData(
      url: '/all-Categories',
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      PendingOrders =
          (item as List).map((e) => PendingOrdersModel.fromJson(e)).toList();
      emit(PendingOrdersGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        PendingOrdersGetErrorState(error: error.toString()),
      );
    });
  }
}
