import 'package:almezyn/app_cubits/salons/all_salons_cubit/all_salons_cubit.dart';
import 'package:almezyn/app_cubits/salons/all_salons_cubit/all_salons_state.dart';
import 'package:almezyn/app_cubits/saved/all_saved_salons_cubit/all_saved_salons_cubit.dart';
import 'package:almezyn/app_cubits/saved/all_saved_salons_cubit/all_saved_salons_state.dart';
import 'package:almezyn/custom_widgets/custom_single_salon_card.dart';
import 'package:almezyn/screens/more/saved_Screen.dart';
import 'package:almezyn/screens/salons/single_salon_details_screen.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
savedSalonsTab({BuildContext context, Function onTapSingleSalon}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Container(
    height: height * .4,
    width: width,
    child: NetworkIndicatorWithoutImage(
      child: Container(
        child: BlocConsumer<AllSavedSalonsCubit, AllSavedSalonsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AllSavedSalonsCubit.get(context);
            if (state is! AllSavedSalonsLoadingState) {
              return Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height*.05),
                      height:
                      isLandscape(context) ? 2 * height  : height ,
                      width: width,
                      child:
                      cubit.savedSalonsModel.data.length==0?
            Center(child: customDescriptionTextText(context: context ,
            percentageOfHeight: .025 , text: "You don\'t have any saved salons ")):

                      ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: cubit.savedSalonsModel.data.length,
                          itemBuilder: (context, index) {
                            return

                              cubit.savedSalonsModel.data[index].item != null ?
                              customSingleSalonCard(
                              context: context,
                              onTapCard:
                                  (){customAnimatedPushNavigation(context,

                                  SingleSalonDetailsScreen(salonId: cubit.savedSalonsModel.data[index].item.id.toString(),salonLat:double
                                      .parse( cubit.savedSalonsModel.data[index].item.location[0].lat) , salonLong:
                                  double.parse(cubit.savedSalonsModel.data[index].item.location[0].lng),));},
                                isCardForSavedLIst: true ,onTapDeleteFromSaved: () {
                                print(
                                    "delete  address tapped ");
                                DioHelper.getAllData(
                                  url:
                                  "/delete-save/${cubit.savedSalonsModel.data[index].id.toString()}",
                                  token: token,
                                ).then((value) {
                                  final response =
                                      value.data;
                                  print(
                                      "response for address is   ${response}");
                                  print(
                                      "status code for adding address is   ${value.statusCode}");
                                  if(value.statusCode == 200 ){
                                    ScaffoldMessenger
                                        .of(context)
                                        .showSnackBar(
                                        SnackBar(
                                          content: Text(value.data["message"]),
                                        ));
                                    customPushNamedNavigation(context, SavedScreen());

                                  }

                                });

                              },
                              arabicName: cubit.savedSalonsModel.data[index].item.nameAr ,
                              englishName: cubit.savedSalonsModel.data[index].item.nameEn ,
                              imagePath2:cubit.savedSalonsModel.data[index].item.images ,
                              imagePath: cubit.savedSalonsModel.data[index].item.images ,
                              arabicDescription: cubit.savedSalonsModel.data[index].item.descriptionAr,
                              englishDescription: cubit.savedSalonsModel.data[index].item.descriptionEn,
                              specialitiesLength:cubit.savedSalonsModel.data[index].item.specialities.length ,
                              specialitiesList: cubit.savedSalonsModel.data[index].item.specialities ,
                            ) : SizedBox();
                          })),
                ],
              );
            }
            return customDefaultShimmerListView(context: context);
          },
        ),
      ),
    ),
  );
}
