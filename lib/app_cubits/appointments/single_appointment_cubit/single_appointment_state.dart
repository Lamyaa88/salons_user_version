abstract class SingleAppointmentStates {}

class SingleAppointmentInitialState  extends SingleAppointmentStates{}

class SingleAppointmentLoadingState extends SingleAppointmentStates{}

class SingleAppointmentGetSuccessState extends SingleAppointmentStates{}

class SingleAppointmentGetErrorState extends SingleAppointmentStates{
  final String error;
  SingleAppointmentGetErrorState({this.error});
}