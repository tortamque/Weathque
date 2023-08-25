import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/add_city/cities_changed_cubit.dart';
import 'package:weathque/features/app/presentation/widgets/misc/bottom_sheet/widgets/city_card.dart';

class BottomSheetListView extends StatelessWidget {
  const BottomSheetListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CitiesChangedCubit, List<String>>(
        builder: (context, cubitCities) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: cubitCities.length,
              itemBuilder: (context, index) {
                if(cubitCities.length > 1){
                  return CityCard(name: cubitCities[index], index: index, isLast: false);
                } else{
                  return CityCard(name: cubitCities[index], index: index, isLast: true);
                }
              },
            ),
          );
        },
      ),
    );
  }
}