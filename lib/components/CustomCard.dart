import 'package:flutter/material.dart';

import '../utils/config/size_config.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final Widget subWidget;

  const CustomCard({Key? key, required this.title, required this.subWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.white,
      child: Container(
        width: SizeConfig.screenWidth,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 5,
              ),
              subWidget,
            ],
          ),
        ),
      ),
    );
  }
}
