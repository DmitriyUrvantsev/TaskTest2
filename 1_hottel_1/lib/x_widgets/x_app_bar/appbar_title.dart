// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../x_theme/custom_text_style.dart';
import '../../x_theme/theme.dart';

// ignore: must_be_immutable
class AppbarTitle extends StatelessWidget {
   String text;
  EdgeInsetsGeometry? margin;
  Function? onTap;
   AppbarTitle({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: CustomTextStyles.titleMediumSecondaryContainer.copyWith(
            color: basicTheme().colorScheme.secondaryContainer.withOpacity(1),
          ),
        ),
      ),
    );
  }
}
