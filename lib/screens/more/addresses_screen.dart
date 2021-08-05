import 'package:almezyn/app_cubits/addresses/all_addresses_cubit/all_addresses_cubit.dart';
import 'package:almezyn/app_cubits/addresses/all_addresses_cubit/all_addresses_state.dart';
import 'package:almezyn/screens/more/add_address_screen.dart';
import 'package:almezyn/custom_widgets/custom_singl_address_card.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: CustomBuildBody(
          paddingPercentageForBody: 0.0,
          isWithoutLogo: true,
          headerText: "Addresses",
          withoutCartIcon: true,
          backNotDrawerIcon: true,
          onTapBackIcon: () {
            print(token);
            Navigator.of(context).pop();
          },
          columnOfWidgets: Column(
            children: [
              Container(
                height: height(context) * .85,
                width: width(context),
                child: NetworkIndicator(
                    child: BlocProvider(
                  create: (BuildContext context) =>
                      AllAddressesCubit()..getAllAddresses(),
                  child: ListView(
//                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      Container(
                        child:
                            BlocConsumer<AllAddressesCubit, AllAddressesStates>(
                          listener: (context, state) => {},
                          builder: (context, state) {
                            var cubit = AllAddressesCubit.get(context);
                            if (state is! AllAddressesLoadingState) {
                              return cubit.addressesModel.data.length == 0
                                  ? Column(
                                      children: [
                                        responsiveSizedBox(
                                            context: context,
                                            percentageOfHeight: .15),

                                       Icon(Icons.location_on, color: blueColor,
                                       size: 120,),
                                        responsiveSizedBox(
                                            context: context,
                                            percentageOfHeight: .05),


                                        customDescriptionTextText(
                                            context: context,
                                            text:
                                                "You don\'t have \n any saved ddresses " , maxLines: 3 ,
                                            percentageOfHeight: .022),
                                        responsiveSizedBox(
                                            context: context,
                                            percentageOfHeight: .05),
                                        CustomButton(
                                          text: "Add address ",
                                          onTapButton: () {
                                            customAnimatedPushNavigation(
                                                context, AddAddressScreen());
                                          },
                                        )
                                      ],
                                    )
                                  : Container(
                                      height: height(context) * .8,
                                      child: Column(
                                        children: [
                                          responsiveSizedBox(
                                              context: context,
                                              percentageOfHeight: .01),
                                          Container(
                                            height: height(context) * .65,
                                            padding: EdgeInsets.only(
                                                top: height(context) * .01),
                                            child: ListView.builder(
//                                shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: cubit
                                                  .addressesModel.data.length,
                                              itemBuilder: (context, index) {
                                                return
                                                  customSingleAddressCardCard(
                                                        context: context,
                                                        onTapDelete: () {
                                                          print(
                                                              "delete  address tapped ");
                                                          DioHelper.getAllData(
                                                            url:
                                                                "/delete-address/${cubit.addressesModel.data[index].id.toString()}",

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
                                                               customPushNamedNavigation(context, AddressesScreen());

                                                             }

                                                          });

                                                          },

                                                        arabicName: cubit
                                                            .addressesModel
                                                            .data[index]
                                                            .name,
                                                        englishName: cubit
                                                            .addressesModel
                                                            .data[index]
                                                            .name);
                                              },
                                            ),
                                          ),
                                          responsiveSizedBox(
                                              context: context,
                                              percentageOfHeight: .05),
                                          CustomButton(
                                            text: "Add address ",
                                            onTapButton: () {
                                              customAnimatedPushNavigation(
                                                  context, AddAddressScreen());
                                            },
                                          )
                                        ],
                                      ),
                                    );
                            }
                            return Center(
                                child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return
//                            Text("ggg");

                                    customSingleAddressCardCard(
                                        context: context,
                                        isPlaceHolder: false,
                                        isShimmer: true,
                                        arabicName: "",
                                        englishName: "");
                              },
                            ));
                          },
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ],
          ),
        ));
  }
}
