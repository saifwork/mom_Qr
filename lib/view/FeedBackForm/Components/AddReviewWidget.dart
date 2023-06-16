import 'package:flutter/material.dart';
import '../../../components/CustomTextField.dart';
import '../../../utils/style/colors.dart';
import '../../../utils/style/style.dart';

class AddReview extends StatelessWidget {
  final TextEditingController controller;

  const AddReview({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryText(text: "Add Review",color: AppColors.primaryText,fontWeight: FontWeight.w200,),
            SizedBox(
              height: 3,
            ),
            CustomTextField(
              maxLine: 4,
              hintText: 'Express Your Feeling',
              onChanged: (String value) {},
              controller: controller,
              Validator: (value) {
                // return _userNameValidation(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
