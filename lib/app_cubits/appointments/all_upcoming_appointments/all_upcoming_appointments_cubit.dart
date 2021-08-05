import 'package:bloc/bloc.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_upcoming_appointments_state.dart';
import 'package:almezyn/Models/appointments_models/all_upcoming_appointments_model.dart';

class AllUpcomingAppointmentsCubit extends Cubit<AllUpcomingAppointmentsStates> {
  AllUpcomingAppointmentsCubit() : super(AllUpcomingAppointmentsInitialState());

  /// create object from class cubit and using this with Bloc provider
  static AllUpcomingAppointmentsCubit get(context) => BlocProvider.of(context);

  List<AllUpcomingAppointmentsModel> AllUpcomingAppointments = [];
  Map AllUpcomingAppointmentsMap = {} ;

  /// get all categories in cubit
  void getAllUpcomingAppointments() {
    emit(AllUpcomingAppointmentsLoadingState());
    DioHelper.getAllData(url: '//upcoming-appointments' , token: token ).then((value) async {
      AllUpcomingAppointmentsMap = value.data ;
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        AllUpcomingAppointments =
            (item as List).map((e) => AllUpcomingAppointmentsModel.fromJson(e)).toList();
        print("all appointments are ${AllUpcomingAppointments}");
      }
      emit(AllUpcomingAppointmentsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(AllUpcomingAppointmentsGetErrorState(error: error.toString()));
    });
  }
}
