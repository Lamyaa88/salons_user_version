import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/appointments_models/all_appointments_model.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_past_appointments_state.dart';
import 'package:almezyn/Models/appointments_models/all_past_appointments_model.dart';

class AllPastAppointmentsCubit extends Cubit<AllPastAppointmentsStates> {
  AllPastAppointmentsCubit() : super(AllPastAppointmentsInitialState());

  /// create object from class cubit and using this with Bloc provider
  static AllPastAppointmentsCubit get(context) => BlocProvider.of(context);

  List<AllPastAppointmentsModel> AllPastAppointments = [];
  Map AllPastAppointmentsMap = {} ;

  /// get all categories in cubit
  void getAllPastAppointments() {
    emit(AllPastAppointmentsLoadingState());
    DioHelper.getAllData(url: '//user-appointments' , token: token ).then((value) async {
      AllPastAppointmentsMap = value.data ;
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        AllPastAppointments =
            (item as List).map((e) => AllPastAppointmentsModel.fromJson(e)).toList();
        print("all appointments are ${AllPastAppointments}");
      }
      emit(AllPastAppointmentsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(AllPastAppointmentsGetErrorState(error: error.toString()));
    });
  }
}
