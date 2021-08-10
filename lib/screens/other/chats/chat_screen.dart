import 'package:almezyn/network/cache_helper.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SingleChatScreen extends StatefulWidget {
  final barberName;
  final barberEmail;
  final barberNumber;
  final barberId;
  final barberImage;
  SingleChatScreen(
      {this.barberId,
      this.barberName,
      this.barberEmail,
      this.barberNumber,
      this.barberImage});
  @override
  _SingleChatScreenState createState() => _SingleChatScreenState(
      barberId: barberId,
      barberName: barberName,
      barberEmail: barberEmail,
      barberImage: barberImage,
      barberNumber: barberNumber);
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  final barberName;
  final barberEmail;
  final barberNumber;
  final barberId;
  final barberImage;
  _SingleChatScreenState(
      {this.barberId,
      this.barberName,
      this.barberEmail,
      this.barberNumber,
      this.barberImage});
  String _interedmessge = "";
  final _controller = TextEditingController();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String userName = "";
  String userNumber = "";
  String userType = "";
  String userId = "";
  String userImage = "";
  String userEmail = "";

  getUserData() async {
    DioHelper.init();
    await CacheHelper.init();
    setState(() {
      userName = CacheHelper.getStringData(key: 'user_name');
      userNumber = CacheHelper.getStringData(key: 'user_phone');
      userEmail = CacheHelper.getStringData(key: 'user_email');
      userType = CacheHelper.getStringData(key: 'user_type');
      userId = CacheHelper.getStringData(key: 'user_id').toString();
      userImage = CacheHelper.getStringData(key: 'user_image');
    });
  }

  @override
  void initState() {
    getUserData();
  }

