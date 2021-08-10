import 'package:almezyn/network/cache_helper.dart';
import 'package:almezyn/screens/other/chats/chat_screen.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsHomeScreen extends StatefulWidget {
  @override
  _AppointmentsHomeScreenState createState() => _AppointmentsHomeScreenState();
}

class _AppointmentsHomeScreenState extends State<AppointmentsHomeScreen> {
  String userName = "";
  String userNumber = "";
  String userType = "";
  String userId = "";
  String userImage = "";
  String userEmail = "";

  getUserData() async {
    DioHelper.init();
    await CacheHelper.init();
    setState(() {
      userName = CacheHelper.getStringData(key: 'user_name');
      userNumber = CacheHelper.getStringData(key: 'user_phone');
      userEmail = CacheHelper.getStringData(key: 'user_email');
      userType = CacheHelper.getStringData(key: 'user_type');
      userId = CacheHelper.getStringData(key: 'user_id').toString();
      userImage = CacheHelper.getStringData(key: 'user_image');
    });
  }

  @override
  void initState() {
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: NetworkIndicator(
        child: CustomBuildBody(
          isWithoutLogo: true,
          withoutBackIcon: true,
          withoutCartIcon: true,
          headerText: "Appointments",
          paddingPercentageForBody: 0.0,
          columnOfWidgets: Column(
            children: [
              BlocProvider(
                create: (BuildContext context) => BarberAppointmentsCubit()
                  ..getBarberAppointments(userId.toString()),
                child: BlocConsumer<BarberAppointmentsCubit,
                    BarberAppointmentsStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var cubit = BarberAppointmentsCubit.get(context);
                    if (state is! BarberAppointmentsLoadingState) {
                      return Container(
                        child: cubit.barberAppointmentsMap["data"].length == 0
                            ? Column(
                                children: [
                                  responsiveSizedBox(
                                      context: context, percentageOfHeight: .1),
                                  Image.asset(AppImages.no_appointments_yet),
                                  customDescriptionTextText(
                                      context: context,
                                      text:
                                          "you dont have any appointments yet ")
                                ],
                              )
                            : Container(
                                height: height,
                                child: Container(
                                  height: height * .8,
                                  padding: EdgeInsets.only(
                                      right: width * .05, left: width * .05),
                                  color: backGroundColor,
                                  child: SingleChildScrollView(
                                      child: Container(
                                    child: Column(
                                      children: [
                                        responsiveSizedBox(
                                            context: context,
                                            percentageOfHeight: .05),
                                        Column(
                                          children: [
                                            Container(
                                              width: width * .9,
                                              height: height * .7,
                                              child: ListView.builder(
                                                  itemCount: cubit
                                                      .barberAppointmentsMap[
                                                          "data"]
                                                      .length
//                                            cubit
//                                                .barberAppointmentsModel
//                                                .data
//                                                .length, ,
                                                  ,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          Column(
                                                            children: [
                                                              responsiveSizedBox(
                                                                  context:
                                                                      context,
                                                                  percentageOfHeight:
                                                                      .02),
                                                              Neumorphic(
                                                                style:
                                                                    NeumorphicStyle(
                                                                        shape: NeumorphicShape
                                                                            .flat,
                                                                        depth:
                                                                            5,
                                                                        lightSource:
                                                                            LightSource
                                                                                .bottomLeft,
                                                                        shadowLightColor:
                                                                            Colors
                                                                                .black,
//                        shadowDarkColor: Colors.grey ,
                                                                        color:
                                                                            backGroundColor),
                                                                child:
                                                                    Container(
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        width: width *
                                                                            .2,
                                                                        child: Image.network(
                                                                            "${baseImageUrl}"
                                                                            "${cubit.barberAppointmentsMap["data"][index]["applicant"]["image"].toString()}"),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              15),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          responsiveSizedBox(
                                                                              context: context,
                                                                              percentageOfHeight: .02),
                                                                          Row(
                                                                            children: [
                                                                              customDescriptionTextText(context: context, fontWeight: FontWeight.bold, textColor: blackColor, textAlign: TextAlign.start, text: "barber name : "),
                                                                              customDescriptionTextText(context: context, textColor: blackColor, textAlign: TextAlign.start, text: "${cubit.barberAppointmentsMap["data"][index]["barber"]["name"].toString()}"),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              customDescriptionTextText(context: context, fontWeight: FontWeight.bold, textColor: blackColor, textAlign: TextAlign.start, text: "day : "),
                                                                              customDescriptionTextText(context: context, textColor: blackColor, textAlign: TextAlign.start, text: "${cubit.barberAppointmentsMap["data"][index]["day"].toString()}"),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              customDescriptionTextText(context: context, fontWeight: FontWeight.bold, textColor: blackColor, textAlign: TextAlign.start, text: "date  : "),
                                                                              customDescriptionTextText(context: context, textColor: blackColor, textAlign: TextAlign.start, text: "${cubit.barberAppointmentsMap["data"][index]["appointment_date"].toString()}"),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              customDescriptionTextText(context: context, fontWeight: FontWeight.bold, textColor: blackColor, textAlign: TextAlign.start, text: "time  : "),
                                                                              customDescriptionTextText(context: context, textColor: blackColor, textAlign: TextAlign.start, text: "${cubit.barberAppointmentsMap["data"][index]["appointment_time"].toString()}"),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              customDescriptionTextText(context: context, fontWeight: FontWeight.bold, textColor: blackColor, textAlign: TextAlign.start, text: "location : "),
                                                                              Container(
                                                                                width: width * .3,
                                                                                child: customDescriptionTextText(context: context, textColor: blackColor, textAlign: TextAlign.start, text: cubit.barberAppointmentsMap["data"][index]["address"].toString() == "" ? "in salon" : "${cubit.barberAppointmentsMap["data"][index]["address"]["name"]}", maxLines: 3),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              customDescriptionTextText(context: context, fontWeight: FontWeight.bold, textColor: blackColor, textAlign: TextAlign.start, text: "description : "),
                                                                              Container(
                                                                                width: width * .3,
                                                                                child: customDescriptionTextText(context: context, textColor: blackColor, textAlign: TextAlign.start, text: "${cubit.barberAppointmentsMap["data"][index]["description"].toString()}", maxLines: 3),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          responsiveSizedBox(
                                                                              context: context,
                                                                              percentageOfHeight: .02),
                                                                          Container(
                                                                            width:
                                                                                width * .6,
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                GestureDetector(
                                                                                    onTap: () {
                                                                                      customAnimatedPushNavigation(
                                                                                          context,
                                                                                          SingleChatScreen(
                                                                                            barberId: cubit.barberAppointmentsMap["data"][index]["barber"]["id"].toString(),
                                                                                            barberName: cubit.barberAppointmentsMap["data"][index]["barber"]["name"].toString(),
                                                                                            barberEmail: cubit.barberAppointmentsMap["data"][index]["barber"]["email"].toString(),
                                                                                            barberImage: cubit.barberAppointmentsMap["data"][index]["barber"]["image"].toString(),
                                                                                            barberNumber:cubit.barberAppointmentsMap["data"][index]["barber"]["phone"].toString() ,

                                                                                          ));
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.chat,
                                                                                      color: Colors.blue,
                                                                                    )),
                                                                                SizedBox(width: width * .05),
                                                                                GestureDetector(
                                                                                    onTap: () {},
                                                                                    child: Icon(
                                                                                      Icons.call,
                                                                                      color: Colors.blue,
                                                                                    )),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          responsiveSizedBox(
                                                                              context: context,
                                                                              percentageOfHeight: .02)
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                                ),
                              ),
                      );
                    }
                    return spinKit;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//----------------------------------------------------------------------------------------- cubit

class BarberAppointmentsCubit extends Cubit<BarberAppointmentsStates> {
  BarberAppointmentsCubit() : super(BarberAppointmentsInitialState());
  static BarberAppointmentsCubit get(context) => BlocProvider.of(context);
  Map barberAppointmentsMap = {};
  int statusCode;
  void getBarberAppointments(String barberId) {
    emit(BarberAppointmentsLoadingState());
    DioHelper.getAllData(url: '/user-appointments', token: token)
        .then((value) async {
      print("all barber appointments is ${value.data}");
      statusCode = value.statusCode;
      barberAppointmentsMap = value.data;
      print(barberAppointmentsMap["data"][0]["applicant"]["name"].toString());
      emit(BarberAppointmentsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(BarberAppointmentsGetErrorState(error: error.toString()));
    });
  }
}

// ------------------------------------------------------------------------------------------  state
abstract class BarberAppointmentsStates {}

class BarberAppointmentsInitialState extends BarberAppointmentsStates {}

class BarberAppointmentsLoadingState extends BarberAppointmentsStates {}

class BarberAppointmentsGetSuccessState extends BarberAppointmentsStates {}

class BarberAppointmentsGetErrorState extends BarberAppointmentsStates {
  final String error;
  BarberAppointmentsGetErrorState({this.error});
}
