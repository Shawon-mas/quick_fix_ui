import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quick_fix/widget/text_widget.dart';
import 'package:badges/badges.dart' as badges;


class CalendarAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 150.h;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _preferredHeight,
      decoration: BoxDecoration(
        color: HexColor('#1C1C26'),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.r),bottomRight: Radius.circular(30.r)),

      ),
      child: Padding(
        padding:  EdgeInsets.all(10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                TextWidget(
                  textColor: Colors.white,
                  value: "Calendar",
                  size: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
                Icon(Icons.menu,color: Colors.white.withOpacity(0.5),)
              ],
            ),

          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}