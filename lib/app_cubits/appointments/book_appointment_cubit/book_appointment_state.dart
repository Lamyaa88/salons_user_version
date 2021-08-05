abstract class BookAppointmentStates {}

class BookAppointmentInitialState  extends BookAppointmentStates{}

class BookAppointmentLoadingState extends BookAppointmentStates{}

class BookAppointmentGetSuccessState extends BookAppointmentStates{}

class BookAppointmentGetErrorState extends BookAppointmentStates{
  final String error;
  BookAppointmentGetErrorState({this.error});
}