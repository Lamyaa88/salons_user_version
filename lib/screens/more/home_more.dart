import 'package:almezyn/network/cache_helper.dart';
import 'package:almezyn/screens/auth/login_screen.dart';
import 'package:almezyn/screens/more/widgets/single_account_button.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:almezyn/screens/more/widgets/user_data.dart';
import 'package:almezyn/screens/more/change_language_screen.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:almezyn/screens/more/contact_us.dart';
import 'package:almezyn/screens/more/faqs.dart';

import 'addresses_screen.dart';
class MoreHomeScreen extends StatefulWidget {
  @override
  _MoreHomeScreenState createState() => _MoreHomeScreenState();
}
class _MoreHomeScreenState extends State<MoreHomeScreen> {
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
          headerText: translator.translate("Account"),
          paddingPercentageForBody: 0.0,
          columnOfWidgets: Column(
            children: [
              Container(
                height: height,
                child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          leading: null,
                          expandedHeight: isLandscape(context)
                              ? 2 * height * .26
                              : height * .26,
                          backgroundColor: whiteColor,
                          floating: false,
                          pinned: false,
                          flexibleSpace: FlexibleSpaceBar(
                              background: Container(
                            child: Column(
                              children: [
                                userData(
                                    context: context,
                                    userImage: "${baseImageUrl}${userImage}",
                                    userName: userName,
                                    userNumber: userNumber,
                                    switchType: userType == "user"
                                        ? ""
                                        : ""),
                              ],
                            ),
                          )),
                        ),
                      ];
                    },
                    body: Container(
                      height: height * .8,
                      padding:
                          EdgeInsets.only(right: width * .05, left: width * .05),
                      color: backGroundColor,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            responsiveSizedBox(
                                context: context, percentageOfHeight: .04),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                singleAccountCard(
                                    context: context,
                                    title: "Wallet",
                                    subtitle: "Quick Payment",
                                    iconData: Icons.payments,
                                    onTap: () {}),
                                singleAccountCard(
                                    context: context,
                                    title: "My Orders",
                                    subtitle: "Order Status",
                                    iconData: Icons.motorcycle,
                                    onTap: () {})
                              ],
                            ),
                            responsiveSizedBox(
                                context: context, percentageOfHeight: .02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                singleAccountCard(
                                    context: context,
                                    title: "Password",
                                    subtitle: "Change Password",
                                    iconData: Icons.edit,
                                    onTap: () {}),
                                singleAccountCard(
                                    context: context,
                                    title: "My Addresses",
                                    subtitle: "Saved Addresses ",
                                    iconData: Icons.location_on,
                                    onTap: () {
                                      customAnimatedPushNavigation(
                                          context, AddressesScreen());

//                                    CoolAlert.show(
//                                      onCancelBtnTap: (){Navigator.of(context).pop();},
//                                      onConfirmBtnTap: (){print("Confirm tapped ");},
//                                      cancelBtnText: "close",
//                                      context: context,backgroundColor: whiteColor,confirmBtnColor:Colors.red,
////                                      autoCloseDuration: Duration(seconds: 1),
//                                      type: CoolAlertType.success,
//                                      text: "Your transaction was successful!",
//                                    );
                                    }),
                              ],
                            ),
                            responsiveSizedBox(
                                context: context, percentageOfHeight: .02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                singleAccountCard(
                                    context: context,
                                    title: "Saved",
                                    subtitle: "Salons And Products",
                                    iconData: Icons.bookmark,
                                    onTap: () {}),
                                singleAccountCard(
                                    context: context,
                                    title: "Contact Us",
                                    subtitle: "Let Us Help You",
                                    iconData: Icons.message,
                                    onTap: () {
                                      customAnimatedPushNavigation(
                                          context, ContactUsScreen());
                                    }),
                              ],
                            ),
                            responsiveSizedBox(
                                context: context, percentageOfHeight: .02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                singleAccountCard(
                                    context: context,
                                    title: "Languages",
                                    subtitle: "Change Language",
                                    iconData: Icons.language,
                                    onTap: () {
                                      customAnimatedPushNavigation(
                                          context, ChangeLanguageScreen());
                                    }),
                                singleAccountCard(
                                    context: context,
                                    title: "Logout",
                                    subtitle: "Tap To Logout",
                                    iconData: Icons.logout,
                                    onTap: () {
                                      showCustomAlertDialog(
                                          context: context,
                                          withTwoButtons: true,
                                          onTapSecondButton: () {
                                            Navigator.of(context).pop();
                                            CacheHelper.clearData(key: "token");
                                            customPushNamedNavigation(
                                                context, LoginScreen());
                                          },
                                          alertTitle: "Logout",
                                          alertSubtitle: translator.translate(
                                              "are you sure you want to logout the app ? "),
                                          secondButtoText:
                                              translator.translate("yes"));
                                    }),
                              ],
                            ),
                            responsiveSizedBox(
                                context: context, percentageOfHeight: .02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                singleAccountCard(
                                    context: context,
                                    title: "T&C",
                                    subtitle: "Privacy Policy",
                                    iconData: Icons.question_answer,
                                    onTap: () {
                                      customAnimatedPushNavigation(
                                          context, FaqsScreen());

                                    }),
                                singleAccountCard(
                                    context: context,
                                    title: "FAQs",
                                    subtitle: "Quick Answers",
                                    iconData: Icons.description,
                                    onTap: () {
                                      customAnimatedPushNavigation(
                                          context, FaqsScreen());

                                    }),
                              ],
                            ),
                            responsiveSizedBox(
                                context: context, percentageOfHeight: .02),
                            responsiveSizedBox(
                                context: context, percentageOfHeight: .1),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
          onTapNotifications: () {
            print("notifications  icon pressed ");
          },
        ),
      ),
    );
  }
}
