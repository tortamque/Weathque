import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weathque/features/app/domain/usecases/get_cities.dart';
import 'package:weathque/features/app/domain/usecases/get_current_weather.dart';
import 'package:weathque/features/app/domain/usecases/save_city.dart';
import 'package:weathque/features/app/presentation/widgets/misc/toast/custom_toast.dart';

TextEditingController _cityController = TextEditingController();

showCustomBottomSheet(BuildContext context){
  showModalBottomSheet(
    context: context, 
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    backgroundColor: CustomColors.yellow.color,
    builder:(context) {
      return _buildBottomSheetMenu(context);
    },
  );
}

Widget _buildBottomSheetMenu(BuildContext context){
  List<String> cities = locator<GetCitiesUseCaseImplementation>()();
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
          TextField(
            controller: _cityController,
            onSubmitted: (value) {
              _onSubmit(toastManager);
            },
            cursorColor: Colors.black,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.black)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.black)
              ),
              hintText: "Enter a city",
              labelText: "City",
              labelStyle: TextStyle(
                color: Colors.black
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  _onSubmit(toastManager);
                },
              )
            ),
          ),
          Expanded(
            child: ListView.builder( //ListView.separated with separatorBuilder
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return Text(cities[index]);
              },
            ),
          )
        ],
      ),
    ),
  );
}

void _onSubmit(FToast toastManager) async {
  String cityName = _cityController.text;

  try {
    var response = await locator<GetCurrentWeatherUseCase>()(cityName: cityName);
  } catch (_) {
    _onError(toastManager);
    return; 
  }
  _onSuccess(toastManager);
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

Future<void> _onSuccess(FToast toastManager) async {
  // Example of cities fetching
  // print();
  // Example of city preservation
  
  bool preservationResult = await locator<SaveCityUseCaseImplementation>()(cityName: _cityController.text);
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
}