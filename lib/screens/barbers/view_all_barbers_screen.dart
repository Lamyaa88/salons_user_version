import 'package:almezyn/app_cubits/users/all_barbers_cubit/all_barbers_cubit.dart';
import 'package:almezyn/screens/barbers/widgets/view_all_barbers_list.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ViewAllBarbersScreen extends StatefulWidget {
  @override
  _ViewAllBarbersScreenState createState() => _ViewAllBarbersScreenState();

}
class _ViewAllBarbersScreenState extends State<ViewAllBarbersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBuildBody(
        onTapBackIcon: (){Navigator.pop(context);},
        paddingPercentageForBody: 0.0,
        columnOfWidgets: Column(
          children: [
            BlocProvider(
                create: (BuildContext context )=> AllBarbersCubit()..getAllBarbers() ,
                 child:viewALLBarbersList(context :context)
              )

          ],
        ),

      ),
    );
  }
}


