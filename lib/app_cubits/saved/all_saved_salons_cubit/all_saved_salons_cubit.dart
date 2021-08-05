import 'package:bloc/bloc.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/Models/saved_models/all_saved_salons_model.dart';
import 'package:almezyn/app_cubits/saved/all_saved_salons_cubit/all_saved_salons_state.dart';
class AllSavedSalonsCubit extends Cubit<AllSavedSalonsStates> {
  AllSavedSalonsCubit() : super(AllSavedSalonsInitialState());
  static AllSavedSalonsCubit get(context) => BlocProvider.of(context);
  AllSavedSalonsModel savedSalonsModel ;
  void getAllSavedSalons() {
    emit(AllSavedSalonsLoadingState());
    DioHelper.getAllData(
      url: '/saved-salons',
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      savedSalonsModel = AllSavedSalonsModel.fromJson(value.data);
      print("status code for all SavedSalons : ${value.statusCode}");
      print("response for all SavedSalons : ${value.data}");

      emit(AllSavedSalonsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        AllSavedSalonsGetErrorState(error: error.toString()),
      );
    });
  }
}
