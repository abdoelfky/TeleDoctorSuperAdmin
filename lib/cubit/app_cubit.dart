import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/modules/login_screen.dart';
import '../shared/component/components.dart';
import '../shared/network/shared_preference.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isObsecured=true;

  void changeVisibility()
  {
    isObsecured=!isObsecured;
    emit(ChangeVisibilityState());
  }

  bool isLast =false;

  void changeOnBoarding(index,boardingLength)
  {
    if(index == boardingLength - 1)
    {
      isLast=true;
      emit(ChangeOnBoardingState());
    }else
    {

      isLast=false;
      emit(ChangeOnBoardingState());
    }
  }


  void submit(context) {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value)
    {
      if (value==true) {
        navigateAndEnd(
          context,
          LoginScreen(),
        );
      }
    });
  }


}
