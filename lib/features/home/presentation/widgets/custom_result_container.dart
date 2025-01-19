import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomResultContainer extends StatelessWidget {
  const CustomResultContainer({super.key, required this.theResult});

  final String theResult;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 65,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(theResult, style: AppTextStyle.textStyle20Blach),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
