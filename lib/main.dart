import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weathque/config/theme/app_themes.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/data/data_sources/local/storage.dart';
import 'package:weathque/features/app/presentation/bloc/blocs_provider_builder.dart';
import 'package:weathque/features/app/presentation/bloc/widgets/cities_cubit_widget.dart';
import 'package:weathque/features/app/presentation/bloc/widgets/current_weather_bloc_widget.dart';
import 'package:weathque/features/app/presentation/bloc/widgets/forecast_bloc_widget.dart';
import 'features/app/presentation/functions/build_carousel_slider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  await locator<StorageImplementation>().ensurePrefsInitialized();
  runApp(const WeathqueApp());
}

class WeathqueApp extends StatelessWidget {
  const WeathqueApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocsProviderBuilder(
      context: context,
      child: MaterialApp(
        builder: FToastBuilder(),
        theme: theme(),
        home: CitiesCubitWidget(
          onSuccess: (state) {
            return CurrentWeatherForecastBloc(
              onSuccess: (currentWeatherState) {
                return ForecastBlocWidget(
                  onSuccess: (forecastWeatherState) {
                    return buildCarouselSlider(currentWeatherState, forecastWeatherState);
                  },
                );
              },
            );
          },
        )
      ),
    );
  }
}