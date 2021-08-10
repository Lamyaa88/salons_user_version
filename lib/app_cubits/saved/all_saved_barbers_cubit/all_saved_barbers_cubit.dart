import 'package:bloc/bloc.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/saved/all_saved_barbers_cubit/all_saved_barbers_state.dart';
import 'package:almezyn/Models/saved_models/all_saved_barbers_model.dart';
class AllSavedBarbersCubit extends Cubit<AllSavedBarbersStates> {
  AllSavedBarbersCubit() : super(AllSavedBarbersInitialState());
  /// create object from class cubit and using this with Bloc provider
  static AllSavedBarbersCubit get(context) => BlocProvider.of(context);
  AllSavedBarbersModel allSavedBarbersModel ;
  void getAllSavedBarbers() {
    DioHelper.getAllData(
      url: '/saved-barbers',
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      allSavedBarbersModel = AllSavedBarbersModel.fromJson(value.data);
      print("status code for all barbers : ${value.statusCode}");
      print("response for all savedBarbers : ${value.data}");
    }).catchError((error) {
      print(error);

      emit(
        AllSavedBarbersGetErrorState(error: error.toString()),
      );
    });
  }
}
