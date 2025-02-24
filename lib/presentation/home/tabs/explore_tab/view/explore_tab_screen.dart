import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/app_theme.dart';
import 'package:online_exam/core/utils/string_manager.dart';
import 'package:online_exam/presentation/home/tabs/explore_tab/view/widgets/search_text_form_field.dart';

import '../../../../../core/di/di.dart';
import '../view_model/explore_view_model_cubit.dart';

class ExploreTabScreen extends StatefulWidget {
  @override
  _ExploreTabScreenState createState() => _ExploreTabScreenState();
}

class _ExploreTabScreenState extends State<ExploreTabScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          getIt<ExploreViewModelCubit>()..getAllExams(),
      child: Scaffold(
        body: Padding(
          padding: REdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30.sp),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  StringManager.survey,
                  style: AppTheme.lightTheme.textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 16.sp),
              SearchBarWidget(
                key: Key("search_bar"),
                controller: searchController,
                onChanged: (value) {
                  print("Search Query: $value");
                },
              ),
              SizedBox(height: 30.sp),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  StringManager.browseBySubject,
                  style: AppTheme.lightTheme.textTheme.displayLarge,
                ),
              ),
              Expanded(
                child:
                    BlocBuilder<ExploreViewModelCubit, ExploreViewModelState>(
                        builder: (context, state) {
                  switch (state.runtimeType) {
                    case ExploreLoadingState:
                    case ExploreViewModelInitial:
                      return Center(child: CircularProgressIndicator());

                    case ExploreErrorState:
                      final errorState = state as ExploreErrorState;
                      return Center(
                          child: Text(errorState.exp.exception.toString()));

                    case ExploreSuccessState:
                      final successState = state as ExploreSuccessState;
                      return Card(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            final item =
                                successState.response.data?.subjects?[index];
                            return Card(
                              elevation: 2, // Shadow depth
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: Image.network(
                                  item?.icon ?? "",
                                  width: 40,
                                  height: 40,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.broken_image,
                                          color: Colors.grey),
                                ),
                                title: Text(item?.name ?? ""),
                                onTap: () {
                                  print("${item?.name} clicked");
                                },
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                          itemCount:
                              successState.response.data?.subjects?.length ?? 0,
                        ),
                      );

                    default:
                      return SizedBox();
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
