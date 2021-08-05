import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/users_models/all_barbers_model.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_barbers_state.dart';

class AllBarbersCubit extends Cubit<AllBarbersStates> {
  AllBarbersCubit() : super(AllBarbersInitialState());
  static AllBarbersCubit get(context) => BlocProvider.of(context);
  AllBarbersModel allBarbersModel ;
   int statusCode  =  404 ;
  void getAllBarbers() {
    emit(AllBarbersLoadingState());
    DioHelper.getAllData(url: '/barbers'  , token: token).then((value) async {
      if (value.statusCode == 200) {
        allBarbersModel = AllBarbersModel.fromJson(value.data);
        print(" view barbers response is ${value.data}");
      }
      emit(AllBarbersGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(AllBarbersGetErrorState(error: error.toString()));
    });
  }
}
