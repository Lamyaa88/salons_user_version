//import 'package:almezyn/app_cubits/categories/all_categories_cubit/all_specifications_cubit.dart';
//import 'package:almezyn/app_cubits/categories/all_categories_cubit/all_specificationss_state.dart';
//import 'package:almezyn/app_cubits/offers/all_offers_cubit/all_offers_cubit.dart';
//import 'package:almezyn/app_cubits/offers/all_offers_cubit/all_offers_cubit.dart';
//import 'package:almezyn/app_cubits/offers/all_offers_cubit/all_offers_state.dart';
//import 'package:almezyn/custom_widgets/custom_place_holder.dart';
//import 'package:almezyn/utils/constants.dart';
//import 'package:almezyn/utils/file_export.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:shimmer/shimmer.dart';
//
//offersListView({BuildContext context}){
//  double height = MediaQuery.of(context).size.height;
//  double width = MediaQuery.of(context).size.width;
//  return BlocConsumer<AllOffersCubit, AllOffersStates>(
//    listener: (context, state) {},
//    builder: (context, state){
//      var cubit = AllOffersCubit.get(context);
//      if(state is! AllCategoriesLoadingState) {
//        return  Row(
//          children: [
//            Container(height: isLandscape(context) ? 2*height*.2 : height*.2,width: width,
//                child:
//                cubit.statusCode == 200 ?
//                ListView.builder(
//                    shrinkWrap: true,
//                    padding: EdgeInsets.symmetric(horizontal: 20),
//                    physics: BouncingScrollPhysics(),
//                    scrollDirection: Axis.horizontal,
//                    itemCount: cubit.allOffersModel.data.length ,
//                    itemBuilder: (context, index) {
//                      return singleCategoryCard(context: context ,imagePath:  cubit.allOffersModel.data[index].image == null
//                          ? "https://www.historicconsultants.com/wp-content/uploads/placeholder3.png"
//                          :
//                      "$baseImageUrl${cubit.allOffersModel.data[index].image}", categoryTitle:
//                      cubit.allOffersModel.data[index].nameEn, onTapCard: (){});
//                    }) :
//                ListView.builder(
//                    shrinkWrap: true,
//                    padding: EdgeInsets.symmetric(horizontal: 20),
//                    physics: BouncingScrollPhysics(),
//                    scrollDirection: Axis.horizontal,
//                    itemCount:10,
//                    itemBuilder: (context, index) {
//                      return singleCategoryNoInternetCard(context: context , onTapCard: (){});
//                    })
//            ),
//          ],
//        );
//      }
//      return
//        Row(
//          children: [
//            Container(height: isLandscape(context) ? 2*height*.2 : height*.2,width: width,
//              child: ListView.builder(
//                  shrinkWrap: true,
//                  padding: EdgeInsets.symmetric(horizontal: 20),
//                  physics: BouncingScrollPhysics(),
//                  scrollDirection: Axis.horizontal,
//                  itemCount: 10,
//                  itemBuilder: (context, index) {
//                    return Container(
//                      child: Shimmer.fromColors(
//                        highlightColor: greyColor.withOpacity(.2),
//                        baseColor: greyColor.withOpacity(.4),
//                        direction: ShimmerDirection.ltr,
//                        child: singleShimmerCard(context: context),
//                      ),
//                    ) ;
//                  }),
//            ),
//          ],
//        ) ;
//
//
//
//    },
//  );
//}
//
//singleCategoryCard({BuildContext context  , String imagePath , String categoryTitle , Function onTapCard }){
//  double height = MediaQuery.of(context).size.height;
//  double width = MediaQuery.of(context).size.width;
//  return Container(
//    margin: EdgeInsets.only(left: width * .04),
//    child: InkWell(
//      onTap: () {
//        customPushNamedNavigation(context, null);
//      },
//      child: Container(
//        color: Colors.white,
//        child: Stack(
//          children: [
//
//            Container(
//              decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image:NetworkImage(imagePath),
//                    fit: isLandscape(context) ?  BoxFit.fitHeight :  BoxFit.cover,
//                  ),
//                  borderRadius:
//                  BorderRadius.all(Radius.circular(8)),
//                  color: blueColor.withOpacity(.3)),
//              height: isLandscape(context) ? 2*height * .2 :height * .2,
//             width:width*.7,
//            ),
//
//            Container(
//              height: isLandscape(context) ? 2*height * .2 :height * .2,
//             width:width*.7,alignment: Alignment.bottomCenter,
//              child: Container(
//                child:Center(child:
//                customDescriptionTextText(context: context , textColor: whiteColor , fontWeight: FontWeight.bold
//                    , text: categoryTitle , percentageOfHeight: .025 , maxLines: 1)),
//                decoration: BoxDecoration(
//                    borderRadius:
//                    BorderRadius.only(bottomRight: Radius.circular(8) , bottomLeft: Radius.circular(8)),
//                    color: blueColor.withOpacity(.3)),
//                height: isLandscape(context) ? 2*height * .06 :height * .06,
//               width:width*.7,
//              ),
//            ),
//
//          ],
//        ),
//      ),
//    ),
//  );
//}
//singleCategoryNoInternetCard({BuildContext context  , String imagePath , String categoryTitle , Function onTapCard }){
//  double height = MediaQuery.of(context).size.height;
//  double width = MediaQuery.of(context).size.width;
//  return Container(
//    margin: EdgeInsets.only(left: width * .04),
//    child: InkWell(
//      onTap: () {
//        customPushNamedNavigation(context, null);
//      },
//      child: Container(
//        color: Colors.white,
//        child: Stack(
//          children: [
//
//            Container(
//              decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image:AssetImage(AppImages.place_holder),
//                    fit: isLandscape(context) ?  BoxFit.fitHeight :  BoxFit.cover,
//                  ),
//                  borderRadius:
//                  BorderRadius.all(Radius.circular(8)),
//                  color: blueColor.withOpacity(.3)),
//              height: isLandscape(context) ? 2*height * .2 :height * .2,
//              width: width * .7,
//            ),
//
//
//          ],
//        ),
//      ),
//    ),
//  );
//}
//singleShimmerCard({BuildContext context  , String imagePath , String categoryTitle , Function onTapCard }){
//  double height = MediaQuery.of(context).size.height;
//  double width = MediaQuery.of(context).size.width;
//  return Container(
//    margin: EdgeInsets.only(left: width * .04),
//    child: Container(decoration: BoxDecoration(color: whiteColor,
//        borderRadius: BorderRadius.circular(8)),
//      child: Stack(
//        children: [
//
//          Container(
//            decoration: BoxDecoration(
//                borderRadius:
//                BorderRadius.all(Radius.circular(8)),
//                color: blueColor.withOpacity(.3)),
//            height: isLandscape(context) ? 2*height * .2 :height * .2,
//           width:width*.7,
//          ),
//
//        ],
//      ),
//    ),);
//}