import 'package:flutter/material.dart';

import '../utils/config/size_config.dart';
import '../utils/style/style.dart';

class StartButtun extends StatelessWidget {
  const StartButtun({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 3),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [
                Colors.redAccent,
                Colors.white54,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryText(
                  text: "START THE REVIEW",
                  fontWeight: FontWeight.w500,
                  size: 16,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.redAccent.shade200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
