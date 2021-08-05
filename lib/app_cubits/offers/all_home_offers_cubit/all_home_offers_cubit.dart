import 'package:bloc/bloc.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/offers/all_home_offers_cubit/all_home_offers_state.dart';
import 'package:almezyn/Models/offers_models/all_home_offers_model.dart';
class AllHomeOffersCubit extends Cubit<AllHomeOffersStates> {
  AllHomeOffersCubit() : super(AllHomeOffersInitialState());

  /// create object from class cubit and using this with Bloc provider
  static AllHomeOffersCubit get(context) => BlocProvider.of(context);

  List<AllHomeOffersModel> AllHomeOffers = [];

  void getAllHomeOffers() {
    emit(AllHomeOffersLoadingState());
    DioHelper.getAllData(
      url: '/AllHome-Offers',
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      AllHomeOffers =
          (item as List).map((e) => AllHomeOffersModel.fromJson(e)).toList();
      emit(AllHomeOffersGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        AllHomeOffersGetErrorState(error: error.toString()),
      );
    });
  }
}
