import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/Models/salons_models/single_salon_model.dart';
import 'package:almezyn/app_cubits/salon/single_salon_cubit/single_salon_state.dart';

class SingleSalonCubit extends Cubit<SingleSalonStates> {
  SingleSalonCubit() : super(SingleSalonInitialState());

  /// create object from class cubit and using this with Bloc provider
  static SingleSalonCubit get(context) => BlocProvider.of(context);

//  List<ToTestApisLamyaaModel> categories = [];
  Map singleSalon = {} ;
//  String singleSalonId  ;
  int statusCode = 404 ;
  SingleSalonModel singleSalonModel ;

  /// get all categories in cubit
  void getSingleSalon({String id }) {
    emit(SingleSalonLoadingState());
    DioHelper.getAllData(url: '/salon/${id}' ,token:  token).then((value) async {
      if (value.statusCode == 200) {
        statusCode = value.statusCode ;
        final response = await value.data;
        final item = response['data'];
        singleSalon = response ;
        print("my data is ${response}") ;
        singleSalonModel = SingleSalonModel.fromJson(value.data) ;

        print("status code for single Salon  : ${value.statusCode}");
        print("response in  single Salon   : ${response}");
        print("single Salon model is  :  ${singleSalon}");
//        categories =
//            (item ).map((e) => ToTestApisLamyaaModel.fromJson(e)).toList();
//        print( "resp ${response}") ;
      }
      emit(SingleSalonGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SingleSalonGetErrorState(error: error.toString()));
    });
  }



}