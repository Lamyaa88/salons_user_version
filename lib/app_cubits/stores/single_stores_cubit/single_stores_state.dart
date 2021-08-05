abstract class SingleStoreStates {}

class SingleStoreInitialState  extends SingleStoreStates{}

class SingleStoreLoadingState extends SingleStoreStates{}

class SingleStoreGetSuccessState extends SingleStoreStates{}

class SingleStoreGetErrorState extends SingleStoreStates{
  final String error;
  SingleStoreGetErrorState({this.error});
}