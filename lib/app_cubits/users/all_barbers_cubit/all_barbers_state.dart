abstract class AllBarbersStates {}

class AllBarbersInitialState  extends AllBarbersStates{}

class AllBarbersLoadingState extends AllBarbersStates{}

class AllBarbersGetSuccessState extends AllBarbersStates{}

class AllBarbersGetErrorState extends AllBarbersStates{
  final String error;
  AllBarbersGetErrorState({this.error});
}