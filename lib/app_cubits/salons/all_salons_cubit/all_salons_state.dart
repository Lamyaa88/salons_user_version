abstract class AllSalonsStates {}

class AllSalonsInitialState  extends AllSalonsStates{}

class AllSalonsLoadingState extends AllSalonsStates{}

class AllSalonsGetSuccessState extends AllSalonsStates{}

class AllSalonsGetErrorState extends AllSalonsStates{
  final String error;
  AllSalonsGetErrorState({this.error});
}