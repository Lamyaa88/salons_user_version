//import 'package:doctoworld_user/app_cubits/offers/single_offer_cubit/single_offer_state.dart';
//import 'package:doctoworld_user/network/dio_helper.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//
//class SingleOfferCubit extends Cubit<SingleOfferStates> {
//  SingleOfferCubit() : super(SingleOfferInitialState());
//
//  /// create object from class cubit and using this with Bloc provider
//  static SingleOfferCubit get(context) => BlocProvider.of(context);
//
////  List<ToTestApisLamyaaModel> categories = [];
//  Map mydate = {} ;
//
//  /// get all categories in cubit
//  void getSingleOffer() {
//    emit(SingleOfferLoadingState());
//    DioHelper.getAllData(url: '/single-offer/1').then((value) async {
//      if (value.statusCode == 200) {
//        final response = await value.data;
//        final item = response['data'];
//        mydate = response ;
//        print("my data is ${response}") ;
////        categories =
////            (item ).map((e) => ToTestApisLamyaaModel.fromJson(e)).toList();
////        print( "resp ${response}") ;
//      }
//      emit(SingleOfferGetSuccessState());
//    }).catchError((error) {
//      print(error);
//      emit(SingleOfferGetErrorState(error: error.toString()));
//    });
//  }
//
//
//
//}