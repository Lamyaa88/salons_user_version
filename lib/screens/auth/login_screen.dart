import 'package:almezyn/custom_widgets/custom_animated_push_navigation.dart';
import 'package:almezyn/custom_widgets/custom_build_body.dart';
import 'package:almezyn/custom_widgets/custom_button.dart';
import 'package:almezyn/custom_widgets/custom_description_text.dart';
import 'package:almezyn/custom_widgets/custom_push_named_navigation.dart';
import 'package:almezyn/custom_widgets/network_indicator_without_image.dart';
import 'package:almezyn/custom_widgets/responsive_sized_box.dart';
import 'package:almezyn/network/cache_helper.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:almezyn/screens/app_tab/app.dart';
import 'package:almezyn/screens/auth/Login/cubit/cubit_login.dart';
import 'package:almezyn/screens/auth/Login/cubit/state_login.dart';
import 'package:almezyn/barbers_app/screens/app_tab/appForBarber.dart';
import 'package:almezyn/screens/auth/singn_in_screen.dart';
import 'package:almezyn/utils/colors.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/icons.dart';
import 'package:almezyn/utils/images.dart';
import 'package:almezyn/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:toast/toast.dart';
import 'package:almezyn/custom_widgets/entry_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phone, password;
  TextEditingController _phone= TextEditingController();
  TextEditingController _password = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

//    var locale = AppLocalizations.of(context);
    return BlocProvider(
      create: (BuildContext context) => CubitLogin(),
      child: BlocConsumer<CubitLogin, MezaynLoginState>(
        listener: (context, state) {
          if (state is MezaynLoginSuccessState) {
            if (state.usersModals.accessToken == null) {
              Toast.show(
                "username error or password error ",
                context,
                duration: Toast.LENGTH_SHORT,
                gravity: Toast.BOTTOM,
                backgroundColor: Colors.red,
                textColor: Colors.white,
              );
            } else {
//              CacheHelper.putStringData(
//                      key: 'token', value: state.usersModals.accessToken)
//                  .then((value) {
                customPushNamedNavigation(context,  AppTab());
//              }
//            );
            }
          }
        },
        builder: (context, state) {
          var cubit = CubitLogin.get(context);
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: CustomBuildBody(
              withoutBackIcon: true,
              withoutCartIcon: true,
              backNotDrawerIcon: true,
              paddingPercentageForBody: 0.0,
              columnOfWidgets: Column(
                children: [
                  Container(height: isLandscape(context)
                  ? 2 * height * .8
                  : height * .8,
              child: SingleChildScrollView(
                child:  Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(width: width*.9,height: height*.07,
                                child: NetworkIndicatorWithoutImage(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      customDescriptionTextText(context: context ,textColor: blueColor  ,
                                          text: "Login" , fontWeight: FontWeight.bold , percentageOfHeight: .033)
                                    ],),
                                ),
                              ),
                              Center(
                                child:Image.asset(AppImages.no_appointments_yet, height: isLandscape(context)
                                    ? 2 * height * .25
                                    : height * .25,),
                              ),

                              Container(height: isLandscape(context)
                                  ? 2 * height * .7
                                  : height * .7,
                                child:Column(children: [

                                  responsiveSizedBox(context: context , percentageOfHeight: .03),

                                  EntryField(
                                    controller: _phone,
                                    hint: "Phone Number",
                                    prefixIcon: Icons.phone_iphone,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    validation: (value) {
                                      if (value.isEmpty ||
                                          value.length < 10) {
                                        return 'please enter correct phone number';
                                      }
                                    },
                                    onSaved: (value) {
                                      phone = value;
                                    },
                                  ),
                                  responsiveSizedBox(context: context , percentageOfHeight: .02),

                                  EntryField(
                                    controller: _password,
                                    hint: "Password",
                                    prefixIcon: Icons.lock_outline,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    validation: (value) {
                                      if (value.isEmpty ||
                                          value.length < 6) {
                                        return "please enter password greater than 6 character";
                                      }
                                    },
                                    onSaved: (value) {
                                      password = value;
                                    },
                                  ),

                                  responsiveSizedBox(context: context , percentageOfHeight: .02),
                                  if (state
                                  is! MezaynLoginLoadingState) ...[
                                    Container(

                                        height: height * .08,

                                        child: CustomButton(text:translator.translate("login"), onTapButton:()
                                        {
                                          print(
                                              "add address tapped ");

                                          DioHelper.postDataForAuth(
                                            url: "//login",
                                            data: {
                                              "phone":_phone.text,
                                              "password":_password.text},

                                          ).then((value) async {
                                            final response =
                                                value.data;
                                            print("response for register is ${value.data}");
                                            if(value.statusCode == 200 && value.data["validation_error"] != null ){
                                              ScaffoldMessenger.of(
                                                  context)
                                                  .showSnackBar(
                                                  SnackBar(
                                                    content: Text("The email has already been taken., The phone has already been taken"),
                                                  ));
                                            } else{
                                              ScaffoldMessenger.of(
                                                  context)
                                                  .showSnackBar(
                                                  SnackBar(
                                                    content: Text("Welcome ${value.data["user"]["name"]} !"),
                                                  ));
                                              customPushNamedNavigation(context,value.data["user"]["type"] == "user"?  AppTab() :AppTabForBarber() );
                                              print("user name is ${value.data["user"]["name"]}");
                                              print("user email is ${value.data["user"]["email"]}");
                                              print("user phone  is ${value.data["user"]["phone"]}");
                                              CacheHelper.putStringData(key: "token", value: value.data["access_token"]);
                                              CacheHelper.putStringData(key: "user_name", value: value.data["user"]["name"]);
                                              CacheHelper.putStringData(key: "user_email", value: value.data["user"]["email"]);
                                              CacheHelper.putStringData(key: "user_phone", value: value.data["user"]["phone"]);
                                              CacheHelper.putStringData(key: "user_id", value: value.data["user"]["id"].toString());
                                              CacheHelper.putStringData(key: "user_type", value: value.data["user"]["type"]);
                                              CacheHelper.putStringData(key: "user_image", value: value.data["user"]["avatar"]);
                                              await CacheHelper.init();
                                              token  = CacheHelper.getStringData(key: 'token');


                                            }

                                          });
                                        }
                                        )
                                    ),
                                  ] else ...[
                                    Container(
                                      height: height * 0.1,
                                      child: Center(child: spinKit),
                                    ),
                                  ],
                                  responsiveSizedBox(context: context , percentageOfHeight: .02),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Dont\'t have an account ?  ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(
                                            fontSize:
                                            height * .018),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            customAnimatedPushNavigation(context, RegisterScreen());
                                          },
                                          child: Text(
                                            "Register",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                fontSize:
                                                height *
                                                    .024),
                                          ))
                                    ],
                                  ),
                                  responsiveSizedBox(context: context , percentageOfHeight: .005),
                                  customDescriptionTextText(context: context , text: translator.translate("Or")),
                                  responsiveSizedBox(context: context , percentageOfHeight: .005),
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      GestureDetector(
                                        onTap:
                                        (){
//                                          customAnimatedPushNavigation(context, AppTab());
                                        },
                                          child: Image.asset(AppIcons.facebook)),
                                      SizedBox(width: width*.03,),
                                      Image.asset(AppIcons.google)

                                    ],)

                                ],),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
