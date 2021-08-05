import 'package:almezyn/app_cubits/products/all_products_cubit/all_products_cubit.dart';
import 'package:almezyn/app_cubits/products/all_products_cubit/all_products_state.dart';
import 'package:almezyn/screens/products/single_product_details_screen.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
allProductsGridView({BuildContext context}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Container(
    height: height * .85,
    width: width,
    child: NetworkIndicator(
        child: BlocProvider(
      create: (BuildContext context) => AllProductsCubit()..getAllProducts(),
      child: ListView(
//                    physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            child: BlocConsumer<AllProductsCubit, AllProductsStates>(
              listener: (context, state) => {},
              builder: (context, state) {
                var cubit = AllProductsCubit.get(context);

                if (state is! AllProductsLoadingState) {
                  return Container(
                    color: whiteColor,
                    height:
                        isLandscape(context) ? 2 * height * .8 : height * .8,
                    width: width * .9,
                    child: Container(
                      child: cubit.allProductsModel.data.length == 0
                          ? customDescriptionTextText(
                              context: context,
                              text: translator.translate("no_result"))
                          : GridView.builder(
                              itemCount: cubit.allProductsModel.data.length,
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
                                      _addProductToCart(itemId: cubit.allProductsModel.data[index].id , context: context);

                                    },
                                    onTap: (){customAnimatedPushNavigation(context, SingleProductDetailsScreen(productId:cubit
                                        .allProductsModel.data[index].id.toString())) ;},
                                    context: context,
                                    imagePath:
                                        "${baseImageUrl}${cubit.allProductsModel.data[index].image}",
                                    englishName: cubit
                                        .allProductsModel.data[index].nameEn,
                                    englishDescription:
                                        "Hair care product product ",
                                    englishPrice: cubit
                                        .allProductsModel.data[index].price,
                                    onTapCard: () {
                                      customAnimatedPushNavigation(context, SingleProductDetailsScreen(productId:cubit
                                          .allProductsModel.data[index].id));
                                    },
                                    arabicName: "منتج عناية بالشعر",
                                    arabicDescription: "منتج عناية بالشعر",
                                    arabicPrice: cubit
                                        .allProductsModel.data[index].price);
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
