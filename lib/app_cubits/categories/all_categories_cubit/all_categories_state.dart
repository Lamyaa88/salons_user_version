abstract class AllCategoriesStates {}

class AllCategoriesInitialState  extends AllCategoriesStates{}

class AllCategoriesLoadingState extends AllCategoriesStates{}

class AllCategoriesGetSuccessState extends AllCategoriesStates{}

class AllCategoriesGetErrorState extends AllCategoriesStates{
  final String error;
  AllCategoriesGetErrorState({this.error});
}