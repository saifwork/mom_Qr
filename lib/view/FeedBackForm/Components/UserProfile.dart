import 'package:flutter/material.dart';
import '../../../models/FirebaseUserModel.dart';
import '../../../utils/style/colors.dart';
import '../../../utils/style/style.dart';

class UserProfile extends StatelessWidget {

  final String? imageUrl;
  final FirebaseUserModel? userModel;
  const UserProfile({Key? key, this.imageUrl, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.teal.shade300,
                  border:
                  Border.all(color: Colors.teal.shade300),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                  color: AppColors.primaryBg,
                  border: Border.all(
                      color: AppColors.primaryBg),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0))),
            ),
          ],
        ),
        Positioned(
          top: 22,
          left: 10,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    userModel?.userProfile ?? 'https://i0.wp.com/www.repol.copl.ulaval.ca/wp-content/uploads/2019/01/default-user-icon.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 10,
          child: buildName(),
        ),
      ],
    );
  }

  Widget buildName() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      PrimaryText(text: userModel?.name ?? "Surya Kumar",fontWeight: FontWeight.w500,size: 26,color: AppColors.primaryBg,),
      SizedBox(
        height: 4,
      ),
      PrimaryText(text: userModel?.emailId ?? "surya@gmail.com",fontWeight: FontWeight.normal,size: 15,color: AppColors.primaryText,),
    ],
  );

}
