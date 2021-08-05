import 'package:almezyn/utils/file_export.dart';
import 'file:///E:/freelanceProjects/eng_emad_qadry/redesign_project/almezyn/lib/screens/salons/salons_near_you_screen.dart';
import 'package:almezyn/screens/more/saved_Screen.dart';
import 'package:almezyn/screens/other/cart_screen.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class CustomBuildBody extends StatelessWidget {
  final Widget columnOfWidgets;
  final Function onTapDrawer;
  final Function onTapCloseIcon;
  final Function onTapNotifications;
  final Function onTapBackIcon ;
  final bool isCloseIcon;
  final bool closeNotBackIcon ;
  final bool backNotDrawerIcon ;
  final bool withoutCartIcon ;
  final Color backgroundColor ;
   final  bool withoutDrawerIcon ;
   final Function onTapFilter ;
final  double paddingPercentageForHeader;
 final double paddingPercentageForBody;
 final bool isWithoutLogo ;
 final String headerText ;
 final bool withoutBackIcon ;
 final bool withAddIcon ;
 final Function onTapAddIcon ;
 bool isWithFilterIcon ;

  CustomBuildBody({
    this.onTapFilter ,
    this.isWithFilterIcon  : false,
    this.onTapAddIcon,
    this.withAddIcon : false ,
    this.withoutBackIcon  : false ,
    this.backgroundColor : whiteColor ,
    this.headerText : "" ,
    this.isWithoutLogo  : false ,
    this.onTapBackIcon ,
    this.closeNotBackIcon  : false ,
    this.backNotDrawerIcon : false ,
    this.withoutDrawerIcon ,
    this.withoutCartIcon  : false ,
    this.columnOfWidgets,
    this.onTapDrawer,
    this.onTapCloseIcon,
    this.isCloseIcon: true,
    this.onTapNotifications,
    this.paddingPercentageForHeader: .05,
    this.paddingPercentageForBody: .05,

  });
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: backgroundColor ,
      child: Container(
        child: Column(
          children: [
//            ----------------------------------------------------------- header
            Container(
              child: Container(
                height: isLandscape(context) ? 2 * height * .15 : height * .15,
                color: whiteColor,
                padding: EdgeInsets.only(
                    left: width * paddingPercentageForHeader,
                    right: width * paddingPercentageForHeader,
                    top: height * paddingPercentageForHeader),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child:  withoutBackIcon == true ? SizedBox() : Container(

                          child: backNotDrawerIcon == true ?  customHeaderIcon(
                              context: context,
                              iconData: Icons.arrow_back ,
                              onTapHeaderIcon: onTapBackIcon):

                          customHeaderIcon(
                              context: context,
                              iconData: Icons.favorite_outline_outlined ,
                              onTapHeaderIcon: (){

                              }
                          ),
                        ),
                      ),
                      Container(child:
                          isWithoutLogo == true ? Container(child:
                          Center(child: customBoldText(context: context , text: translator.translate(headerText.toUpperCase())),),)

                       : logo(context)),
                      Container(

                        child: withoutCartIcon == true ? SizedBox(width: width*.0,) :  Container(

                          child:withAddIcon == true ? Container(

                            child: Container(
                              child:isWithFilterIcon == true ?
                              customHeaderIcon(
                                  context: context,
                                  iconData:MdiIcons.swapVertical ,
                                  onTapHeaderIcon: onTapFilter ) :   customHeaderIcon(
                                  context: context,
                                  iconData:    Icons.add,
                                  onTapHeaderIcon: onTapAddIcon),
                            ),
                          ):

                          Container(
                            child: customHeaderIcon(
                                context: context,
                                iconData: Icons.shopping_cart_outlined,
                                onTapHeaderIcon: (){customAnimatedPushNavigation(context, CartScreen());})
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
//            -------------------------------------------------------------------------- build body
            Expanded(
                child: Container(
                    padding: EdgeInsets.only(
                        left: width * paddingPercentageForBody,
                        right: width * paddingPercentageForBody),
                    child: Container(
                        child: SingleChildScrollView(child: columnOfWidgets))))
          ],
        ),
      ),
    );
  }

  Widget customHeaderIcon(
      {BuildContext context, Function onTapHeaderIcon, IconData iconData}) {
    return GestureDetector(
      onTap: onTapHeaderIcon,
      child: Icon(
        iconData,
        size: isLandscape(context)
            ? 2 * height(context) * .035
            : height(context) * .035,
        color: blackColor,
      ),
    );
  }

  Widget logo(BuildContext context) {
    return Center(
      child: Image.asset(AppIcons.logo2,
          height: isLandscape(context)
              ? 2 * height(context) * .07
              : height(context) * .07),
    );
  }
}
