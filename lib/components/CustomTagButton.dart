import 'package:flutter/material.dart';
import '../utils/config/size_config.dart';
import '../utils/style/colors.dart';
import '../utils/style/style.dart';

class CustomTagButton extends StatelessWidget {


  final bool isPressed;
  final double? btnWidth;
  final String title;
  final Color color;
  final VoidCallback Press;
  const CustomTagButton({
    Key? key, required this.title, this.color = AppColors.primaryButton, required this.Press, this.btnWidth, this.isPressed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Press,
      child: Container(
        width: btnWidth != null ? btnWidth : double.infinity,
        height: SizeConfig.blockSizeVertical! * 6,
        decoration: BoxDecoration(
          color:  color,
          border: color != AppColors.primaryButton ? Border.all(color: AppColors.secondaryText) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: PrimaryText(
              text: title,
              size: 12,
              fontWeight: FontWeight.normal,
            )),
      ),
    );
  }
}
