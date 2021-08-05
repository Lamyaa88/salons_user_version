//
//import 'package:shareef/custom_widgets/custom_description_text.dart';
//import 'package:shareef/utils/file_export.dart';
//class CustomFilter extends StatefulWidget {
//
//  final FocusNode node ;
//
//  CustomFilter({Key key,this.node}): super(key: key);
//
//  @override
//  _CustomDrawerState createState() => _CustomDrawerState();
//}
//
//class _CustomDrawerState extends State<CustomFilter> {
//
//  @override
//  void initState() {
//    super.initState();
//    widget.node.unfocus();
//  }
//
//  @override
//  void dispose() {
//    widget.node.requestFocus();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Drawer(
//      child: ListView(
//        padding: EdgeInsets.zero,
//        children: <Widget>[
//          singleDrawerItem(context: context),
//        ],
//      ),
//    );
//  }
//
//  singleDrawerItem({BuildContext context  , IconData iconData , String text , Function onTapItem }){
//    return Container(child:
//    Row(children: [
//      Icon(Icons.print),
//      customDescriptionTextText(context: context , text: "coputers ")
//    ],),);
//  }
//}
