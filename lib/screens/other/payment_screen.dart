import 'package:almezyn/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(translator.translate("Payment")),
        elevation: 0,
        backgroundColor: whiteColor,
        textTheme: Theme.of(context).textTheme,
        leading:  IconButton(icon:Icon(Icons.arrow_back_ios ,color: blackColor,), onPressed: (){
          Navigator.of(context).pop();
        }),
        centerTitle: true,
      ),
      body:   SingleChildScrollView(
        child: Column(
          children: [

            responsiveSizedBox(context : context , percentageOfHeight: .05),
            Container(width: width(context)*.9,
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [customDescriptionTextText(
                    percentageOfHeight: .022,
                    text:translator.translate("Choose Payment Method"),
                    textAlign: TextAlign.start,
                    context: context,
                    textColor: blackColor,
                    fontWeight: FontWeight.bold
                ),

                ],),
            ),
            responsiveSizedBox(context : context
                , percentageOfHeight: .02),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Neumorphic(
                  child: Container(alignment: Alignment.center,padding: EdgeInsets.only(right: width(context)*.02 ,
                      left: width(context)*.02),
                      width: width(context)*.9,height: isLandscape(context)
                          ?2* height(context)*.08: height(context)*.08,

                      decoration: BoxDecoration(color: backGroundColor ,
                          borderRadius: BorderRadius.circular(3)),
                      child:Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width(context)*.12,height: isLandscape(context)
                              ?2* height(context)*.06: height(context)*.06,
                            decoration: BoxDecoration(image:
                            DecorationImage(image:

                            AssetImage("assets/images/cash.jpg"),fit: BoxFit.fill),borderRadius: BorderRadius.circular(5)),),
                          SizedBox(width: width(context)*.05),
                          customDescriptionTextText(context: context , textColor:
                          Color(0xffA0AEC0).withOpacity(.8), text:translator.translate("Cash On Delivery"), percentageOfHeight: .023) ,

                        ],)
                  ),
                ),
              ],
            ),
            responsiveSizedBox(context : context , percentageOfHeight: .02),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Neumorphic(
                  child: Container(alignment: Alignment.center,padding: EdgeInsets.only(right: width(context)*.02 ,
                      left: width(context)*.02),
                      width: width(context)*.9,height: isLandscape(context)
                          ?2* height(context)*.08: height(context)*.08,

                      decoration: BoxDecoration(color: backGroundColor ,
                          borderRadius: BorderRadius.circular(3)),
                      child:Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width(context)*.12,height: isLandscape(context)
                              ?2* height(context)*.06: height(context)*.06,
                            decoration: BoxDecoration(image:
                            DecorationImage(image:

                            AssetImage("assets/images/fawry.png"),fit: BoxFit.fill),borderRadius: BorderRadius.circular(5)),),
                          SizedBox(width: width(context)*.05),
                          customDescriptionTextText(context: context , textColor:
                          Color(0xffA0AEC0).withOpacity(.8), text: translator.translate("Fawry") , percentageOfHeight: .023) ,

                        ],)
                  ),
                ),
              ],
            ),responsiveSizedBox(context : context
                , percentageOfHeight: .02),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Neumorphic(
                  child: Container(alignment: Alignment.center,padding: EdgeInsets.only(right: width(context)*.02 ,
                      left: width(context)*.02),
                      width: width(context)*.9,height: isLandscape(context)
                          ?2* height(context)*.08: height(context)*.08,

                      decoration: BoxDecoration(color: backGroundColor ,
                          borderRadius: BorderRadius.circular(3)),
                      child:Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width(context)*.12,height: isLandscape(context)
                              ?2* height(context)*.06: height(context)*.06,
                            decoration: BoxDecoration(image:
                            DecorationImage(image:

                            AssetImage("assets/images/misr.png"),fit: BoxFit.fill),borderRadius: BorderRadius.circular(5)),),
                          SizedBox(width: width(context)*.05),
                          customDescriptionTextText(context: context , textColor:
                          Color(0xffA0AEC0).withOpacity(.8), text: translator.translate("Misr Bank"), percentageOfHeight: .023) ,

                        ],)
                  ),
                ),
              ],
            ),
            responsiveSizedBox(context : context
                , percentageOfHeight: .05),
            CustomButton(text: translator.translate("Confirm"), onTapButton:(){
              showCustomAlertDialog(context: context );
            },)



          ],
        ),
      ),);
  }





  Future showCustomAlertDialog(

      {BuildContext context,
      }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        responsiveSizedBox(context: context , percentageOfHeight: .02) ,
                        Container(  width: width(context)*.9,height: isLandscape(context)
                            ?2* height(context)*.2: height(context)*.2,
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppImages.delivery))),),
                        responsiveSizedBox(context: context , percentageOfHeight: .01),

                       Container(child:  customDescriptionTextText(context: context ,
                          text: translator.translate("your Order Has Been Placed")
                           ,percentageOfHeight: .02, maxLines: 5) ,width: width(context)*.9,)
                      ],
                    ),
                  ),
                )),
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(
                height(context) * .02,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    child:
                    customDescriptionTextText(context: context,      text: translator.translate("Ok") , textColor: greyColor , percentageOfHeight: .02),
                    onTap: () {
                      Navigator.of(context).pop();
                    },

                  ),SizedBox(width: width(context)*.05,),
                  GestureDetector(

                    child:
                    customDescriptionTextText(context: context,     text: translator.translate("Go To My Orders") , textColor: blueColor ,fontWeight: FontWeight.bold, percentageOfHeight: .02),
                    onTap: () {

                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
