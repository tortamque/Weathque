import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weathque/features/app/domain/usecases/get_current_weather.dart';
import 'package:weathque/features/app/domain/usecases/save_city.dart';
import 'package:weathque/features/app/presentation/bloc/add_city/cities_changed_cubit.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_event.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_event.dart';
import 'package:weathque/features/app/presentation/widgets/misc/bottom_sheet/widgets/bottom_sheet_list_view.dart';
import 'package:weathque/features/app/presentation/widgets/misc/bottom_sheet/widgets/bottom_sheet_text_field.dart';
import 'package:weathque/features/app/presentation/widgets/misc/toast/custom_toast.dart';

TextEditingController _cityController = TextEditingController();

showCustomBottomSheet(BuildContext context, Color backgroundColor){
  showModalBottomSheet(
    context: context, 
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    backgroundColor: backgroundColor,
    builder:(context) {
      return _buildBottomSheetMenu(context);
    },
  );
}

Widget _buildBottomSheetMenu(BuildContext context){
  FToast toastManager = FToast();
  toastManager.init(context);

  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height - (kBottomNavigationBarHeight + kToolbarHeight),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BottomSheetTextField(
            controller: _cityController, 
            toastManager: toastManager, 
            onSubmit: _onSubmit
          ),
          
          BottomSheetListView()
        ],
      ),
    ),
  );
}

void _onSubmit(FToast toastManager, BuildContext context) async {
  String cityName = _cityController.text;

  try {
    var response = await locator<GetCurrentWeatherUseCase>()(cityName: cityName);
  } catch (_) {
    _onError(toastManager);
    return; 
  }
  _onSuccess(toastManager, context);
}
  
void _onError(FToast toastManager){
  CustomToast toast = CustomToast(
    isError: true,
    text: "This city cannot be found in the database",
  );
  toastManager.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
  );
}

Future<void> _onSuccess(FToast toastManager, BuildContext context) async {
  int randomIndex = Random().nextInt(CustomColors.values.length);
  Color randomColor = CustomColors.values[randomIndex].color;
  
  bool preservationResult = await locator<SaveCityUseCaseImplementation>()(cityName: _cityController.text, colorValue: randomColor.value.toString());
  late CustomToast toast;

  if(preservationResult){
    toast = CustomToast(
      isError: false,
      text: "City was successfully saved",
    );
  } else{
    toast = CustomToast(
      isError: true,
      text: "This city is already saved in the database",
    );
  }
  toastManager.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
  );
  BlocProvider.of<GetCurrentWeatherBloc>(context).add(const GetCurrentWeather());
  BlocProvider.of<GetWeatherForecastBloc>(context).add(const GetWeatherForecast());
  context.read<CitiesChangedCubit>()();
  _cityController.text = "";
}