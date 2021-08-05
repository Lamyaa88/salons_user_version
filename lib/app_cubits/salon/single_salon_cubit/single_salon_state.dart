abstract class SingleSalonStates {}

class SingleSalonInitialState  extends SingleSalonStates{}

class SingleSalonLoadingState extends SingleSalonStates{}

class SingleSalonGetSuccessState extends SingleSalonStates{}

class SingleSalonGetErrorState extends SingleSalonStates{
  final String error;
  SingleSalonGetErrorState({this.error});
}