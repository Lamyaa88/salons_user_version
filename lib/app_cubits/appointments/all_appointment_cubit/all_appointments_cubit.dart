import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/appointments_models/all_appointments_model.dart';
import 'package:almezyn/Models/appointments_models/user_appointment_models.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_appointments_state.dart';

class AllAppointmentsCubit extends Cubit<AllAppointmentsStates> {
  AllAppointmentsCubit() : super(AllAppointmentsInitialState());

  /// create object from class cubit and using this with Bloc provider
  static AllAppointmentsCubit get(context) => BlocProvider.of(context);

 AllUserAppointmentsModel allUserAppointmentsModel ;
  void getAllAppointments() {
    emit(AllAppointmentsLoadingState());
    DioHelper.getAllData(url: '/user-appointments' , token: token ).then((value) async {
      print(value.data);
      allUserAppointmentsModel = AllUserAppointmentsModel.fromJson(value.data);
      emit(AllAppointmentsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(AllAppointmentsGetErrorState(error: error.toString()));
    });
  }
}
