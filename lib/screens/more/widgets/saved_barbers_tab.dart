import 'package:almezyn/app_cubits/saved/all_saved_barbers_cubit/all_saved_barbers_cubit.dart';
import 'package:almezyn/app_cubits/saved/all_saved_barbers_cubit/all_saved_barbers_cubit.dart';
import 'package:almezyn/app_cubits/saved/all_saved_barbers_cubit/all_saved_barbers_state.dart';
import 'package:almezyn/app_cubits/users/all_barbers_cubit/all_barbers_cubit.dart';
import 'package:almezyn/app_cubits/users/all_barbers_cubit/all_barbers_state.dart';
import 'package:almezyn/screens/barbers/single_barber_details.dart';
import 'package:almezyn/screens/more/saved_Screen.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
savedBarbersTab({BuildContext context}){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return  Row(
    mainAxisAlignment:
    MainAxisAlignment.center,
    children: [
      Container(
        height: height*.8,
        child: BlocProvider(
          create: (BuildContext context)=> AllSavedBarbersCubit()..getAllSavedBarbers(),
          child: BlocConsumer<
              AllSavedBarbersCubit,
              AllSavedBarbersStates>(
            listener:
                (context, state) => {},
            builder: (context, state) {
              var cubit =
              AllSavedBarbersCubit.get(context);

              if (state
              is! AllSavedBarbersLoadingState) {
                return Container(
                  child:   cubit.allSavedBarbersModel.data.length==0?
                  Center(child: customDescriptionTextText(context: context ,
                      percentageOfHeight: .025 , text: "You don\'t have any saved barbers")):
                  Container(
                    width: width,
                    child:
                    ListView.builder(
                        shrinkWrap:
                        true,
                        itemCount: cubit
                            .allSavedBarbersModel
                            .data
                            .length,
                        scrollDirection:
                        Axis.vertical,
                        itemBuilder:
                            (context,
                            index) {
                          return customSingleBarberCardCard(
                            isCardForSaved: true,
                              onTapDeleteFromSaved:() {
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

                              },
                              onTapCard: (){
                                {
                                  customAnimatedPushNavigation(context,
                                      SingleBarberDetailsScreen( barberId:cubit.allSavedBarbersModel.data[index].item.id.toString()
                                        , salonId:cubit.allSavedBarbersModel.data[index].item.salons[0].id.toString()
                                        ,salonName:cubit.allSavedBarbersModel.data[index].item.salons[0].nameEn.toString(),
                                        salonLat:double.parse(cubit.allSavedBarbersModel.data[index].item.salons[0].location[0].lat),
                                        salonLolong:double.parse(cubit.allSavedBarbersModel.data[index].item.salons[0].location[0].lng),

                                      ));
                                }
                              },
                              context:
                              context,
                              englishName: cubit
                                  .allSavedBarbersModel
                                  .data[
                              index].item
                                  .name,
                              arabicName: cubit
                                  .allSavedBarbersModel
                                  .data[
                              index].item
                                  .name ,
                              specificationList: cubit.allSavedBarbersModel.data[index].item.specifications,
                              englishFees: cubit.allSavedBarbersModel.data[index].item.fees.toString(),
                              imagePath: cubit
                                  .allSavedBarbersModel
                                  .data[index]
                                  .item.image);
                        }),
                  ),
                );
              }else{
              return spinKit;}
            },
          ),
        ),
      )
    ],
  );
}