import 'package:almezyn/app_cubits/ads/all_ads_cubit/all_ads_cubit.dart';
import 'package:almezyn/app_cubits/categories/all_categories_cubit/all_categories_cubit.dart';
import 'package:almezyn/app_cubits/offers/all_offers_cubit/all_offers_cubit.dart';
import 'package:almezyn/network/cache_helper.dart';
import 'package:almezyn/screens/products/widgets/categories_list_view.dart';
import 'package:almezyn/screens/products/widgets/searchPart.dart';
import 'package:almezyn/screens/products/widgets/user_name_and_image_top_part.dart';
import 'package:almezyn/screens/salons/widgets/offers_list_view.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:almezyn/screens/products/all_products_screen.dart';
class ProductsHomeScreen extends StatefulWidget {
  @override
  _ProductsHomeScreenState createState() => _ProductsHomeScreenState();
}
class _ProductsHomeScreenState extends State<ProductsHomeScreen> {
  String userName = "";
  String userImage = "";
  String searchInputs = "";
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      userName = CacheHelper.getStringData(key: "user_name");
      userImage = CacheHelper.getStringData(key: "user_image");
    });
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: NetworkIndicator(
        child: CustomBuildBody(
          onTapBackIcon: () {
            Navigator.pop(context);
          },
          paddingPercentageForBody: 0.0,
          columnOfWidgets: Column(
            children: [
              Container(
                height: height,
                child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          leading: null,
                          expandedHeight: isLandscape(context)
                              ? 2 * height * .15
                              : height * .15,
                          floating: false,
                          backgroundColor: whiteColor,
                          elevation: 0,
                          pinned: false,
                          foregroundColor: Colors.white,
                          flexibleSpace: FlexibleSpaceBar(
                              background: userNameAndImageTopPart(
                                  context: context,
                                  username: userName,
                                  imagePath: userImage)),
                        ),
                      ];
                    },
                    body: Container(
                      child: MultiBlocProvider(
                        providers: [
                          BlocProvider<AllOffersCubit>(
                            create: (BuildContext context) =>
                                AllOffersCubit()..getAllOffers(),
                          ),
                          BlocProvider<AllCategoriesCubit>(
                            create: (BuildContext context) =>
                                AllCategoriesCubit()..getAllCategories(),
                          ),
                          BlocProvider<AllAdsCubit>(
                            create: (BuildContext context) =>
                                AllAdsCubit()..getAllAds(),
                          ),
                        ],
                        child: ListView(
//              physics: BouncingScrollPhysics(),
                          children: <Widget>[
                            responsiveSizedBox(
                                context: context, percentageOfHeight: .0),
                            boldTitleRow(
                                context: context,
                                text: "Find Products",
                                withViewMore: false,
                                textColor: blackColor,
                                fontWeight: FontWeight.bold,
                                heightPercentage: .03),
                            responsiveSizedBox(
                                context: context, percentageOfHeight: .02),
                            CustomTextField(
                              hint: "Search",
                              onChange: (v) {
                                setState(() {
                                  searchInputs = v;
                                });
                                print(searchInputs);
                              },
                            ),
                            responsiveSizedBox(
                                context: context, percentageOfHeight: .03),
                            Container(
                                child: searchInputs == ""
                                    ? Column(
                                        children: [
                                          Column(
                                            children: [
                                              boldTitleRow(
                                                onTapViewMore: (){customAnimatedPushNavigation(context, AllProductsScreen());},
                                                  context: context,
                                                  text: "Categories"),
                                              responsiveSizedBox(
                                                  context: context,
                                                  percentageOfHeight: .03),
                                              categoriesListView(context: context),
                                              responsiveSizedBox(
                                                  context: context,
                                                  percentageOfHeight: .03),
                                              boldTitleRow(
                                                  onTapViewMore: (){customAnimatedPushNavigation(context, AllProductsScreen());},
                                                  context: context,
                                                  text: "Offers"),
                                              offersListView(context : context ,) ,
                                              responsiveSizedBox(
                                                  context: context,
                                                  percentageOfHeight: .33),

                                            ],
                                          ),
                                        ],
                                      )
                                    : searchPart(
                                        context: context,
                                        searchWord: searchInputs)),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
          onTapNotifications: () {
            print("notifications  icon pressed ");
          },
        ),
      ),
    );
  }
}

