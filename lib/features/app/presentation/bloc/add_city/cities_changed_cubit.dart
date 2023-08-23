import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/domain/usecases/get_cities.dart';

class CitiesChangedCubit extends Cubit<List<String>>{
  CitiesChangedCubit() : super(locator<GetCitiesUseCaseImplementation>()());

  void call(){
    print("cubit called ${locator<GetCitiesUseCaseImplementation>()()}");
    emit(locator<GetCitiesUseCaseImplementation>()());
  }
}