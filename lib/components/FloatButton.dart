import 'package:flutter/material.dart';
import '../utils/config/size_config.dart';
import '../utils/style/colors.dart';
import '../utils/style/style.dart';

class FloatButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final VoidCallback Press;

  FloatButton(
      {required this.icon,
      required this.Press,
      this.color = AppColors.primaryButton,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Press,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal! * 2,
            vertical: SizeConfig.blockSizeVertical! * 1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.teal,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.primaryText,
            ),
            SizedBox(width: SizeConfig.blockSizeHorizontal! * 0.5,),
            PrimaryText(
              text: title,
              color: AppColors.primaryBg,
              fontWeight: FontWeight.w300,
            ),
          ],
        ),
      ),
    );
  }
}
