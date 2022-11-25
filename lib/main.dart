import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/modules/login_screen.dart';
import 'package:teledoctor/modules/onBoarding_screen.dart';
import 'package:teledoctor/shared/network/shared_preference.dart';
import 'modules/home_screen.dart';

Future<void> main() async {
  // بيتأكد ان كل حاجه هنا في الميثود خلصت و بعدين يتفح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await CacheHelper.init();
  Widget widget;
  bool onBoarding =false;
  if (await CacheHelper.getData(key: 'onBoarding')!=null&&await CacheHelper.getData(key: 'onBoarding')==true) {
      widget = HomeScreen();
    }
   else {
    CacheHelper.saveData(key: 'onBoarding',value: false);
    onBoarding = await CacheHelper.getData(key: 'onBoarding');
    widget = OnBoardingScreen();
  }


  runApp(MyApp(onBoarding: onBoarding, startWidget: widget,
  ));}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  final bool onBoarding;
  const MyApp({required this.onBoarding, required this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppCubit() ,
      child:MaterialApp(
            theme: ThemeData(
            textTheme: GoogleFonts.lailaTextTheme(

            Theme.of(context).textTheme,
        ),),
          debugShowCheckedModeBanner: false,
          home:startWidget,


    )
    );
  }
}


