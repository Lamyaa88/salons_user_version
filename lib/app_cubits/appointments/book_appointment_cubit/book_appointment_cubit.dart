import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/cart_models/add_item_to_cart_model.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_appointment_state.dart';
import 'package:almezyn/Models/appointments_models/book_appointment_model.dart';
class BookAppointmentCubit extends Cubit<BookAppointmentStates> {
  BookAppointmentCubit() : super(BookAppointmentInitialState());

  /// create object from class cubit and using this with Bloc provider
  static BookAppointmentCubit get(context) => BlocProvider.of(context);

  List<BookAppointmentModel> BookAppointment = [];
  Map BookAppointmentMap = {} ;

  void getBookAppointment() {
    emit(BookAppointmentLoadingState());
    DioHelper.postData(
      url: 'book_appointment',
      data: {"qty" :"1"},
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      BookAppointmentMap = value.data ;
      print ("BookAppointmentMap are : ${BookAppointmentMap}") ;
      BookAppointment =
          (item as List).map((e) => BookAppointmentModel.fromJson(e)).toList();
      emit(BookAppointmentGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        BookAppointmentGetErrorState(error: error.toString()),
      );
    });
  }
}
