abstract class AllUsersStates {}

class AllUsersInitialState  extends AllUsersStates{}

class AllUsersLoadingState extends AllUsersStates{}

class AllUsersGetSuccessState extends AllUsersStates{}

class AllUsersGetErrorState extends AllUsersStates{
  final String error;
  AllUsersGetErrorState({this.error});
}