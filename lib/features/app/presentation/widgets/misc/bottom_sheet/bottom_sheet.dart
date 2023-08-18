import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';

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
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - (kBottomNavigationBarHeight + kToolbarHeight),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
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
                  onPressed: (){},
                )
              ),
            )
          ],
        ),
      ),
    );
  }