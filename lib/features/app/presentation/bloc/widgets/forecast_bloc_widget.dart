import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_state.dart';
import 'package:weathque/features/app/presentation/pages/loading_page.dart';

class ForecastBlocWidget extends StatelessWidget {
  final Function(GetWeatherForecastState state) onSuccess;

  const ForecastBlocWidget({super.key, required this.onSuccess});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherForecastBloc, GetWeatherForecastState>(
      builder: (_, forecastWeatherState) {
        if(forecastWeatherState is GetWeatherForecastLoading){
          return LoadingPage(color: CustomColors.yellow.color);
        }
        if(forecastWeatherState is GetWeatherForecastDone){
          return onSuccess(forecastWeatherState);
        }
        return const SizedBox();
      },
    );
  }
}