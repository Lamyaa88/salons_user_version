import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/salons_models/all_salons_model.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_salons_state.dart';
class AllSalonsCubit extends Cubit<AllSalonsStates> {
  AllSalonsCubit() : super(AllSalonsInitialState());
  /// create object from class cubit and using this with Bloc provider
  static AllSalonsCubit get(context) => BlocProvider.of(context);
  AllSalonsModel allSalonsModel ;
  int statusCode = 404 ;
  void getAllSalons() {
    emit(AllSalonsLoadingState());
    DioHelper.getAllData(
      url: '/salons',
      token: token ,
    ).then((value) {
      print("token is ${token}");

      print("all salons is ${value.data}");
      allSalonsModel = AllSalonsModel.fromJson(value.data) ;
      final response = value.data;
      final item = response['data'];
      statusCode = value.statusCode ;



      emit(AllSalonsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        AllSalonsGetErrorState(error: error.toString()),
      );
    });
  }
}
