import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quick_fix/widget/text_widget.dart';
import 'package:badges/badges.dart' as badges;


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
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
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundImage: NetworkImage('https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                ),
                SizedBox(width: 10.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      textColor: Colors.white.withOpacity(0.5),
                      value: "Good Morning",
                      size: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    TextWidget(
                      textColor: Colors.white,
                      value: "Courtney",
                      size: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                Spacer(),
                badges.Badge(
                  badgeContent: Text('1'),
                  child: Icon(Icons.notifications_none_outlined,color: Colors.white.withOpacity(0.5),),
                ),
                SizedBox(width: 10.w,),
                Icon(Icons.bookmark_remove_outlined,color: Colors.white.withOpacity(0.5),)
              ],
            ),
            SizedBox(height: 10.h,),
            TextField(
              style: GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.white,),
              decoration: InputDecoration(
                hintText: 'Search...',

                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 20.sp
                ),
                prefixIcon: Icon(Icons.search,color: Colors.white),
                suffixIcon: Icon(Icons.filter_list_outlined,color: Colors.blueAccent,),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}