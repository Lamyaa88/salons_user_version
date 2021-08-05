abstract class AllUpcomingAppointmentsStates {}

class AllUpcomingAppointmentsInitialState  extends AllUpcomingAppointmentsStates{}

class AllUpcomingAppointmentsLoadingState extends AllUpcomingAppointmentsStates{}

class AllUpcomingAppointmentsGetSuccessState extends AllUpcomingAppointmentsStates{}

class AllUpcomingAppointmentsGetErrorState extends AllUpcomingAppointmentsStates{
  final String error;
  AllUpcomingAppointmentsGetErrorState({this.error});
}