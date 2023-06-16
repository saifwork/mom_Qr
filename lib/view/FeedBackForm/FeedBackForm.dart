import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/FloatButton.dart';
import '../../utils/config/size_config.dart';
import '../../viewModel/FeedbackFormViewModel.dart';
import 'Components/AddImageWidget.dart';
import 'Components/AddReviewWidget.dart';
import 'Components/FeedBackQuestionsWidget.dart';
import 'Components/PageHeadingAndSubHeading.dart';
import 'Components/UserProfile.dart';
import 'Components/UserSatisfactionWithEmoji.dart';

class FeedbackForm extends StatelessWidget {
  FeedbackForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedbackFormViewModel>(builder: (context, _vm, child) {
      return Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageHeadingAndSubHeading(),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 2.5,
                ),
                UserProfile(userModel: _vm.userModel,),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 2,
                ),
                AddImage(
                  context: context,
                  vm: _vm,
                ),
                // SizedBox(
                //   height: SizeConfig.blockSizeVertical! * 0.5,
                // ),
                FeedBackQuestionsWidget(),
                // SizedBox(
                //   height: SizeConfig.blockSizeVertical! * 0.5,
                // ),
                UserSatisfactionWithEmoji(),
                // SizedBox(
                //   height: SizeConfig.blockSizeVertical! * 0.5,
                // ),
                AddReview(
                  controller: _vm.reviewController,
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 10,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: FloatButton(
              icon: Icons.reviews_sharp, Press: () {  }, title: 'Add Review',
            ),
          ),
        ],
      );
    });
  }
}
