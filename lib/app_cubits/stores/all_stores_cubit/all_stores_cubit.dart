import 'package:bloc/bloc.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/stores/all_stores_cubit/all_stores_state.dart';
import 'package:almezyn/Models/stores_models/all_stores_model.dart';
class AllStoresCubit extends Cubit<AllStoresStates> {
  AllStoresCubit() : super(AllStoresInitialState());

  /// create object from class cubit and using this with Bloc provider
  static AllStoresCubit get(context) => BlocProvider.of(context);

  List<AllStoresModel> allStores = [];
  AllStoresModel allStoresModel ;
   int statusCode  = 404 ;
  Map allstoresMap = {} ;

  void getAllStores() {
    emit(AllStoresLoadingState());
    DioHelper.getAllData(
      url: '/all-stores',
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      allstoresMap = value.data ;
      allStores =
          (item as List).map((e) => AllStoresModel.fromJson(e)).toList();
      allStoresModel = AllStoresModel.fromJson(value.data) ;
      statusCode = value.statusCode ;
      print("status code for all stores  : ${value.statusCode}");
      print("response in all stores is  : ${response}");
      print("all stores model :  ${allStores}");
      print("all stores map is ${allstoresMap}");



      emit(AllStoresGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        AllStoresGetErrorState(error: error.toString()),
      );
    });
  }
}
