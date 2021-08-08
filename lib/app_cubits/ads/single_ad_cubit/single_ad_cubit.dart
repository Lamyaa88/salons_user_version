
import 'package:almezyn/app_cubits/offers/single_offer_cubit/single_offer_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleOfferCubit2 extends Cubit<SingleOfferStates> {
  SingleOfferCubit2() : super(SingleOfferInitialState());

  /// create object from class cubit and using this with Bloc provider
  static SingleOfferCubit2 get(context) => BlocProvider.of(context);
  SingleOfferModel2 singleOfferModel ;

  /// get all categories in cubit
  void getSingleOffer2(String singleOfferId ) {
    emit(SingleOfferLoadingState());
    DioHelper.getAllData(url: '/single-ad/${singleOfferId}' , token: token).then((value) async {
      final response = await value.data;
      final item = response['data'];
      singleOfferModel = SingleOfferModel2.fromJson(value.data);

      print("single offer is  ${response}") ;

      emit(SingleOfferGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SingleOfferGetErrorState(error: error.toString()));
    });
  }



}

class SingleOfferModel2 {
  Data data;

  SingleOfferModel2({this.data});

  SingleOfferModel2.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String nameEn;
  String nameAr;
  String link;
  String startDate;
  String endDate;
  String image;

  Data(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.link,
        this.startDate,
        this.endDate,
        this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    link = json['link'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['link'] = this.link;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['image'] = this.image;
    return data;
  }
}
