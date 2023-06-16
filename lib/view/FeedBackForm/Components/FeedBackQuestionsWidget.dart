import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/CustomRating.dart';
import '../../../components/DotIndicator.dart';
import '../../../utils/style/colors.dart';
import '../../../utils/style/style.dart';
import '../../../viewModel/FeedbackFormViewModel.dart';

class FeedBackQuestionsWidget extends StatelessWidget {

  const FeedBackQuestionsWidget({Key? key,}) : super(key: key);

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryText(text: "Feedback",color: AppColors.primaryText,fontWeight: FontWeight.w200,),
                      vm.isEachAnsGiven()
                          ? DotIndicator(
                        numOfDot: vm.que.length,
                        currentPage: vm.currentQue,
                      )
                          : Icon(
                        Icons.check_circle_outline_outlined,
                        color: AppColors.green,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    height: 65,
                    child: PageView.builder(
                      controller: vm.queController,
                      onPageChanged: (index) {
                        vm.queController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 200),
                          // animation duration
                          curve: Curves.easeInOut, // animation curve
                        );
                        vm.currentQue = index;
                      },
                      itemBuilder: (_, index) {
                        return AnimatedBuilder(
                          animation: vm.queController,
                          builder: (context, child) {
                            return child!;
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrimaryText(text: vm.que[index],color: AppColors.primaryText,fontWeight: FontWeight.w300,),
                              CustomRating(
                                onRatingChanged: (val) {
                                  vm.updateStarRating(val);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: vm.que.length,
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
