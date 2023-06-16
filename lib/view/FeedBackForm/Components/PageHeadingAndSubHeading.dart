import 'package:flutter/material.dart';
import '../../../utils/config/size_config.dart';
import '../../../utils/style/colors.dart';
import '../../../utils/style/style.dart';

class PageHeadingAndSubHeading extends StatelessWidget {
  const PageHeadingAndSubHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryText(
          text: "Merchant Profile",
          fontWeight: FontWeight.w800,
          size: 25,
          maxLine: 2,
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 1.5,
        ),
        PrimaryText(
          text: "What you think about this Merchant",
          fontWeight: FontWeight.normal,
          size: 14,
          color: AppColors.secondaryText,
        ),
      ],
    );
  }
}
