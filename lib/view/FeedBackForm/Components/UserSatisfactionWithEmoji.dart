import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/CustomRating.dart';
import '../../../utils/style/colors.dart';
import '../../../utils/style/style.dart';
import '../../../viewModel/FeedbackFormViewModel.dart';

class UserSatisfactionWithEmoji extends StatelessWidget {
  const UserSatisfactionWithEmoji({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.white,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Consumer<FeedbackFormViewModel>(
            builder: (context, vm, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(text: "Satisfaction",color: AppColors.primaryText,fontWeight: FontWeight.w200,),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Column(
                      children: [
                        PrimaryText(text: "Show Us Your Happiness",color: AppColors.primaryText,fontWeight: FontWeight.w300,),
                        CustomRating(
                          isStar: false,
                          onRatingChanged: (val) {
                            vm.changeEmotion(val);
                          },
                        ),
                        // _ratingBar(1),
                      ],
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
