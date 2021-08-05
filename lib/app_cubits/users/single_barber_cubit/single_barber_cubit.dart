import 'package:almezyn/Models/products_model/single_product_model.dart';
import 'package:almezyn/Models/users_models/single_barber_model.dart';
import 'package:almezyn/app_cubits/users/single_barber_cubit/single_barber_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleBarberCubit extends Cubit<SingleBarberStates> {
  SingleBarberCubit() : super(SingleBarberInitialState());

  /// create object from class cubit and using this with Bloc provider
  static SingleBarberCubit get(context) => BlocProvider.of(context);
  SingleBarberModel singleBarberModel ;
  Map  singleBarberMap = {} ;
  int  statusCode = 404 ;
//  String  barberId  ;



  void getSingleBarber({String id}) {
    emit(SingleBarberLoadingState());
    DioHelper.getAllData(url: '/barber/${id}',token : token ).then((value) async {
      if (value.statusCode == 200) {
        singleBarberModel  = SingleBarberModel.fromJson(value.data) ;
        statusCode = value.statusCode ;
        singleBarberMap = value.data ;
        final response = await value.data;
        final item = response['data'];
        print(value.data);

        print("my data is ${response}") ;
//        categories =
//            (item ).map((e) => ToTestApisLamyaaModel.fromJson(e)).toList();
//        print( "resp ${response}") ;
      }
      emit(SingleBarberGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SingleBarberGetErrorState(error: error.toString()));
    });
  }



}