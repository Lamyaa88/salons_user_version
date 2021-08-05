//import 'package:almezyn/screens/auth/Login/cubit/state_login.dart';
//import 'package:almezyn/Models/user_modales.dart';
//import 'package:almezyn/network/cache_helper.dart';
//import 'package:almezyn/network/dio_helper.dart';
//import 'package:almezyn/network/end_point.dart';
//import 'package:almezyn/screens/auth/Register/cubit/state_login.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//
//class CubitRegister extends Cubit<MezaynRegisterState> {
//  CubitRegister() : super(MezaynRegisterInitialState());
//
//  static CubitRegister get(context) => BlocProvider.of(context);
//  UsersModals  usersModals;
//
//  void phoneRegister({ @required name , @required email, @required phone, @required password}){
//    emit(MezaynRegisterLoadingState());
//    DioHelper.postDataForAuth(
//      url: "/register",
//      data: {
//        "name": name,
//        "email": email,
//        "phone": phone,
//        "password": password,
//      },
//    ).then((value) {
//        // final response =  value.data;
//        // CacheHelper.putStringData(key: 'token', value: response['access_token']);
//      usersModals = UsersModals.fromJson(value.data);
//      print(value.data);
//      CacheHelper.putStringData(key: "token", value:value.data["access_token"]);
////      print("access tokennnnnnnnnnnnnnnnnnnnnnnnnnnnnnn  is ${value.data["access_token"]}");
////      print(value.data["user"]["name"]);
//      CacheHelper.putStringData(key: "user_name", value:value.data["user"]["name"]);
//      CacheHelper.putStringData(key: "user_photo", value:value.data["user"]["avatar"]);
//
//      print(usersModals.accessToken);
//      emit(MezaynRegisterSuccessState(usersModals: usersModals));
//    }).catchError((error) {
//      print('this is error $error');
//      emit(MezaynRegisterErrorState(
//          error:  error.toString()));
//    });
//  }
//}
