import 'package:almezyn/screens/app_tab/app.dart';
import 'package:almezyn/screens/auth/login_screen.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'network/cache_helper.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging().configure(
    onMessage: (Map<String, dynamic> message) async {
      // HANDLE IT HERE
      print("onMessage: $message");},
    onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
    },
    onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
    },
  );
  await Firebase.initializeApp();
  await translator.init(
    localeDefault: LocalizationDefaultType.asDefined,
    languagesList: <String>['en', 'ar'],
    assetsDirectory: 'assets/langs/',
  );
  DioHelper.init();
  await CacheHelper.init();
  /// get token when saved or not.
   token  = CacheHelper.getStringData(key: 'token');
  print(token);
  runApp(
    LocalizedApp(

      child: Docto(dtoken: token  ,),
    ),
  );



//  SystemChrome.setSystemUIOverlayStyle(
//      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//  runApp(Phoenix(child: Docto(token: token,)));
}

class Docto extends StatelessWidget {
  final String dtoken;

  Docto({
    this.dtoken,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData( accentColor: Colors.white ,fontFamily: "Almarai"),
      debugShowCheckedModeBanner: false ,
      home: token != null  ? AppTab() : LoginScreen(),
      localizationsDelegates:
      translator.delegates, // Android + iOS Delegates
      locale: translator.locale, // Active locale
      supportedLocales: translator.locals(),
    );
  }
}