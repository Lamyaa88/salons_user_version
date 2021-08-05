import 'dart:async';
import 'package:almezyn/screens/splash/widgets/splash_build_body.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:almezyn/utils/file_export.dart';

class SecondSplashScreen extends StatefulWidget {
  @override
  _SecondSplashScreenState createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {

  void initState() {
    super.initState();
    Timer(
//      duration time
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => App())));
  }
  @override
  Widget build(BuildContext context) {
    return customSplashBody(
        context: context,
        image:AppImages.splash2,
        logoHeight: .45,
        backgroundColor: whiteColor);
  }
}
