import 'dart:async';
import 'package:almezyn/screens/splash/second_splash_screen.dart';
import 'package:almezyn/screens/splash/widgets/splash_build_body.dart';
import 'package:almezyn/utils/file_export.dart';

class FirstSplashScreen extends StatefulWidget {
  @override
  _FirstSplashScreenState createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen> {

  void initState() {
    super.initState();
    Timer(
//      duration time
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SecondSplashScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return customSplashBody(
        context: context,
        image: AppIcons.logo2,
        logoHeight:.3,
        backgroundColor: whiteColor);
  }
}
