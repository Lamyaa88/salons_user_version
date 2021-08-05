abstract class SingleAdStates {}

class SingleAdInitialState  extends SingleAdStates{}

class SingleAdLoadingState extends SingleAdStates{}

class SingleAdGetSuccessState extends SingleAdStates{}

class SingleAdGetErrorState extends SingleAdStates{
  final String error;
  SingleAdGetErrorState({this.error});
}