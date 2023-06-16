import 'package:flutter/material.dart';

import '../utils/config/size_config.dart';
import '../utils/style/colors.dart';
import '../utils/style/style.dart';
import 'CustomButtom.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBg,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal! * 2),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.ac_unit,
                color: AppColors.primaryButton,
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 1,
              ),
              PrimaryText(
                text: 'MY OPINION MATTER',
                size: 18,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Spacer(),
          CustomButton( isPrimaryBtn: false ,text: 'SIGN IN', Press: (){}),
          CustomButton( text: 'GET STARTED', Press: (){}),
        ],
      ),
    );
  }
}
