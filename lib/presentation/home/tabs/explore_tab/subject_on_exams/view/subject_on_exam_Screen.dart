import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/presentation/home/tabs/explore_tab/subject_on_exams/view_model/subject_on_exam_cubit.dart';

import '../../../../../../core/resuable-comp/app_bar.dart';
import '../../start_screen/start_exam_screen.dart';
import '../../view/widgets/exam_widget.dart';

class SubjectOnExamsScreen extends StatelessWidget {
  final String subjectID;

  SubjectOnExamsScreen(this.subjectID, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<SubjectOnExamCubit>()..getAllExamsOnSubject(subjectID: subjectID),
      child: Scaffold(
        body: Padding(
          padding: REdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: BlocBuilder<SubjectOnExamCubit, SubjectOnExamState>(
                  builder: (context, state) {
                    if (state is SubjectOnExamLoadingState || state is SubjectOnExamInitial) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is SubjectOnExamErrorState) {
                      return Center(
                        child: Text(state.exp.exception.toString()),
                      );
                    }

                    if (state is SubjectOnExamSuccessState) {
                      final exams = state.response.data?.exams ?? [];

                      return Padding(
                        padding: REdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            AppBarWidget(
                              onpressed: () => Navigator.pop(context),
                              title: exams.isNotEmpty
                                  ? exams[0].title ?? "No Title"
                                  : "No Exams Available",
                            ),
                            Expanded(
                              child: exams.isEmpty
                                  ? const Center(
                                child: Text(
                                  "No Exams Available",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              )
                                  : Card(
                                child: ListView.separated(
                                  padding: REdgeInsets.all(16.0),
                                  itemBuilder: (context, index) {
                                    final item = exams[index];
                                    return InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => StartExamScreen(item)));
                                          print(item.id);
                                        },
                                        child: ExamWidget(item));
                                  },
                                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                                  itemCount: exams.length,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
