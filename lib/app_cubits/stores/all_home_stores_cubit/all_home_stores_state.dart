abstract class AllHomeStoresStates {}

class AllHomeStoresInitialState  extends AllHomeStoresStates{}

class AllHomeStoresLoadingState extends AllHomeStoresStates{}

class AllHomeStoresGetSuccessState extends AllHomeStoresStates{}

class AllHomeStoresGetErrorState extends AllHomeStoresStates{
  final String error;
  AllHomeStoresGetErrorState({this.error});
}