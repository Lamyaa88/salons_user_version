abstract class AllSpecificationsStates {}

class AllSpecificationsInitialState  extends AllSpecificationsStates{}

class AllSpecificationsLoadingState extends AllSpecificationsStates{}

class AllSpecificationsGetSuccessState extends AllSpecificationsStates{}

class AllSpecificationsGetErrorState extends AllSpecificationsStates{
  final String error;
  AllSpecificationsGetErrorState({this.error});
}