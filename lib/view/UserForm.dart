import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/CustomButtom.dart';
import '../components/CustomTextField.dart';
import '../utils/config/size_config.dart';
import '../utils/style/colors.dart';
import '../utils/style/style.dart';
import '../viewModel/HomePageViewModel.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);

  final _gmailC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageViewModel>(builder: (context, _vm, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryText(
            text: "Get Started by letting us know about yourself",
            fontWeight: FontWeight.w800,
            size: 25,
            maxLine: 2,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 1.5,
          ),
          PrimaryText(
            text:
                "Tell us a little bit about yourself, so we know who is rating.",
            fontWeight: FontWeight.normal,
            size: 14,
            color: AppColors.secondaryText,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2.5,
          ),
          CustomTextField(
            icon: Icons.person,
            hintText: 'ENTER FIRST NAME',
            onChanged: (String value) {},
            controller: _gmailC,
            Validator: (String) {},
          ),
          CustomTextField(
            icon: Icons.person,
            hintText: 'Enter LAST NAME',
            onChanged: (String value) {},
            controller: _gmailC,
            Validator: (String) {},
          ),
          CustomTextField(
            icon: Icons.mail_outline_rounded,
            hintText: 'ENTER EMAIL ID',
            onChanged: (String value) {},
            controller: _gmailC,
            Validator: (String) {},
          ),
          CustomTextField(
            icon: Icons.password_outlined,
            hintText: 'ENTER PHNO NO',
            onChanged: (String value) {},
            controller: _gmailC,
            Validator: (String) {},
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2.5,
          ),
          Center(
              child: CustomButton(
            text: 'REVIEW ANONYMOUSLY',
            Press: () {
              showAlertDialog(context);
            },
            size: MediaQuery.of(context).size,
          )),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 0.5,
          ),
          Center(
              child: CustomButton(
            isPrimaryBtn: false,
            text: 'NEXT',
            Press: () async {
              _vm.changeIndex();
            },
            size: MediaQuery.of(context).size,
          )),
        ],
      );
    });
  }

  Future showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: PrimaryText(
            text: "Regarding Anonymous Submittion",
            fontWeight: FontWeight.w700,
          ),
          content: PrimaryText(
            text:
                "Suggest you to provide your data \nso that wheneven you gonna join\nwe can reward you...",
            size: 14,
            color: AppColors.secondaryText,
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
