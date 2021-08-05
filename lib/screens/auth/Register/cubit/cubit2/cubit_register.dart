import 'package:almezyn/screens/auth/Register/cubit/cubit2/register_states.dart';
import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/user_modales.dart';
import 'package:almezyn/network/cache_helper.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());
  static RegisterCubit get(context) => BlocProvider.of(context);
  UsersRegister usersModals1;

  void registration({
    @required name,
    @required email,
    @required phone,
    @required password,
  }) {
    emit(RegisterLoadingStates());
    DioHelper.postDataForRegister(
      url: registrations,
      data: {

        'name': name,
        'email': email,
        'phone': phone,
        'password': password},
    ).then((value) {
      // usersModals1 = UsersRegister.fromJson(value.data);
      usersModals1 = UsersRegister.fromJson(value.data);
      print(value.data["user"]["name"]);
      print("resaponse is ${value.data}");
      CacheHelper.putStringData(key: "user_name", value:value.data["user"]["name"]);
      CacheHelper.putStringData(key: "user_photo", value:value.data["user"]["avatar"]);
      emit(RegisterSuccessStates(usersModals: usersModals1));
    }).catchError((error) {
      print('this is errors $error');
      emit(
        RegisterErrorStates(
          error: error.toString(),
        ),
      );
    });
  }
}