//  UserCredential authResult;
  sendMessage() async {
    FocusScope.of(context).unfocus();
    FirebaseFirestore.instance.collection("${"${userId}"}${"${barberId}"}").add({
      "message": _interedmessge,
      "createdAt": Timestamp.now(),
      "currentUserId": "${userId}",
      "receivingUserId": "${barberId}",
    });
    FirebaseFirestore.instance.collection("${"${barberId}"}${"${userId}"}").add({
      "message": _interedmessge,
      "createdAt": Timestamp.now(),
      "currentUserId": "${userId}",
      "receivingUserId": "${barberId}",
    });
    _controller.clear();
    setState(() {
      _interedmessge = "";
    });
  }

  @override
  Widget build(BuildContext context) {
//    chat_background.jpg
    return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            Container(
              height: height(context),
              width: width(context),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/chat_background.jpg"),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.only(
                  right: width(context) * .05, left: width(context) * .05),
              height: height(context),
              width: width(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    responsiveSizedBox(
                        context: context, percentageOfHeight: .05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 30,
                         backgroundImage: NetworkImage("${baseImageUrl}${barberImage}"),
                          backgroundColor: blueColor,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customDescriptionTextText(
                                context: context,
                                text: barberName,
                                textColor: blueColor,
                                fontWeight: FontWeight.bold,
                                percentageOfHeight: .025),
                            customDescriptionTextText(
                                context: context,
                                text: barberEmail,
                                textColor: greyColor)
                          ],
                        ),
                        GestureDetector(
                          child: Icon(Icons.call , color: whiteColor,),
                          onTap: () {},
                        )
                      ],
                    ),
                    responsiveSizedBox(
                        context: context, percentageOfHeight: .02),
                    Container(
                      child: Container(
                        height: height(context) * .7,
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("${"${userId}"}${"${barberId}"}")
                              .orderBy("createdAt", descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            return Container(
                                child: (snapshot.data == null)
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(),
                                        ],
                                      )
                                    : Container(
                                        child: ListView.builder(
                                            itemCount:
                                                snapshot.data.docs.length,
                                            reverse: true,
                                            itemBuilder: (context, index) => singleMessageWidget(
                                                context: context,
                                                message: snapshot.data.docs[index]
                                                    ["message"],
                                                currentName: snapshot.data.docs[index]
                                                    ["currentUserId"],
                                                receivingName: snapshot.data.docs[index]
                                                    ["currentUserId"],
                                                time: snapshot.data.docs[index]["createdAt"]
                                                    .toString(),
                                                isSentMessage: userId ==
                                                        snapshot.data.docs[index]
                                                            ["currentUserId"]
                                                    ? false
                                                    : true)),
                                      ));
                          },
                        ),
                      ),
                    ),
                    responsiveSizedBox(
                        context: context, percentageOfHeight: .02),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: blueColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 250,
                              child: TextField(
                                style: TextStyle(color: whiteColor),
                                controller: _controller,
                                onChanged: (val) {
                                  setState(() {
                                    _interedmessge = val;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: translator
                                      .translate("Type your message here ..."),
                                  hintStyle: TextStyle(
                                      color: whiteColor,
                                      fontSize: isLandscape(context)
                                          ? 2 * height(context) * .018
                                          : height(context) * .018),
                                  filled: true,
                                  fillColor: null,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Colors.white
                                              .withOpacity(.0000001))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Colors.white
                                              .withOpacity(.0000001))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: greenColor)),
                                ),
                              )),
                          GestureDetector(
                              onTap: () {
                                sendMessage();
//                            FocusScope.of(context).unfocus();
//                            FirebaseFirestore.instance.collection("chat").add({"text":_interedmessge ,
//                              "createdAt" : Timestamp.now() , "userName":"" , "userId" :user.uid});
//                            _controller.clear();
                              },
                              child: Container(
                                width: 50,
                                child: Icon(Icons.send,
                                    size: 40,
                                    color: _interedmessge == ""
                                        ? greyColor.withOpacity(.5)
                                        : blueColor),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  singleMessageWidget(
      {BuildContext context,
      bool isSentMessage,
      String message,
      String currentName,
      receivingName,
      String time}) {
    return Column(
      children: [
        responsiveSizedBox(context: context, percentageOfHeight: .01),
        Row(
          mainAxisAlignment: isSentMessage == false
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
//                CircleAvatar(
//                  radius: 20,
//                  child: Icon(
//                    Icons.person,
//                    size: 30,
//                    color: whiteColor
//                  ),
//                  backgroundColor:isSentMessage == false?  blueColor.withOpacity(.9): greyColor.withOpacity(.7)
//                ),
//                SizedBox(width: 10,),
                  Column(
                    children: [
//                    Container(
//                      width:   message.length < 10 ? width(context)*.2 :  width(context)*.6,
//                      child: customDescriptionTextText(context: context,maxLines: 2000,textAlign: TextAlign.start,
//                          textColor:
//                          whiteColor , text: isSentMessage == false  ? receivingName : currentName, fontWeight: FontWeight.bold),),
                      Container(
                        width: message.length < 10
                            ? width(context) * .2
                            : width(context) * .6,
                        child: customDescriptionTextText(
                            context: context,
                            maxLines: 2000,
                            textAlign: TextAlign.start,
                            textColor: whiteColor,
                            text: message),
                      ),
//                    Container(
//                      width:   message.length < 10 ? width(context)*.2 :  width(context)*.6,
//                      child: customDescriptionTextText(context: context,maxLines: 2000,textAlign: TextAlign.start,
//                          textColor:
//                          greyColor , text: time ),),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: isSentMessage == false
                      ? blueColor.withOpacity(.3)
                      : greyColor.withOpacity(.3),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight:
                          Radius.circular(isSentMessage == false ? 10 : 0),
                      bottomLeft:
                          Radius.circular(isSentMessage == false ? 0 : 10))),
            ),
          ],
        ),
      ],
    );
  }

//  boxWidth(n){
//    switch (n) {
//      case  n < 10 :
//        return 10 ;
//        continue nowClosed;
//      nowClosed:
//      case 20 :
//     return 20 ;
//        break;
//    }
//  }

}

width2(int n) {
  if (n > 10) {
    return 10;
  } else if (n > 20) {
    return 20;
  } else if (n > 30) {
    return 30;
  } else if (n > 40) {
    return 40;
  } else if (n > 50) {
    return 50;
  } else if (n > 60) {
    return 60;
  } else if (n > 70) {
    return 70;
  }
  return 80;
}
