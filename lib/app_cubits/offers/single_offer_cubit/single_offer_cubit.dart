
import 'package:almezyn/app_cubits/offers/single_offer_cubit/single_offer_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleOfferCubit extends Cubit<SingleOfferStates> {
  SingleOfferCubit() : super(SingleOfferInitialState());

  /// create object from class cubit and using this with Bloc provider
  static SingleOfferCubit get(context) => BlocProvider.of(context);
 SingleOfferModel singleOfferModel ;

  /// get all categories in cubit
  void getSingleOffer(String singleOfferId ) {
    emit(SingleOfferLoadingState());
    DioHelper.getAllData(url: '/single-offer/${singleOfferId}' , token: token).then((value) async {
        final response = await value.data;
        final item = response['data'];
        singleOfferModel = SingleOfferModel.fromJson(value.data);

        print("single offer is  ${response}") ;

      emit(SingleOfferGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SingleOfferGetErrorState(error: error.toString()));
    });
  }



}

class SingleOfferModel {
  Data data;

  SingleOfferModel({this.data});

  SingleOfferModel.fromJson(Map<String, dynamic> json) {
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
  String code;
  String value;
  String startDate;
  String endDate;
  String image;

  Data(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.code,
        this.value,
        this.startDate,
        this.endDate,
        this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    code = json['code'];
    value = json['value'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['code'] = this.code;
    data['value'] = this.value;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['image'] = this.image;
    return data;
  }
}
