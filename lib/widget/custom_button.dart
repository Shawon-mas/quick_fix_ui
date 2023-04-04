
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color buttonColor;
  final Color? textColor;
  final IconData? iconData;
  final VoidCallback onPressed;
  const CustomButton({
    super.key, required this.title,  required this.width,  required this.height, required this.buttonColor, this.iconData, required this.onPressed, this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: buttonColor,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(title, style: TextStyle(color:textColor, fontSize: 16.sp),
      ),
    );
  }
}