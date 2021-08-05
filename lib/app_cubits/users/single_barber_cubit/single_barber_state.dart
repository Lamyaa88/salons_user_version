abstract class SingleBarberStates {}

class SingleBarberInitialState  extends SingleBarberStates{}

class SingleBarberLoadingState extends SingleBarberStates{}

class SingleBarberGetSuccessState extends SingleBarberStates{}

class SingleBarberGetErrorState extends SingleBarberStates{
  final String error;
  SingleBarberGetErrorState({this.error});
}