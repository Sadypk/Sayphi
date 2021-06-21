import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class CIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;
  const CIconButton({Key? key,
    required this.onTap,
    required this.icon,
    required this.iconColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LikeButton(
        onTap: (_) async{
          onTap.call();
          return Future.value(true);
        },
        size: 48,
        circleColor: CircleColor(start: iconColor, end: iconColor),
        bubblesColor: BubblesColor(
            dotPrimaryColor: iconColor,
            dotSecondaryColor: iconColor
        ),
        likeBuilder: (_) => Container(
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
          ),
          child: Icon(
              icon,
              color: iconColor
          ),
        )
    );
  }
}