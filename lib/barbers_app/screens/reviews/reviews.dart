import 'package:almezyn/network/cache_helper.dart';
import 'package:almezyn/screens/auth/login_screen.dart';
import 'package:almezyn/screens/more/widgets/single_account_button.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:almezyn/screens/more/widgets/user_data.dart';
import 'package:almezyn/screens/more/change_language_screen.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class BarberReviewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomBuildBody(
        isWithoutLogo: true,
        withoutBackIcon: true,
        withoutCartIcon: true ,
        headerText:translator.translate("Reviews"),
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
                                  userData(context: context),
                                ],
                              ),
                            )),
                      ),
                    ];
                  },
                  body: Container(height: height*.8,
                    padding:
                    EdgeInsets.only(right: width * .05, left: width * .05),
                    color: backGroundColor,
                    child: SingleChildScrollView(
                      child: Container()
                    ),
                  )),
            ),
          ],
        ),
        onTapNotifications: () {
          print("notifications  icon pressed ");
        },
      ),
    );
  }


}

