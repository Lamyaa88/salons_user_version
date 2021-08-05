//import 'package:almezyn/custom_widgets/custom_push_named_navigation.dart';
//import 'package:almezyn/network/cache_helper.dart';
//import 'package:almezyn/screens/auth/Login/cubit/cubit_login.dart';
//import 'package:almezyn/screens/auth/Login/cubit/state_login.dart';
//import 'package:almezyn/utils/constants.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:toast/toast.dart';
//import '../../../app_tab/app.dart';
//import 'package:almezyn/custom_widgets/entry_field.dart';
//class LoginUI extends StatefulWidget {
//  @override
//  _LoginUIState createState() => _LoginUIState();
//}
//
//class _LoginUIState extends State<LoginUI> {
//  String phone, password;
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//  @override
//  Widget build(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;
//
////    var locale = AppLocalizations.of(context);
//    return BlocProvider(
//      create: (BuildContext context) => CubitLogin(),
//      child: BlocConsumer<CubitLogin, MezaynLoginState>(
//        listener: (context, state) {
//          if (state is MezaynLoginSuccessState) {
//            if (state.usersModals.accessToken == null) {
//              Toast.show(
//                "username error or password error ",
//                context,
//                duration: Toast.LENGTH_SHORT,
//                gravity: Toast.BOTTOM,
//                backgroundColor: Colors.red,
//                textColor: Colors.white,
//              );
//            } else {
//              CacheHelper.putStringData(
//                      key: 'token', value: state.usersModals.accessToken)
//                  .then((value) {
//                customPushNamedNavigation(context, AppTab());
//              });
//            }
//          }
//        },
//        builder: (context, state) {
//          var cubit = CubitLogin.get(context);
//          return Scaffold(
//            backgroundColor: Theme.of(context).backgroundColor,
//            body: SingleChildScrollView(
//              child: Form(
//                key: _formKey,
//                child: Container(
//                  width: width,
//                  child: Stack(
//                    children: [
//                      Container(
//                        height: MediaQuery.of(context).size.height,
//                        color: Theme.of(context).splashColor,
//                        child: Container(
//                          child: Column(
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            children: [
////                    Image.asset('assets/logo_user.png', scale: 3),
////                    Spacer(),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  Image.asset(
//                                    'assets/barbersImages/photo4.jpg',
//                                    height: height * .55,
//                                    width: width,
//                                    fit: BoxFit.fitHeight,
//                                  ),
//                                ],
//                              ),
//                            ],
//                          ),
//                        ),
//                      ),
//                      Column(
//                        children: [
//                          SizedBox(
//                              height:
//                                  MediaQuery.of(context).size.height * 0.56),
//                          EntryField(
//                                     hint:   "number" ,
//                            prefixIcon: Icons.phone_iphone,
//                            color: Theme.of(context).scaffoldBackgroundColor,
//                            validation: (value) {
//                              if (value.isEmpty || value.length < 10) {
//                                return 'please enter correct phone number';
//                              }
//                            },
//                            onSaved: (value) {
//                              phone = value;
//                            },
//                          ),
//                          SizedBox(
//                            height: height * .01,
//                          ),
//                          EntryField(
//                            hint: "Inter Password",
//                            prefixIcon: Icons.lock_outline,
//                            color: Theme.of(context).scaffoldBackgroundColor,
//                            validation: (value) {
//                              if (value.isEmpty || value.length < 6) {
//                                return "please enter password greater than 6 character";
//                              }
//                            },
//                            onSaved: (value) {
//                              password = value;
//                            },
//                          ),
//
//                          SizedBox(
//                            height: height * .01,
//                          ),
////                    SizedBox(height: 1.0),
//                          if (state is! MezaynLoginLoadingState) ...[
//                            Container(
//                              height: height * .08,
//                              padding: EdgeInsets.only(
//                                  right: width * .02, left: width * .02),
//                              child: GestureDetector( onTap: () {
//                                if (_formKey.currentState.validate()) {
//                                  _formKey.currentState.save();
//                                  cubit.phoneLogin(
//                                      phone: phone, password: password);
//                                }
//                              }),
//                            ),
//                          ] else ...[
//                            Container(
//                              height: height * 0.1,
//                              child: Center(child: spinKit),
//                            ),
//                          ],
//                          SizedBox(
//                            height: height * .01,
//                          ),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: [
//                              Text(
//                                "Dont\'t have an account ?  ",
//                                style: Theme.of(context)
//                                    .textTheme
//                                    .subtitle1
//                                    .copyWith(fontSize: height * .018),
//                              ),
//                              GestureDetector(
//                                  onTap: () {
////                                    Navigator.push(
////                                      context,
////                                      MaterialPageRoute(
////                                          builder: (context) =>
////                                              RegistrationPage()),
////                                    );
//                                  },
//                                  child: Text(
//                                    "Register",
//                                    style: Theme.of(context)
//                                        .textTheme
//                                        .subtitle1
//                                        .copyWith(fontSize: height * .024),
//                                  ))
//                            ],
//                          ),
//                          SizedBox(
//                            height: height * .01,
//                          ),
//                          Text(
//                           "" ,
//                            style: Theme.of(context)
//                                .textTheme
//                                .subtitle1
//                                .copyWith(fontSize: height * .024),
//                          ),
//
//                          SizedBox(
//                            height: height * .0,
//                          ),
//                          Container(
//                            height:
//                                height > width ? height * .08 : height * .16,
//                            width: width * .9,
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: [
////                                Container(
////                                  width: width * .4,
////                                  height: height * .07,
//////                                  child: CustomButton(
//////                                      icon: Container(
//////                                          child: Image.asset(
//////                                        'assets/Icons/ic_fb.png',
//////                                        height:
//////                                            MediaQuery.of(context).size.height *
//////                                                0.07,
//////                                      )),
//////                                      color: Color(0xff3b45c1),
//////                                      label: locale.facebook,
//////                                      textSize: height * .02,
//////                                      onTap: () {
//////                                        // widget.loginInteractor.loginWithFacebook(),
//////                                      }),
////                                ),
//                                SizedBox(width: .06),
////                                Container(
////                                  width: width * .4,
////                                  height: height * .07,
////                                  child: CustomButton(
////                                      label: locale.gmail,
////                                      textSize: height * .02,
////                                      icon: Image.asset(
////                                        'assets/Icons/ic_ggl.png',
////                                        height:
////                                            MediaQuery.of(context).size.height *
////                                                0.07,
////                                      ),
////                                      color: Theme.of(context)
////                                          .scaffoldBackgroundColor,
////                                      textColor: Theme.of(context).cursorColor,
////                                      onTap: () {
////                                        // widget.loginInteractor.loginWithGoogle(),
////                                      }),
////                                ),
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//          );
//        },
//      ),
//    );
//  }
//}
