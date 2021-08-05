import 'package:almezyn/screens/appointment/home_appointment.dart';
import 'package:almezyn/screens/barbers/home_barbers.dart';
import 'package:almezyn/screens/more/home_more.dart';
import 'package:almezyn/screens/products/home_products.dart';
import 'package:almezyn/screens/salons/home_salons.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class AppTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            ProductsHomeScreen(),
            BarbersHomeScreen(),
            SalonsHomeScreen(),
            AppointmentsHomeScreen(),
            MoreHomeScreen(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
//            labelPadding: const EdgeInsets.only(bottom: 10),
            labelStyle: TextStyle(fontSize: 8.0 ,fontFamily: "Almarai"),
            indicatorColor: Colors.white,
            indicator: BoxDecoration(
//               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15) , bottomRight: Radius.circular(15)),
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 3.0,
                ),
              ),
            ),
            labelColor: theme.primaryColor,
            unselectedLabelColor: Colors.grey.shade500,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.style, size: 20), text: (translator.translate("Products"))),
              Tab(icon: Icon(Icons.content_cut, size: 20), text: (translator.translate("Barbers"))),
              Tab(icon: Icon(Icons.add_location, size: 20), text: (translator.translate("Salons"))),
              Tab(icon: Icon(Icons.calendar_today, size: 20) ,text: (translator.translate("Appointments"))),
              Tab(
                icon: Icon(Icons.person, size: 25),
                  text: (translator.translate("More"))),

            ],
          ),
        ),
      ),
    );
  }
}
