import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/stores_models/all_home_stores_model.dart';
import 'package:almezyn/app_cubits/stores/all_home_stores_cubit/all_home_stores_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AllHomeStoresCubit extends Cubit<AllHomeStoresStates> {
  AllHomeStoresCubit() : super(AllHomeStoresInitialState());

  /// create object from class cubit and using this with Bloc provider
  static AllHomeStoresCubit get(context) => BlocProvider.of(context);

  List<AllHomeStoresModel> AllHomeStores = [];

  void getAllHomeStores() {
    emit(AllHomeStoresLoadingState());
    DioHelper.getAllData(
      url: '/all-Stores',
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      AllHomeStores =
          (item as List).map((e) => AllHomeStoresModel.fromJson(e)).toList();
      emit(AllHomeStoresGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        AllHomeStoresGetErrorState(error: error.toString()),
      );
    });
  }
}
