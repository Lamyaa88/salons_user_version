import 'package:almezyn/app_cubits/ads/single_ad_cubit/single_ad_state.dart';
import 'package:almezyn/app_cubits/offers/single_offer_cubit/single_offer_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleAdCubit extends Cubit<SingleAdStates> {
  SingleAdCubit() : super(SingleAdInitialState());

  /// create object from class cubit and using this with Bloc provider
  static SingleAdCubit get(context) => BlocProvider.of(context);

//  List<ToTestApisLamyaaModel> categories = [];
  Map singleAd = {} ;

  /// get all categories in cubit
  void getSingleAd() {
    emit(SingleAdLoadingState());
    DioHelper.getAllData(url: '//single-ad/1').then((value) async {
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        singleAd = response ;
        print("my data is ${response}") ;
//        categories =
//            (item ).map((e) => ToTestApisLamyaaModel.fromJson(e)).toList();
//        print( "resp ${response}") ;
      }
      emit(SingleAdGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SingleAdGetErrorState(error: error.toString()));
    });
  }



}