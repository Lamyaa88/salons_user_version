abstract class AllFaqsStates {}

class AllFaqsInitialState  extends AllFaqsStates{}

class AllFaqsLoadingState extends AllFaqsStates{}

class AllFaqsGetSuccessState extends AllFaqsStates{}

class AllFaqsGetErrorState extends AllFaqsStates{
  final String error;
  AllFaqsGetErrorState({this.error});
}