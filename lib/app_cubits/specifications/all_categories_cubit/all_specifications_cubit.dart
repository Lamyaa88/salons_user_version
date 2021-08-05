import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/Specifications_models/all_Specifications_model.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_specificationss_state.dart';

class AllSpecificationsCubit extends Cubit<AllSpecificationsStates> {
  AllSpecificationsCubit() : super(AllSpecificationsInitialState());
  static AllSpecificationsCubit get(context) => BlocProvider.of(context);
AllSpecificationsModel allSpecificationsModel ;
  int statusCode ;
  void getAllSpecifications() {
    emit(AllSpecificationsLoadingState());
    DioHelper.getAllData(url: '/all-specifications/5' , token: token ).then((value) async {
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        print("all Specifications is ${response}") ;
        statusCode = value.statusCode ;
        allSpecificationsModel  = AllSpecificationsModel.fromJson(value.data);

      }
      emit(AllSpecificationsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(AllSpecificationsGetErrorState(error: error.toString()));
    });
  }
}
