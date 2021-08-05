import 'package:almezyn/app_cubits/products/search_products_cubit/search_products_cubit.dart';
import 'package:almezyn/app_cubits/products/search_products_cubit/search_products_state.dart';
import 'package:almezyn/custom_widgets/custom_saved_product_card.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

searchPart({BuildContext context , searchWord }){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return  Container(
    height: height * .85,
    width: width,
    child: NetworkIndicator(
        child: BlocProvider(
          create: (BuildContext context) =>
          SearchProdustsCubit()..getSearchProdusts(searchWord),
          child: ListView(
//                    physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                child:
                BlocConsumer<SearchProdustsCubit, SearchProductsStates>(
                  listener: (context, state) => {},
                  builder: (context, state) {
                    var cubit = SearchProdustsCubit.get(context);

                    if (state is! SearchProductsLoadingState) {
                      return                   Container(
                        color: whiteColor,
                        height:
                        isLandscape(context) ? 2 * height * .8 : height * .8,
                        width: width * .9,
                        child: Container(
                          child:
                          cubit.searchProdustsModel.data.length == 0 ?customDescriptionTextText(context: context
                              , text: translator.translate("no_result")):
                          GridView.builder(
                              itemCount: cubit.searchProdustsModel.data.length,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                  isLandscape(context) ? 2 * .95 : .9995,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 2),
                              itemBuilder: (BuildContext context, int index) {

                                return customSavedProductCard(context: context ,imagePath: "${baseImageUrl}${cubit.searchProdustsModel.data[index].image}",
                                    englishName:cubit.searchProdustsModel.data[index].nameEn, englishDescription: "Hair care product product "
                                    , englishPrice: cubit.searchProdustsModel.data[index].price , onTapCard: (){} ,
                                    arabicName: "منتج عناية بالشعر" , arabicDescription: "منتج عناية بالشعر" , arabicPrice: cubit.searchProdustsModel.data[index].price);
                              }),
                        ),
                      );

                    }
                    return CircularProgressIndicator();

                  },
                ),
              ),
            ],
          ),
        )),
  );
}