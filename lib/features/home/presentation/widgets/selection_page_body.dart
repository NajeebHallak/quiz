import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:quiz/core/routers/app_page_name.dart';
import 'package:quiz/core/utils/constans.dart';
import 'package:quiz/core/widget/custom_elevated_button.dart';
import 'package:quiz/features/home/domain/entities/quiz_entities.dart';
import 'package:quiz/features/home/presentation/cubit/questions_cubit/questions_cubit.dart';
import 'package:quiz/features/home/presentation/widgets/custom_drop_down_button.dart';
import 'package:quiz/features/login_and_register/presentation/widgets/titile_all_the_my_app.dart';

class SelectionPageBody extends StatefulWidget {
  const SelectionPageBody({super.key});

  @override
  State<SelectionPageBody> createState() => _SelectionPageBodyState();
}

class _SelectionPageBodyState extends State<SelectionPageBody> {
  Box<QuizEntities> box = Hive.box(Constans.boxQuizEntitie);
  Box<int> boxResult = Hive.box(Constans.boxResultsNumber);

  String? dropDownVlaueCategory;

  int dropDownIndexCategory = 9;

  String? dropDownVlaueDifficulty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          const TitleAllTheMyApp(title: 'Choose Your favorite!!'),
          const Spacer(flex: 3),
          CustomDrpoDownButton(
            hint: 'Select Category',
            dropDownList: Constans.dropDownListCategory,
            dropDownVlaue: dropDownVlaueCategory,
            onChanged: (value) {
              setState(
                () {
                  dropDownVlaueCategory = value;
                },
              );
            },
          ),
          const Spacer(),
          CustomDrpoDownButton(
            hint: 'Select Difficulty',
            dropDownList: Constans.dropDownListDifficulty,
            dropDownVlaue: dropDownVlaueDifficulty,
            onChanged: (value) {
              setState(
                () {
                  dropDownVlaueDifficulty = value;
                  dropDownIndexCategory = (Constans.dropDownListCategory
                          .indexOf(dropDownVlaueCategory ?? 'Sports') +
                      9);
                },
              );
            },
          ),
          const Spacer(flex: 2),
          CustomElevatedButton(
            typeTheButton: 'Start Paly',
            onPressed: () {
              onPressedStartPlay(context);
            },
          ),
          const Spacer(flex: 7),
        ],
      ),
    );
  }

  void onPressedStartPlay(BuildContext context) {
    BlocProvider.of<QuestionsCubit>(context).yourLevel = 0;
    box.clear();
    boxResult.clear();

    BlocProvider.of<QuestionsCubit>(context).fetchQuestions(
      selectCategory: dropDownIndexCategory,
      selectDifficulty: dropDownVlaueDifficulty ?? 'easy',
      type: 'multiple',
    );
    GoRouter.of(context).push(AppPageName.gameLevelPage);
  }
}
