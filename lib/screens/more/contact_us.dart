import 'package:almezyn/utils/file_export.dart';
class ContactUsScreen extends StatelessWidget {
  TextEditingController _email = TextEditingController();
  TextEditingController _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBuildBody(
        withoutDrawerIcon: true,
        withoutCartIcon: true,
        withoutBackIcon: true ,
        isWithoutLogo: true,
        headerText:"Contact us" ,
        paddingPercentageForBody: 0.0,
        columnOfWidgets: Column(
          children: [
           responsiveSizedBox(context: context , percentageOfHeight: .1) ,
            CustomTextField(hint: "Email",controller: _email,) ,
            responsiveSizedBox(context: context , percentageOfHeight: .02) ,
            CustomTextField(hint: "Message", controller: _message,) ,
            responsiveSizedBox(context: context , percentageOfHeight: .1) ,

            CustomButton(text: "Send", onTapButton: (){
              DioHelper.postData(url: "/contact", token: token,data:
              {"email" : _email.text , "message" : _message.text}).then((value) =>
              {
                print(value.data) ,
                if(value.statusCode ==200){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(value.data["status"] == null ? value.data["error"] :value.data["message"])))

                }
              });
            },) ,
            

          ],
        ),

      ),
    );
  }


}

