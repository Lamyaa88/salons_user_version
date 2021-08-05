import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/ads_models/all_ads_model.dart';
import 'package:almezyn/app_cubits/ads/all_ads_cubit/all_ads_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllAdsCubit extends Cubit<AllAdsStates> {
  AllAdsCubit() : super(AllAdsInitialState());
  static AllAdsCubit get(context) => BlocProvider.of(context);
  AllAdsModel allAdsModel ;
  int  statusCode = 404 ;

  void getAllAds() {
    emit(AllAdsLoadingState());
    DioHelper.getAllData(
      url: '/all-ads',
      token: token,
    ).then((value) {
      allAdsModel  = AllAdsModel.fromJson(value.data) ;
      statusCode = value.statusCode ;
      print("all ads is ${value.data}") ;

      final response = value.data;
      final item = response['data'];
      emit(AllAdsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        AllAdsGetErrorState(error: error.toString()),
      );
    });
  }
}
