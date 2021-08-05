import 'package:almezyn/Models/user_modales.dart';

abstract class MezaynLoginState {}

class MezaynLoginInitialState extends MezaynLoginState {}

class MezaynLoginLoadingState extends MezaynLoginState {}

class MezaynLoginSuccessState extends MezaynLoginState {
  final UsersModals usersModals;
  MezaynLoginSuccessState({this.usersModals});
}

class MezaynLoginErrorState extends MezaynLoginState {
  final String error;
  MezaynLoginErrorState({this.error});
}
