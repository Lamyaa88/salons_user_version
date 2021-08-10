import 'package:almezyn/app_cubits/salons/all_salons_cubit/all_salons_cubit.dart';
import 'package:almezyn/app_cubits/salons/all_salons_cubit/all_salons_state.dart';
import 'package:almezyn/app_cubits/saved/all_saved_barbers_cubit/all_saved_barbers_cubit.dart';
import 'package:almezyn/app_cubits/saved/all_saved_barbers_cubit/all_saved_barbers_cubit.dart';
import 'package:almezyn/app_cubits/saved/all_saved_barbers_cubit/all_saved_barbers_state.dart';
import 'package:almezyn/app_cubits/saved/all_saved_salons_cubit/all_saved_salons_cubit.dart';
import 'package:almezyn/app_cubits/saved/all_saved_salons_cubit/all_saved_salons_state.dart';
import 'package:almezyn/custom_widgets/custom_single_salon_card.dart';
import 'package:almezyn/screens/barbers/single_barber_details.dart';
import 'package:almezyn/screens/more/saved_Screen.dart';
import 'package:almezyn/screens/salons/single_salon_details_screen.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
savedBarbersTab({BuildContext context, Function onTapSingleSalon}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Container(
    height: height * .4,
    width: width,
    child: NetworkIndicatorWithoutImage(
      child: Container(
        child: BlocConsumer<AllSavedBarbersCubit, AllSavedBarbersStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AllSavedBarbersCubit.get(context);
            if (state is! AllSavedBarbersLoadingState) {
              return Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: height*.05),
                      height:
                      isLandscape(context) ? 2 * height  : height ,
                      width: width,
                      child:
                      cubit.allSavedBarbersModel.data.length == 0?
                      Center(child: customDescriptionTextText(context: context ,
                          percentageOfHeight: .025 , text: "You don\'t have any saved barbers ")):

                      ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: cubit.allSavedBarbersModel.data.length,
                          itemBuilder: (context, index) {
                            return

                              cubit.allSavedBarbersModel.data[index].item != null ?
                              customSingleBarberCardCard(
                                context: context,
                                onTapCard:
                                    (){customAnimatedPushNavigation(context,

                                    SingleBarberDetailsScreen(barberId: cubit.allSavedBarbersModel.data[index].item.id.toString(),
                                      salonId: cubit.allSavedBarbersModel.data[index].item.salons[0].id,));},
                            specificationList: cubit.allSavedBarbersModel.data[index].item.services,
                                englishFees:cubit.allSavedBarbersModel.data[index].item.fees ,
                                arabicFees:cubit.allSavedBarbersModel.data[index].item.fees,
                                onTapDeleteFromSaved:    () {
                                  print(
                                      "delete  address tapped ");
                                  DioHelper.getAllData(
                                    url:
                                    "/delete-save/${cubit.allSavedBarbersModel.data[index].id.toString()}",

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

                                } ,
                                arabicName: cubit.allSavedBarbersModel.data[index].item.name,
                                englishName: cubit.allSavedBarbersModel.data[index].item.name
                                ,isCardForSaved: false,
                                imagePath: cubit.allSavedBarbersModel.data[index].item.image ,
                                specialitiesLength:cubit.allSavedBarbersModel.data[index].item.services.length ,

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
