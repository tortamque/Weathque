import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_state.dart';
import 'package:weathque/features/app/presentation/pages/loading_page.dart';

class CurrentWeatherForecastBloc extends StatelessWidget {
  final Function(GetCurrentWeatherState state) onSuccess;
  
  const CurrentWeatherForecastBloc({super.key, required this.onSuccess});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCurrentWeatherBloc, GetCurrentWeatherState>(
      builder: (_, currentWeatherState) {
        if(currentWeatherState is GetCurrentWeatherLoading){
          return LoadingPage(color: CustomColors.yellow.color);
        }
        if(currentWeatherState is GetCurrentWeatherDone){
          return onSuccess(currentWeatherState);
        }
        return const SizedBox();
      }
    );
  }
}