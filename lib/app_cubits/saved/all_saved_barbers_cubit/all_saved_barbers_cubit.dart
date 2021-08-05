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

  List<AllSavedBarbersModel> AllSavedBarbers = [];

  void getAllSavedBarbers() {
    emit(AllSavedBarbersLoadingState());
    DioHelper.getAllData(
      url: '/saved-barbers',
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      AllSavedBarbers =
          (item as List).map((e) => AllSavedBarbersModel.fromJson(e)).toList();
      print("status code for all SavedBarbers : ${value.statusCode}");
      print("response in all SavedBarbers is  : ${response}");
      print("all SavedBarbers model :  ${AllSavedBarbers}");
      emit(AllSavedBarbersGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        AllSavedBarbersGetErrorState(error: error.toString()),
      );
    });
  }
}
