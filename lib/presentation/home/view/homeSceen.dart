import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/data/model/result_model/result_model_response.dart';

import '../../../core/local_storage/exam_result_storage.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/string_manager.dart';
import '../tabs/explore_tab/view/explore_tab_screen.dart';
import '../tabs/profile_tab/profile_screen/view/profile_tab_screen.dart';
import '../tabs/result_tab/result_tab_screen.dart';

class HomeScreen extends StatefulWidget {
    HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentNavIndex=0;
  List<Widget>navWidget=[
    ExploreTabScreen(),
    ResultTabScreen(),
    ProfileTabScreen(userId: '',),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
          currentIndex:currentNavIndex , //eh al item ale t3mlo select
           onTap: (index) {
            setState(() {
              currentNavIndex=index;
            });

          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsManager.explore,
                colorFilter: ColorFilter.mode(
                  ColorManager.greyColor, // Default color for unselected item
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                AssetsManager.explore,
                colorFilter: ColorFilter.mode(
                  ColorManager.primaryColor, // Color for selected item
                  BlendMode.srcIn,
                ),
              ),
              label: StringManager.explore,
            ),

            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsManager.result,
                colorFilter: ColorFilter.mode(
                  ColorManager.greyColor, // Default color for unselected item
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                AssetsManager.result,
                colorFilter: ColorFilter.mode(
                  ColorManager.primaryColor, // Color for selected item
                  BlendMode.srcIn,
                ),
              ),
              label: StringManager.result,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsManager.profile,
                colorFilter: ColorFilter.mode(
                  ColorManager.greyColor, // Default color for unselected item
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                AssetsManager.profile,
                colorFilter: ColorFilter.mode(
                  ColorManager.primaryColor, // Color for selected item
                  BlendMode.srcIn,
                ),
              ),
              label: StringManager.profile,
            ),
          ]),

      //kda al body howa al hytghyr m3 al bottom navigation y3ny tghyer fe al index
      body: navWidget[currentNavIndex],
    );
  }
}
