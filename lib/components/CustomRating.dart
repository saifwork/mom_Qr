import 'package:flutter/material.dart';

class CustomRating extends StatefulWidget {
  final bool isStar;
  final int maxRating;
  final Function(int) onRatingChanged;

  CustomRating(
      {this.maxRating = 5, required this.onRatingChanged, this.isStar = true});

  @override
  State<CustomRating> createState() => _CustomRatingState();
}

class _CustomRatingState extends State<CustomRating> {
  int currentRating = 2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.maxRating,
            (i) => GestureDetector(
          onTap: () {
            setState(() {
              currentRating = i;
              widget.onRatingChanged(currentRating);
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            transform: !widget.isStar ? currentRating == i ? Matrix4.diagonal3Values(1.15, 1.15, 1) : Matrix4.identity(): null,
            child: widget.isStar
                ? Icon(
              currentRating >= i ? Icons.star : Icons.star_border,
              color: currentRating >= i ? Colors.yellow : Colors.grey,
              size: 36,
            )
                : Text(
              getEmoji(i),
              style: TextStyle(fontSize: 26),
            ),
            padding: EdgeInsets.symmetric(horizontal: 3.0),
            decoration: !widget.isStar ? BoxDecoration(
              color: currentRating == i ? Colors.yellow : null,
              shape: BoxShape.circle,
              boxShadow: [
                if(currentRating == i )
                  BoxShadow(
                    color: Colors.yellow.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 5), // horizontal, vertical offset
                  ),
              ],
            ) : null,
          ),
        ),
      ),
    );
  }

  String getEmoji(int index) {
    switch (index) {
      case 0:
        return "😠";
      case 1:
        return "😐";
      case 2:
        return "😊";
      case 3:
        return "😄";
      case 4:
        return "😍";
      default:
        return "";
    }
  }
}
