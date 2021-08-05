import 'package:almezyn/Models/user_modales.dart';

abstract class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}

class RegisterLoadingStates extends RegisterStates {}

class RegisterSuccessStates extends RegisterStates {
  final UsersRegister usersModals;
  RegisterSuccessStates({this.usersModals});
}

class RegisterErrorStates extends RegisterStates {
  final String error;
  RegisterErrorStates({this.error});
}
