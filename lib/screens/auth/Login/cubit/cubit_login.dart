import 'package:almezyn/screens/auth/Login/cubit/state_login.dart';
import 'package:almezyn/Models/user_modales.dart';
import 'package:almezyn/network/cache_helper.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitLogin extends Cubit<MezaynLoginState> {
  CubitLogin() : super(MezaynLoginInitialState());

  static CubitLogin get(context) => BlocProvider.of(context);
  UsersModals  usersModals;

  void phoneLogin({@required phone, @required password}){
    emit(MezaynLoginLoadingState());
    DioHelper.postDataForAuth(
      url: SEND_OTP,
      data: {
        "phone": phone,
        "password": password,
      },
    ).then((value) async {
        // final response =  value.data;
        // CacheHelper.putStringData(key: 'token', value: response['access_token']);
      usersModals = UsersModals.fromJson(value.data);
      print(value.data);
      CacheHelper.putStringData(key: "token", value:value.data["access_token"]);
      print("access tokennnnnnnnnnnnnnnnnnnnnnnnnnnnnnn  is ${value.data["access_token"]}");
      await CacheHelper.init();
      token  = CacheHelper.getStringData(key: 'token');
//      print(value.data["user"]["name"]);
      CacheHelper.putStringData(key: "user_name", value:value.data["user"]["name"]);
      CacheHelper.putStringData(key: "user_photo", value:value.data["user"]["avatar"]);
      print(usersModals.accessToken);
      emit(MezaynLoginSuccessState(usersModals: usersModals));
    }).catchError((error) {
      print('this is error $error');
      emit(MezaynLoginErrorState(
          error:  error.toString()));
    });
  }
}
