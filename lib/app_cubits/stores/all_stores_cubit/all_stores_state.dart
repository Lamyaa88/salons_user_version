abstract class AllStoresStates {}

class AllStoresInitialState  extends AllStoresStates{}

class AllStoresLoadingState extends AllStoresStates{}

class AllStoresGetSuccessState extends AllStoresStates{}

class AllStoresGetErrorState extends AllStoresStates{
  final String error;
  AllStoresGetErrorState({this.error});
}