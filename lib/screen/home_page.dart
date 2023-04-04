import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hexcolor/hexcolor.dart';
import '../utilities/assets.dart';
import '../widget/app_bar.dart';
import '../widget/custom_button.dart';
import '../widget/text_widget.dart';
import 'house_cleaning.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final urlImages=[
        'https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=pexels-binyamin-mellish-186077.jpg&fm=jpg',
        'https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=pexels-binyamin-mellish-186077.jpg&fm=jpg',
        'https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=pexels-binyamin-mellish-186077.jpg&fm=jpg',
  ];
  final popularItems=['All','Cleaning','Repairing','Painting'];
  int activeIndex=0;
  int selectionStatus=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: HexColor('#f7f7f7'),
         //   appBar: MyAppBar(),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            textColor: Colors.black87,
                            value: "Special Offers",
                            size: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                            textColor: Colors.blueAccent.withOpacity(0.7),
                            value: "See all",
                            size: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      buildSlider(),
                      SizedBox(height: 10.h,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          textColor: Colors.black87,
                          value: "Categories",
                          size: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        TextWidget(
                          textColor: Colors.blueAccent.withOpacity(0.7),
                          value: "See all",
                          size: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    buildCategories(),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          textColor: Colors.black87,
                          value: "Most Popular",
                          size: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        TextWidget(
                          textColor: Colors.blueAccent.withOpacity(0.7),
                          value: "See all",
                          size: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    buildPopularSection(),
                  ],
                ),
              ),
            ),

      ),
    );
  }

 Widget buildSlider() {
        return CarouselSlider.builder(

            itemCount: urlImages.length,
            options: CarouselOptions(
                height: 150.h,
               aspectRatio: 16/9,
                viewportFraction: 1,
              onPageChanged: (index,reason){
                  setState(() {
                    activeIndex=index;
                  });
              }
            ),
            itemBuilder: (context,index,realIndex){
              return ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: Stack(
                  children: [
                    Image.network(urlImages[index],fit: BoxFit.cover,width: double.maxFinite,),
                    Positioned.fill(child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                        child: Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding:  EdgeInsets.all(10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Row(
                                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextWidget(
                                              textColor: Colors.white,
                                              value: "30%",
                                              size: 40.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(width: 100.w,),

                                            CustomButton(
                                              width: 120.w,
                                              height: 35.h,
                                              title: 'Explore Offer',
                                              buttonColor: Colors.blueAccent,
                                              textColor: Colors.white, onPressed: () {  },

                                            )
                                          ],
                                        ),
                                        TextWidget(
                                          textColor: Colors.white.withOpacity(0.7),
                                          value: "Today's Special",
                                          size: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        TextWidget(
                                          textColor: Colors.white.withOpacity(0.5),
                                          value: "Get a discount for every order today",
                                          size: 16.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    buildIndicator(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                    )
                    )

                  ],
                ),
              );
            },
            );
  }

 Widget buildIndicator() {
    return AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        axisDirection: Axis.vertical,
        effect: ScrollingDotsEffect(
         //   radius:  4.0,
         //   dotWidth:  24.0,
           dotHeight:  16.0,
            paintStyle:  PaintingStyle.fill,
            strokeWidth:  1.5,
            dotColor:  Colors.grey,
            activeDotColor:  Colors.indigo,
          activeDotScale: 1
        ),
    );
  }

  Widget buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Get.to(()=>HouseCleaningScreen());
            },
              child: buildContainer( title: 'Cleaning',color: Colors.pink.withOpacity(0.3),icon:Assets.cleaning )),
          SizedBox(width: 10.w,),
          buildContainer( title: 'Repairing',color: Colors.blueGrey.shade200,icon:Assets.repairing),
          SizedBox(width: 10.w,),
          buildContainer( title: 'Painting',color: Colors.greenAccent.shade100,icon:Assets.painting),
          SizedBox(width: 10.w,),
          buildContainer( title: 'Cleaning',color: Colors.pink.withOpacity(0.3),icon:Assets.cleaning ),
          SizedBox(width: 10.w,),
          buildContainer( title: 'Repairing',color: Colors.blueGrey.shade200,icon:Assets.repairing),
          SizedBox(width: 10.w,),
          buildContainer( title: 'Painting',color: Colors.greenAccent.shade100,icon:Assets.painting),
        ],

      ),
    );
  }

 Widget buildContainer({required String title,required Color color,required String icon}) {

    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color: color,
      ),

      child: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(icon,height: 40.h,width: 40.w,),
            TextWidget(
              textColor: Colors.black87,
              value: title,
              size: 14.sp,
              fontWeight: FontWeight.bold,
            ),

          ],
        ),

      ),
    );

  }

 Widget buildPopularSection() {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
         scrollDirection: Axis.horizontal,
          itemCount:popularItems.length,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                setState(() {
                  selectionStatus=index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: selectionStatus==index? Colors.blueAccent:Colors.black87,width: 1.w),
                    borderRadius: BorderRadius.circular(10.r),
                    color:selectionStatus==index? Colors.blueAccent: Colors.white,
                  ),

                  child: Center(
                    child: TextWidget(
                      textColor: selectionStatus==index? Colors.white: Colors.black87,
                      value: popularItems[index],
                      size: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
