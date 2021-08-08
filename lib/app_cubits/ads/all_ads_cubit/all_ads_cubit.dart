import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/offers_models/all_offers_model.dart';
import 'package:almezyn/app_cubits/offers/all_offers_cubit/all_offers_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/Models/offers_models/all_offers_model.dart';

class AllOffersCubit2 extends Cubit<AllOffersStates> {
  AllOffersCubit2() : super(AllOffersInitialState());
  static AllOffersCubit2 get(context) => BlocProvider.of(context);
  AllOffersModel allOffersModel ;
  Map AllOffersMap = {};
  int statusCode ;
  void getAllOffers2() {
    emit(AllOffersLoadingState());
    DioHelper.getAllData(url: '/all-ads' , token: token ).then((value) async {
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        AllOffersMap = value.data ;
        statusCode = value.statusCode ;
        allOffersModel  = AllOffersModel.fromJson(value.data);

        print("all products  model is  :  ${AllOffersModel}");
      }
      emit(AllOffersGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(AllOffersGetErrorState(error: error.toString()));
    });
  }
}
