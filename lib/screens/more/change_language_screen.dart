import 'package:almezyn/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class ChangeLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomBuildBody(
        onTapBackIcon: (){Navigator.of(context).pop();},
        backNotDrawerIcon: true,
        isWithoutLogo: true,
        headerText: "change language ",
        paddingPercentageForBody: 0.0,
        columnOfWidgets: Column(
children: [
  Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [
    ],
  ),
  SizedBox(height:  isLandscape(context)
      ? 2 * height * .03
      : height* .03,),


  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [

          SizedBox(width: width*.05,),
          SizedBox(width: width*.03,),
          GestureDetector(
              onTap : () {
                translator.setNewLanguage(
                  context,
                  newLanguage: 'ar',
                  remember: true,
                  restart: true,
                );
              },
              child: customDescriptionTextText(context: context ,
                text:  translator.translate('Arabic'),)),
        ],
      ),
      responsiveSizedBox(context: context , percentageOfHeight: .03),
      Row(
        children: [

          SizedBox(width: width*.05,),
          SizedBox(width: width*.03,),
          GestureDetector(
             onTap: () {
                translator.setNewLanguage(
                  context,
                  newLanguage: 'en',
                  remember: true,
                  restart: true,
                );
              },
              child: customDescriptionTextText(context: context ,text:  translator.translate('English'),)),
        ],
      ),
    ],
  ),
],

        ),
      ),
    );
  }


}

