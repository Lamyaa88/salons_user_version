import 'package:almezyn/app_cubits/users/single_barber_cubit/single_barber_cubit.dart';
import 'package:almezyn/app_cubits/users/single_barber_cubit/single_barber_state.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class BookAppointmentScreen extends StatefulWidget {
  final barberId  ;
  final salonId ;
  BookAppointmentScreen({this.barberId , this.salonId }) ;

  @override

  _BookAppointmentScreenState createState() => _BookAppointmentScreenState(barberId: barberId , salonId: salonId );
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final barberId  ;
  final salonId ;

  _BookAppointmentScreenState({this.barberId , this.salonId });
  var selectedItemList ;
  List<String> services = ["s1" , "s2"] ;
  List<String> dates = ["d1" , "d2"] ;
  List <String> addresses = [] ;
@override
  void initState() {
    // TODO: implement initState
    print("salonIs is ${salonId} and barberId is ${barberId} ");
    
    DioHelper.getAllData(url: "/barber/${barberId}"  , token: token).then((value){
      setState(() {
        services = [value.data["data"]["services"][0]["name_en"].toString()
          , value.data["data"]["services"][1]["name_en"].toString() ];

        dates = [value.data["data"]["availability"][0]["day"].toString() ,
          value.data["data"]["availability"][1]["day"].toString() ];
      });
    });
        DioHelper.getAllData(url: "/my-addresses"  , token: token).then((value){
      setState(() {
        services = [value.data["data"]["services"][0]["name_en"].toString()
          , value.data["data"]["services"][1]["name_en"].toString() ];

        addresses = [value.data["data"][0]["name"].toString() ,
                  value.data["data"][1]["name"].toString() ];
        print(addresses);
      });
    }
       );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        backgroundColor: whiteColor,elevation: 0,title: customDescriptionTextText(context: context , textColor: blackColor ,
          text: "Book Appointment " , percentageOfHeight: .025, fontWeight: FontWeight.bold),),
      body: BlocProvider(
        create: (BuildContext context )=> SingleBarberCubit()..getSingleBarber(),
        child: BlocConsumer<SingleBarberCubit , SingleBarberStates>(
          listener: (context , state){},
          builder: (context  , state ){
            var cubit = SingleBarberCubit.get(context) ;
            if(state is! SingleBarberLoadingState){
              return

            Container(
            height: height(context),
            color: Colors.transparent,
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        responsiveSizedBox(context: context , percentageOfHeight: .02) ,


                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            responsiveSizedBox(context: context , percentageOfHeight: .02) ,



                          ]
                          ,) ,
                        Container(padding: EdgeInsets.only(right: width(context)*.05 , left: width(context)*.05),
                          child: Column(
                            children: [
                              responsiveSizedBox(context: context , percentageOfHeight: .02) ,
                              Row(children: [
                                customDescriptionTextText(context: context ,
                                    text: "choose a service : " , percentageOfHeight: .025, textAlign: TextAlign.start , textColor: blackColor ),

                              ],),
                              responsiveSizedBox(context: context , percentageOfHeight: .02) ,
                              RadioButtonGroup(
                                activeColor: blueColor,
                                labels:services
//                          disabled: [
//                            "Option 1"
//                          ],
                               , onChange: (String label, int index) => print("label: $label index: $index"),
                                onSelected: (String label) => print(label),
                              ),
                              Row(children: [
                                customDescriptionTextText(context: context ,
                                    text: "Choose time :" , percentageOfHeight: .025, textAlign: TextAlign.start , textColor: blackColor ),

                              ],),
                              responsiveSizedBox(context: context , percentageOfHeight: .02) ,
                              Row(children: [
                                customDescriptionTextText(context: context ,
                                    text: "Choose a day :" , percentageOfHeight: .025, textAlign: TextAlign.start , textColor: blackColor  ),
                              ],),
                              RadioButtonGroup(
                                activeColor: blueColor,
                                labels: dates ,
//                          disabled: [
//                            "Option 1"
//                          ],
                                onChange: (String label, int index) => print("label: $label index: $index"),
                                onSelected: (String label) => print(label),
                              ),

                              responsiveSizedBox(context: context , percentageOfHeight: .02) ,
                              Row(children: [
                                customDescriptionTextText(context: context ,
                                    text: "appointment place :" , percentageOfHeight: .025,  textAlign: TextAlign.start , textColor: blackColor ),
                              ],),

                              responsiveSizedBox(context: context , percentageOfHeight: .02) ,

                              Row(children: [
                             Container(child:
                            Center(child:
                            customDescriptionTextText(

                                context: context , text: "Salon" , textColor: blueColor
                            ),),decoration: BoxDecoration( borderRadius: BorderRadius.circular(8),
                                 border:
                             Border.all(color: blueColor)),width: width(context)*.2,height: height(context)*.05,),
                             SizedBox(width: 20,),
                                GestureDetector(onTap: (){

                                },
                                  child: Container(child:
                                  Center(child:
                                  customDescriptionTextText(

                                      context: context , text: "home" , textColor: greyColor
                                  ),),decoration: BoxDecoration( borderRadius: BorderRadius.circular(8),
                                      border:
                                      Border.all(color: greyColor)),width: width(context)*.2,height: height(context)*.05,),
                                ),
                           ],)
                            ],
                          ),),


                        responsiveSizedBox(context: context , percentageOfHeight: .02) ,



                        CustomTextField(hint: "Appointment For",
                        ),
                        responsiveSizedBox(context: context , percentageOfHeight: .02) ,
                        CustomButton(onTapButton: (){
                          DioHelper.postDataForRegister(
                            url: "/book-appointment",
                            data: {
                              "appointment_date" : "2021-10-10",
                              "appointment_time" :"12:30" ,
                              "description":"baby hair cut ",
                              "barber_id":"92" ,
                            "salon_id" : "2" ,
                            "day":"friday" ,
                              "speciality_ids":"1" ,
                              "location":"1"
                            },

                          ).then((value) {
                            final response =
                                value.data;
                            print("book appointment response is  ${value.data}");
                            if(value.statusCode == 200){
                              ScaffoldMessenger.of(
                                  context)
                                  .showSnackBar(
                                  SnackBar(
                                    content: Text(value.data["message"]),
                                  ));
                            } else{
                              ScaffoldMessenger.of(
                                  context)
                                  .showSnackBar(
                                  SnackBar(
                                    content: Text("Welcome ${value.data["user"]["name"]} !"),
                                  ));

                              print("user name is ${value.data["user"]["name"]}");
                              print("user email is ${value.data["user"]["email"]}");
                              print("user phone  is ${value.data["user"]["phone"]}");


                            }

                          });






//                      showCustomAlertDialog(context: context , alertTitle: "Done !" ,onTapSalon:
//                          (){
//                        Navigator.of(context).pop();}, onTapHome: (){Navigator.of(context).pop();},
//                          alertSubtitle:
//                          "Your appointment has been  sent successfully ");
                          }
                        ,text:  "Confirm Booking"),
                        responsiveSizedBox(context: context , percentageOfHeight: .02) ,





                      ],
                    ),
                  ),
                )),
          ) ;}
            return spinKit;}
        ),
      ),
    );
  }

  brandCheckBoxFilter({BuildContext context   , Function onChangeCheckBox }){

    List<String> allItemList = [
      'Hair cut ',
      'Beard shaving ',
      'Baby  Hair cut ',
    ];

    List<String> checkedItemList = ['Green', 'Yellow'];

    return  GroupedCheckbox(
      hoverColor: blueColor,
      itemList: allItemList,
//      checkedItemList: checkedItemList,
//      disabled: ['Black'],
      onChanged:  onChangeCheckBox ,
//          (itemList) {
//        setState(() {
//          selectedItemList = itemList;
//          print('SELECTED ITEM LIST $itemList');
//        });
//      },
      orientation: CheckboxOrientation.VERTICAL,
      checkColor: whiteColor ,
      activeColor: blueColor  ,

    );
  }

  Future showCustomAlertDialog(

      {BuildContext context, String alertTitle ,String alertSubtitle , Function onTapHome , Function onTapSalon }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: isLandscape(context)
                ? .7 * width(context) * .95
                : width(context) * .95,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
//                responsiveSizedBox(context: context, percentageOfHeight: .02),
                Container(
                  height: isLandscape(context)
                      ? 2 * height(context) * .25
                      : height(context) * .25,
                  width: width(context)*.5,
                  decoration:
                  BoxDecoration(image: DecorationImage(image: AssetImage(AppImages.contact_us),fit: BoxFit.fill )),
                ),
                responsiveSizedBox(context: context, percentageOfHeight: .0),
                customBoldText(context: context, text: alertTitle ),
                responsiveSizedBox(context: context, percentageOfHeight: .02),
                customDescriptionTextText(context: context, text: alertSubtitle , maxLines: 40),
                responsiveSizedBox(context: context, percentageOfHeight: .02),

              ],
            ),
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(
                height(context) * .02,
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        child:
                        customDescriptionTextText(context: context, text: translator.translate("Ok"),

                             percentageOfHeight: .022 , fontWeight: FontWeight.bold ),
                        onTap: onTapHome ),
                    SizedBox(width: width(context)*.05,),
                    GestureDetector(
                        child:
                        customDescriptionTextText(context: context, text: translator.translate("My Appointment") ,

                            percentageOfHeight: .022, fontWeight: FontWeight.bold  , textColor: blueColor),
                        onTap: onTapSalon )]
              ),
            ),
          ],
        );
      },
    );
  }
}

