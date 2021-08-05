abstract class AllAppointmentsStates {}

class AllAppointmentsInitialState  extends AllAppointmentsStates{}

class AllAppointmentsLoadingState extends AllAppointmentsStates{}

class AllAppointmentsGetSuccessState extends AllAppointmentsStates{}

class AllAppointmentsGetErrorState extends AllAppointmentsStates{
  final String error;
  AllAppointmentsGetErrorState({this.error});
}