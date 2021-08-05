import 'package:almezyn/Models/products_model/single_product_model.dart';
import 'package:almezyn/app_cubits/products/single_product_cubit/single_product_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleProductCubit extends Cubit<SingleProductStates> {
  SingleProductCubit() : super(SingleProductInitialState());

  /// create object from class cubit and using this with Bloc provider
  static SingleProductCubit get(context) => BlocProvider.of(context);

//  List<ToTestApisLamyaaModel> categories = [];
  Map singleProduct = {} ;
  String singleProductId  ;
  SingleProductModel singleProductModel ;

  /// get all categories in cubit
  void getSingleProduct({String id }) {
    emit(SingleProductLoadingState());
    DioHelper.getAllData(url: '/single-product/${id}' ,token:  token).then((value) async {
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        singleProduct = response ;
        print("my data is ${response}") ;
        singleProductModel = SingleProductModel.fromJson(value.data) ;

        print("status code for single product  : ${value.statusCode}");
        print("response in  single product   : ${response}");
        print("single product model is  :  ${singleProduct}");
//        categories =
//            (item ).map((e) => ToTestApisLamyaaModel.fromJson(e)).toList();
//        print( "resp ${response}") ;
      }
      emit(SingleProductGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SingleProductGetErrorState(error: error.toString()));
    });
  }



}