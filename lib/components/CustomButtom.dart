import 'package:flutter/material.dart';

import '../utils/config/size_config.dart';
import '../utils/style/colors.dart';
import '../utils/style/style.dart';

class CustomButton extends StatelessWidget {
  final bool isFix;
  final Size? size;
  final String text;
  final bool isPrimaryBtn;
  final VoidCallback Press;

  const CustomButton(
      {Key? key,
      this.isPrimaryBtn = true,
      required this.text,
      required this.Press,
      this.size,
      this.isFix = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Press,
      child: Container(
        width: size != null ? size!.width : null,
        height: isFix ? 40 : 50,
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal! * 0.5,
        ),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical! * 0.5,
          horizontal: SizeConfig.blockSizeHorizontal! * 1,
        ),
        decoration: BoxDecoration(
            border:
                isPrimaryBtn ? null : Border.all(color: AppColors.primaryButton),
            borderRadius: BorderRadius.circular(3.0),
            color: isPrimaryBtn ? AppColors.primaryButton : AppColors.primaryBg),
        child: Center(
          child: PrimaryText(
            text: text,
            color: isPrimaryBtn ? AppColors.primaryBg : AppColors.primaryButton,
            size: 17,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
