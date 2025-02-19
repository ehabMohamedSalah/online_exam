import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors_manager.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0
      ),

      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorManager.primaryColor,
          primary: ColorManager.primaryColor
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorManager.backgroundBottomNavBar,
        selectedItemColor: ColorManager.primaryColor,
        unselectedItemColor: ColorManager.greyColor,
        showSelectedLabels: true, // Show text label when selected
        showUnselectedLabels: true, // Show text label when unselected
        type: BottomNavigationBarType.fixed, // Ensures all items stay visible
      ),


      textTheme: TextTheme(

        //large text
        labelLarge: TextStyle(
          fontWeight:FontWeight.w500,
          fontSize: 22.sp,
          color: ColorManager.labelLarge,
        ),

        //hint style
        labelMedium:  TextStyle(
          fontWeight:FontWeight.w400,
          fontSize: 16.sp,
          color: ColorManager.hintColor,
        ),

        //label style
        labelSmall: TextStyle(
          fontWeight:FontWeight.w400,
          fontSize: 14.sp,
          color: ColorManager.labelColor,
        ),

        //small text
        bodySmall: TextStyle(
          fontWeight:FontWeight.w400,
          fontSize: 14.sp,
          color: Colors.black,
        ),


        bodyMedium:  TextStyle(
          fontWeight:FontWeight.w600,
          fontSize: 16.sp,
          color: Colors.black,
        ),



      )
  );
}