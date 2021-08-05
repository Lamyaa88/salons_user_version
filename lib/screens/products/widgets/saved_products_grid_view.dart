import 'package:almezyn/app_cubits/products/all_products_cubit/all_products_cubit.dart';
import 'package:almezyn/app_cubits/products/all_products_cubit/all_products_state.dart';
import 'package:almezyn/app_cubits/saved/all_saved_products_cubit/all_saved_products_cubit.dart';
import 'package:almezyn/app_cubits/saved/all_saved_products_cubit/all_saved_products_state.dart';
import 'package:almezyn/screens/products/single_product_details_screen.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
savedProductsGridView({BuildContext context}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Container(
    height: height * .85,
    width: width,
    child: NetworkIndicator(
        child: BlocProvider(
      create: (BuildContext context) => AllSavedProductsCubit()..getAllSavedProducts(),
      child: ListView(
//                    physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            child: BlocConsumer<AllSavedProductsCubit, AllSavedProductsStates>(
              listener: (context, state) => {},
              builder: (context, state) {
                var cubit = AllSavedProductsCubit.get(context);

                if (state is! AllSavedProductsLoadingState) {
                  return Container(
                    color: whiteColor,
                    height:
                        isLandscape(context) ? 2 * height * .8 : height * .8,
                    width: width * .9,
                    child: Container(
                      child: cubit.allSavedProductsModel.data.length == 0
                          ? customDescriptionTextText(
                              context: context,
                              text: translator.translate("no_result"))
                          : GridView.builder(
                              itemCount: cubit.allSavedProductsModel.data.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: isLandscape(context)
                                          ? 2 * .95
                                          : .9995,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 2),
                              itemBuilder: (BuildContext context, int index) {
                                return customSingleProductCard(

                                    onTapAdd: () {
                                      _addProductToCart(itemId: cubit.allSavedProductsModel.data[index].id , context: context);

                                    },
                                    onTap: (){customAnimatedPushNavigation(context, SingleProductDetailsScreen(productId:cubit
                                        .allSavedProductsModel.data[index].id.toString())) ;},
                                    context: context,
                                    imagePath:
                                        "${baseImageUrl}${cubit.allSavedProductsModel.data[index].item.image}",
                                    englishName: cubit
                                        .allSavedProductsModel.data[index].item.nameEn,

                                    englishDescription:
                                    cubit
                                        .allSavedProductsModel.data[index].item.descriptionEn,
                                    englishPrice: cubit
                                        .allSavedProductsModel.data[index].item.descriptionEn,
                                    onTapCard: () {
                                      customAnimatedPushNavigation(context, SingleProductDetailsScreen(productId:cubit
                                          .allSavedProductsModel.data[index].id));
                                    },
                                    arabicName: cubit
                                        .allSavedProductsModel.data[index].item.nameAr,
                                    arabicDescription: cubit
                                        .allSavedProductsModel.data[index].item.descriptionAr ,
                                    arabicPrice: cubit
                                        .allSavedProductsModel.data[index].item.price);
                              }),
                    ),
                  );
                }
                return spinKit;
              },
            ),
          ),
        ],
      ),
    )),
  );
}


void _addProductToCart({BuildContext context , itemId }){
  DioHelper.postData(
    url: "/add-to-cart/${itemId}",
    data: {
      "qty" : "1"
    },
    token: token,
  ).then(
        (value) {
      print(value);
      if(value.statusCode == 200) {
        ScaffoldMessenger.of(
            context)
            .showSnackBar(
            SnackBar(
              content: Text(value.data["message"]),
            ));
      }
    },
  );
}
