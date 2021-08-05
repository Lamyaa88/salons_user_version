abstract class AllPastAppointmentsStates {}

class AllPastAppointmentsInitialState  extends AllPastAppointmentsStates{}

class AllPastAppointmentsLoadingState extends AllPastAppointmentsStates{}

class AllPastAppointmentsGetSuccessState extends AllPastAppointmentsStates{}

class AllPastAppointmentsGetErrorState extends AllPastAppointmentsStates{
  final String error;
  AllPastAppointmentsGetErrorState({this.error});
}