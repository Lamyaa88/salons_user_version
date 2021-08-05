import 'package:almezyn/utils/file_export.dart';

customSplashBody({BuildContext context  , String image , Color backgroundColor  , double logoHeight}){

  return   Scaffold(
      backgroundColor:backgroundColor,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: isLandscape(context) ? 2* height(context)*logoHeight:height(context)*logoHeight ,
                child: Image.asset(
                  image ,
                ),
              ),
            ],
          )));

}