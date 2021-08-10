
import 'package:almezyn/app_cubits/offers/all_offers_cubit/all_offers_cubit.dart';
import 'package:almezyn/app_cubits/offers/all_offers_cubit/all_offers_cubit.dart';
import 'package:almezyn/app_cubits/offers/all_offers_cubit/all_offers_cubit.dart';
import 'package:almezyn/app_cubits/offers/all_offers_cubit/all_offers_state.dart';
import 'package:almezyn/app_cubits/specifications/all_categories_cubit/all_specifications_cubit.dart';
import 'package:almezyn/app_cubits/specifications/all_categories_cubit/all_specificationss_state.dart';
import 'package:almezyn/screens/products/single_offer_details.dart';
import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class AllOffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            responsiveSizedBox(context: context , percentageOfHeight: .03),
            Container(height: height*.1,
              child: Row(children: [
                SizedBox(width: width*.05,) ,
                GestureDetector(onTap: (){Navigator.of(context).pop();},
                  child: Icon(Icons.arrow_back , color: blackColor,size: height*.05,),),
                SizedBox(width: width*.05,) ,
                customDescriptionTextText(context: context , text: "All Offers" ,
                    fontWeight: FontWeight.bold , percentageOfHeight: .025, textColor: blackColor)
              ],),),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * .85,
                  width: width*.9,
                  child: NetworkIndicator(
                      child: BlocProvider(
                        create: (BuildContext context) => AllOffersCubit()..getAllOffers(),
                        child: ListView(
//                    physics: BouncingScrollPhysics(),
                          children: <Widget>[
                            Container(
                              child: BlocConsumer<AllOffersCubit, AllOffersStates>(
                                listener: (context, state) => {},
                                builder: (context, state) {
                                  var cubit = AllOffersCubit.get(context);

                                  if (state is! AllOffersLoadingState) {
                                    return Container(
                                      color: whiteColor,
                                      height:
                                      isLandscape(context) ? 2 * height * .8 : height * .8,
                                      width: width * .9,
                                      child: Container(
                                        child: cubit.allOffersModel.data.length == 0
                                            ? customDescriptionTextText(
                                            context: context,
                                            text: translator.translate("no_result"))
                                            : GridView.builder(
                                            itemCount: cubit.allOffersModel.data.length,
                                            gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: isLandscape(context)
                                                    ? 2 * .95
                                                    : 1.2 ,
                                                mainAxisSpacing: 15,
                                                crossAxisSpacing: 12),
                                            itemBuilder: (BuildContext context, int index) {
                                              return GestureDetector(
                                                onTap: (){
                                                 customAnimatedPushNavigation(context,
                                                     SingleOfferDetailsScreen(offerId: cubit.allOffersModel.data[index].id.toString(),));
                                                },
                                                child: Container(
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              image: NetworkImage("${baseImageUrl}${cubit.allOffersModel.data[index].image}"),
                                                              fit: BoxFit.cover,
                                                            ),
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(8)),
                                                            color: backGroundColor),
                                                        height: isLandscape(context)
                                                            ? 2 * height * .2
                                                            : height * .2,
                                                        width: width * .4,
                                                      ),
                                                      Container(
                                                        height: isLandscape(context)
                                                            ? 2 * height * .2
                                                            : height * .2,
                                                        width: width * .4,
                                                        alignment: Alignment.bottomCenter,
                                                        child: Container(
                                                          child: Center(
                                                              child: customDescriptionTextText(
                                                                  context: context,
                                                                  textColor: whiteColor,
                                                                  fontWeight: FontWeight.bold,
                                                                  text: checkDirection(
                                                                      cubit.allOffersModel.data[index].nameAr,
                                                                      cubit.allOffersModel.data[index].nameEn),
                                                                  percentageOfHeight: .02,
                                                                  maxLines: 1)),
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  bottomRight: Radius.circular(8),
                                                                  bottomLeft: Radius.circular(8)),
                                                              color: blueColor.withOpacity(.3)),
                                                          height: isLandscape(context)
                                                              ? 2 * height * .06
                                                              : height * .06,
                                                          width: width * .4,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    );
                                  }
                                  return Container(height: height*.8,
                                    child: Center(child:
                                    spinKit,),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
