abstract class AllHomeCategoriesStates {}

class AllHomeCategoriesInitialState  extends AllHomeCategoriesStates{}

class AllHomeCategoriesLoadingState extends AllHomeCategoriesStates{}

class AllHomeCategoriesGetSuccessState extends AllHomeCategoriesStates{}

class AllHomeCategoriesGetErrorState extends AllHomeCategoriesStates{
  final String error;
  AllHomeCategoriesGetErrorState({this.error});
}