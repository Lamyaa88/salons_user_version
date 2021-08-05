import 'package:almezyn/app_cubits/salons/all_salons_cubit/all_salons_cubit.dart';
import 'package:almezyn/app_cubits/salons/all_salons_cubit/all_salons_state.dart';
import 'package:almezyn/app_cubits/saved/all_saved_salons_cubit/all_saved_salons_cubit.dart';
import 'package:almezyn/app_cubits/saved/all_saved_salons_cubit/all_saved_salons_state.dart';
import 'package:almezyn/app_cubits/users/all_barbers_cubit/all_barbers_cubit.dart';
import 'package:almezyn/app_cubits/users/all_barbers_cubit/all_barbers_cubit.dart';
import 'package:almezyn/app_cubits/users/all_barbers_cubit/all_barbers_state.dart';
import 'package:almezyn/custom_widgets/custom_single_salon_card.dart';
import 'package:almezyn/screens/barbers/single_barber_details.dart';
import 'package:almezyn/screens/more/saved_Screen.dart';
import 'package:almezyn/screens/salons/single_salon_details_screen.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
viewALLBarbersList({BuildContext context, Function onTapSingleSalon}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Container(
    height: height * .4,
    width: width,
    child: NetworkIndicatorWithoutImage(
      child: Container(
        child: BlocConsumer<AllBarbersCubit, AllBarbersStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AllBarbersCubit.get(context);
            if (state is! AllBarbersLoadingState) {
              return Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: height*.05),
                      height:
                      isLandscape(context) ? 2 * height  : height ,
                      width: width,
                      child:
                      ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: cubit.allBarbersModel.data.length, itemBuilder: (context, index) {
                            return
                              customSingleBarberCardCard(
                                context: context,
                                onTapCard:
                                    (){customAnimatedPushNavigation(context,
                                        SingleBarberDetailsScreen(barberId:
                                        cubit.allBarbersModel.data[index].id.toString(),));},
                                arabicName: cubit.allBarbersModel.data[index].name ,
                                englishName: cubit.allBarbersModel.data[index].name ,
                                imagePath: cubit.allBarbersModel.data[index].image ,
                                specialitiesLength: cubit.allBarbersModel.data[index].
                                services.length ,
                                specificationList: cubit.allBarbersModel.data[index].
                                specifications,
                                englishFees: cubit.allBarbersModel.data[index].fees,
                                arabicFees: cubit.allBarbersModel.data[index].fees,);
                          })),
                ],
              );
            }
            return customDefaultShimmerListView(context: context);
          },
        ),
      ),
    ),
  );}
