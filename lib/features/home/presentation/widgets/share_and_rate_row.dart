import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';

class ShareAndRateRow extends StatelessWidget {
  const ShareAndRateRow({
    super.key,
    required this.icon,
    required this.text,
    required this.colorIcon,
  });
  final IconData icon;
  final String text;
  final Color colorIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
          color: colorIcon,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppTextStyle.textStyle15,
        )
      ],
    );
  }
}
