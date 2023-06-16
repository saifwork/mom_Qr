import 'package:flutter/material.dart';
import '../utils/config/size_config.dart';
import '../utils/style/colors.dart';

class DotIndicator extends StatelessWidget {

  final double rightPosition;
  final int numOfDot;
  final int currentPage;
  const DotIndicator({
    Key? key, required this.numOfDot, required this.currentPage, this.rightPosition = 45,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(bottom: 10,
      right: rightPosition,
      child: Container(
        height: 15,
        decoration: BoxDecoration(
          color: AppColors.primaryText,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
              SizeConfig.blockSizeHorizontal! * 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              numOfDot,
                  (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 2),
                child: Icon(
                  Icons.circle,
                  size: 7.0,
                  color: currentPage == index
                      ? AppColors.primaryBg
                      : AppColors.secondaryText,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
