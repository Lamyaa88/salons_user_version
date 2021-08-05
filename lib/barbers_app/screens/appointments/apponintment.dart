import 'package:almezyn/network/cache_helper.dart';
import 'package:almezyn/screens/auth/login_screen.dart';
import 'package:almezyn/screens/more/widgets/single_account_button.dart';
import 'package:almezyn/screens/other/cart_screen.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:almezyn/screens/more/widgets/user_data.dart';
import 'package:almezyn/screens/more/change_language_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class BarberAppointmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomBuildBody(
        withoutDrawerIcon: true,
        withoutCartIcon: true,
        withoutBackIcon: true ,
        isWithoutLogo: true,
        headerText:translator.translate("Appointments"),
        paddingPercentageForBody: 0.0,
        columnOfWidgets: Column(
          children: [
            Container(child: Text("appointments"),)
          ],
        ),
        onTapNotifications: () {
          print("notifications  icon pressed ");
        },
      ),
    );
  }


}

