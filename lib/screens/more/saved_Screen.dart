

import 'package:almezyn/app_cubits/categories/all_categories_cubit/all_categories_cubit.dart';
import 'package:almezyn/app_cubits/salons/all_salons_cubit/all_salons_cubit.dart';
import 'package:almezyn/app_cubits/saved/all_saved_salons_cubit/all_saved_salons_cubit.dart';
import 'package:almezyn/screens/more/widgets/saved_tap_bar.dart';
import 'package:almezyn/screens/more/widgets/tap_bar_view_for_saved.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SavedScreen extends StatelessWidget {
  static const String routeName = "MyCourseScreen";
  @override
  Widget build(BuildContext context) {
    return
      NetworkIndicator(
        child: MultiBlocProvider(
            providers: [
        BlocProvider<AllSavedSalonsCubit>(
        create: (BuildContext context) => AllSavedSalonsCubit()..getAllSavedSalons(),
    ),
    BlocProvider<AllCategoriesCubit>(
    create: (BuildContext context) =>
    AllCategoriesCubit()..getAllCategories(),
    ),],
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text(translator.translate("Saved")),
                elevation: 0,
                backgroundColor: whiteColor,
                textTheme: Theme.of(context).textTheme,
                leading:  IconButton(icon:Icon(Icons.arrow_back_ios ,color: blackColor,), onPressed: (){
                  Navigator.of(context).pop();
                }),
                centerTitle: true,
                bottom: TabBar(
                  enableFeedback: true ,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Theme.of(context).hintColor.withOpacity(0.4),
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  indicatorColor: Colors.transparent,
                  tabs: [
                    Tab(text:translator.translate("Salons")),
                    Tab(text:translator.translate("Barbers")),
                    Tab(text:translator.translate("Products")),
                  ],
                ),
              ),
              body:tapBarViewForSaved(context: context)
            ),
          ),
        ),
      );

  }
}




