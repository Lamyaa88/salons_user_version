import 'package:almezyn/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/appointments/single_appointment_cubit/single_appointment_state.dart';

class SingleAppointmentCubit extends Cubit<SingleAppointmentStates> {
  SingleAppointmentCubit() : super(SingleAppointmentInitialState());

  /// create object from class cubit and using this with Bloc provider
  static SingleAppointmentCubit get(context) => BlocProvider.of(context);

//  List<ToTestApisLamyaaModel> categories = [];
  Map singleAppointment = {} ;

  /// get all categories in cubit
  void getSingleAppointment() {
    emit(SingleAppointmentLoadingState());
    DioHelper.getAllData(url: '//single-Appointment/13').then((value) async {
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        singleAppointment = response ;
        print("my data is ${response}") ;
//        categories =
//            (item ).map((e) => ToTestApisLamyaaModel.fromJson(e)).toList();
//        print( "resp ${response}") ;
      }
      emit(SingleAppointmentGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SingleAppointmentGetErrorState(error: error.toString()));
    });
  }



}