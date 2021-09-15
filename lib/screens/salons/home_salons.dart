import 'package:almezyn/app_cubits/offers/all_offers_cubit/all_offers_cubit.dart';
import 'package:almezyn/app_cubits/salons/all_salons_cubit/all_salons_cubit.dart';
import 'package:almezyn/screens/salons/all_salons_screen.dart';
import 'package:almezyn/screens/salons/widgets/all_salons_list_view.dart';
import 'package:almezyn/screens/salons/widgets/offers_list_view.dart';
import 'package:almezyn/screens/salons/widgets/top_slider.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:almezyn/screens/salons/widgets/serch_salons_part.dart';
import 'package:almezyn/app_cubits/specifications/all_categories_cubit/all_specifications_cubit.dart';
import 'package:almezyn/screens/salons/widgets/specifications_list_view.dart';
import 'package:almezyn/screens/salons/salon_all_specifications_screen.dart';
import 'package:almezyn/screens/salons/all_offers_screen.dart';

class SalonsHomeScreen extends StatefulWidget {
  @override
  _SalonsHomeScreenState createState() => _SalonsHomeScreenState();
}

class _SalonsHomeScreenState extends State<SalonsHomeScreen> {
  String searchInputs = "";
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NetworkIndicator(
        child: CustomBuildBody(
          onTapBackIcon: () {
            Navigator.pop(context);
          },
          paddingPercentageForBody: 0.0,
          columnOfWidgets: Column(
            children: [
              NetworkIndicator(
                child: Container(
                  height: height,
                  child: NestedScrollView(
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverAppBar(
                            expandedHeight: isLandscape(context)
                                ? 2 * height * .4
                                : height * .4,
                            backgroundColor: whiteColor,
                            forceElevated: false,
                            elevation: 0,
                            foregroundColor: Colors.white,
                            flexibleSpace: FlexibleSpaceBar(
                                background: Container(
                                    child: Container(
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      salonsTopSlider(context: context)
                                    ],
                                  ),
                                ],
                              ),
                            ))),
                          ),
                        ];
                      },
                      body: Container(
                        child: MultiBlocProvider(
                          providers: [
                            BlocProvider<AllSpecificationsCubit>(
                              create: (BuildContext context) =>
                                  AllSpecificationsCubit()
                                    ..getAllSpecifications(),
                            ),
                            BlocProvider<AllOffersCubit>(
                              create: (BuildContext context) =>
                                  AllOffersCubit()..getAllOffers(),
                            ),
                            BlocProvider<AllSalonsCubit>(
                              create: (BuildContext context) =>
                                  AllSalonsCubit()..getAllSalons(),
                            ),
                          ],
                          child: ListView(
//              physics: BouncingScrollPhysics(),
                            children: <Widget>[
                              responsiveSizedBox(
                                  context: context, percentageOfHeight: .0),
                              boldTitleRow(
                                  context: context,
                                  text: "Find salons",
                                  withViewMore: false,
                                  textColor: blackColor,
                                  fontWeight: FontWeight.bold,
                                  heightPercentage: .03),
                              responsiveSizedBox(
                                  context: context, percentageOfHeight: .02),
                              CustomTextField(
                                controller: _searchController,
                                containsSuffixIcon:
                                    searchInputs == "" ? false : true,
                                onTapSuffixIcon: () {
                                  setState(() {
                                    searchInputs = "";
                                    _searchController.clear();
                                    FocusScope.of(context).unfocus();
                                  });
                                },
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
                                                    context: context,
                                                    text: "Specifications",
                                                    onTapViewMore: () {
                                                      customAnimatedPushNavigation(
                                                          context,
                                                          AllSalonSpecifications());
                                                    }),
                                                responsiveSizedBox(
                                                    context: context,
                                                    percentageOfHeight: .03),
                                                specificationListView(
                                                    context: context),
                                                responsiveSizedBox(
                                                    context: context,
                                                    percentageOfHeight: .03),
                                                boldTitleRow(
                                                    context: context,
                                                    text: "Offers",
                                                    onTapViewMore: () {
                                                      customAnimatedPushNavigation(
                                                          context,
                                                          AllOffersScreen());
                                                    }),
                                                responsiveSizedBox(
                                                    context: context,
                                                    percentageOfHeight: .03),
                                                offersListView(
                                                    context: context),
                                                responsiveSizedBox(
                                                    context: context,
                                                    percentageOfHeight: .03),
                                              ],
                                            ),
                                          ],
                                        )
                                      : searchSalonsPart(
                                          context: context,
                                          searchWord: searchInputs)),
                              responsiveSizedBox(
                                  context: context, percentageOfHeight: .03),
                              boldTitleRow(
                                  context: context,
                                  text: "all salons",
                                  onTapViewMore: () {
                                    customAnimatedPushNavigation(
                                        context, AllSalonsScreen());
                                  }),
                              responsiveSizedBox(
                                  context: context, percentageOfHeight: .03),
                              Container(
                                height: height * .5,
                                child: allSalonsListView2(context: context),
                              ),
                              responsiveSizedBox(
                                  context: context, percentageOfHeight: .2),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
