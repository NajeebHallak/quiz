import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:quiz/core/routers/app_page_name.dart';
import 'package:quiz/core/utils/constans.dart';
import 'package:quiz/features/login_and_register/domain/entities/crest_or_login_user_entities.dart';
import 'package:quiz/features/splash/presentation/widgets/custom_stach_quiz.dart';

class CustomAnimatedBuilder extends StatefulWidget {
  const CustomAnimatedBuilder({
    super.key,
  });

  @override
  State<CustomAnimatedBuilder> createState() => _CustomAnimatedBuilderState();
}

class _CustomAnimatedBuilderState extends State<CustomAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  Box<CreatOrLoginUserEntites> box =
      Hive.box<CreatOrLoginUserEntites>(Constans.boxCreatAndLoginUser);
  int choose = 0;

  late Animation<double> sizeCircle;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    creatAnimation();
  }

  @override
  void dispose() {
    print('dispose');
    animationController.dispose(); // إيقاف المتحكم عند التخلص من الـ widget

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: sizeCircle,
      builder: (context, child) =>
          CustomStackQuiz(choose: choose, sizeCircle: sizeCircle),
    );
  }

  void creatAnimation() {
    print('start');

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

// تعريف Tween للتحكم في حجم الدائرة
    sizeCircle = Tween<double>(begin: 20, end: 0).animate(animationController);

// إضافة مستمع لحالة الـ animation
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          choose++;
          print('choose is  :   $choose ');

          if (choose == 6) {
            print('Stop Animation');
            animationController
                .stop(); // يمكن إيقاف المتحكم إذا كنت ترغب في ذلك
            context
                .go(box.isEmpty ? AppPageName.loginPage : AppPageName.homePage);
            return;
          }

          // إعادة تشغيل الـ animation في الاتجاه العكسي
          animationController.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        // عند الانتهاء من الاتجاه العكسي، نعيد تشغيله في الاتجاه الأمامي
        animationController.forward();
      }
    });

// بدء الـ animation
    animationController.forward();
  }
}
