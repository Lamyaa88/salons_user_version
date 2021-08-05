import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/faqs_cubit/faqs_tates.dart';
import 'package:almezyn/app_cubits/faqs_cubit/faqs_cubit.dart';
class FaqsScreen extends StatefulWidget {
  @override
  _FaqsScreenState createState() => _FaqsScreenState();
}
class _FaqsScreenState extends State<FaqsScreen> {

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomBuildBody(

        isWithoutLogo: true,
        withoutBackIcon: true,
        withoutCartIcon: true,
        headerText: "FAQs",
        paddingPercentageForBody: 0.05,
        columnOfWidgets: Column(
          children: [
            BlocProvider(
              create: (BuildContext context) => AllFaqsCubit()..getAllFaqs(),
              child: BlocConsumer<AllFaqsCubit, AllFaqsStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = AllFaqsCubit.get(context);
                  if (state is! AllFaqsLoadingState) {
                    return Container(
                      height: height,
                      child:    Container(height: height*.7,
                        child: ListView.builder(
                            itemCount: cubit.allFaqsModel.data.length,
                            itemBuilder : (context  , index )=>
                                Container(margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          customDescriptionTextText(context:
                                          context
                                              , fontWeight: FontWeight.bold , textColor: blackColor ,textAlign: TextAlign.start,
                                              text:
                                              checkDirection(cubit.allFaqsModel.data[index].questionAr, cubit.allFaqsModel.data[index].questionEn)) ,

                                          customDescriptionTextText(context:
                                          context
                                               ,textColor: blackColor ,textAlign: TextAlign.start,
                                              text:
                                              checkDirection(cubit.allFaqsModel.data[index].answerAr, cubit.allFaqsModel.data[index].answerEn)) ,

                                        ],
                                      )
                                    ],
                                  ),
                                ) ),
                      ),
                    );
                  }
                  return spinKit;
                },
              ),
            ),
          ],
        ),
        onTapNotifications: () {
          print("notifications  icon pressed ");
        },
      ),
    );
  }
}
