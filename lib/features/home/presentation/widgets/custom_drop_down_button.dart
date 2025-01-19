import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';

class CustomDrpoDownButton extends StatelessWidget {
  const CustomDrpoDownButton({
    super.key,
    required this.hint,
    required this.dropDownList,
    required this.onChanged,
    required this.dropDownVlaue,
  });
  final void Function(String?) onChanged;
  final String hint;
  final List<String> dropDownList;
  final String? dropDownVlaue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          padding: const EdgeInsets.symmetric(horizontal: 15),

          menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
          value: dropDownVlaue,
          hint: Text(
            hint,
          ),
          borderRadius: BorderRadius.circular(15),
          dropdownColor: Colors.black,
          // iconDisabledColor: Colors.red,
          // iconEnabledColor: Colors.blue,
          // focusColor: Colors.amber,
          underline: const SizedBox(),
          icon: const Icon(Icons.arrow_drop_down),
          style: AppTextStyle.textStyle15,
          alignment: Alignment.centerLeft,
          isExpanded: true,
          items: dropDownList.map<DropdownMenuItem<String>>(
            (String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: AppTextStyle.textStyle15,
                ),
              );
            },
          ).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
