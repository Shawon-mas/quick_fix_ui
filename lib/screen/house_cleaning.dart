import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widget/custom_button.dart';
import '../widget/text_widget.dart';
class HouseCleaningScreen extends StatelessWidget {
  const HouseCleaningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String text='It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using, making it look like readable English';
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.r),

                                child: Image.network('https://bookdirtbusters.com/wp-content/uploads/2020/10/Cleaning-supplies.png',height: 200.h,width: 200.w,fit: BoxFit.cover,)),
                            InkWell(
                              onTap: (){
                                Get.back();
                              },
                              child: Padding(
                                padding:  EdgeInsets.all(10.0),
                                child: Icon(Icons.arrow_back),
                              ),
                            )

                          ],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(30.r),

                                child: Image.network('https://business.nextdoor.com/hubfs/House%20Cleaner%20Price%20Guide.jpg',height: 100.h,width: 200.w,fit: BoxFit.cover,)),
                            SizedBox(height: 10.w,),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(30.r),

                                child: Image.network('http://bookdirtbusters.com/wp-content/uploads/2020/10/house-cleaning-service.jpeg',height: 100.h,width: 200.w,fit: BoxFit.cover,)),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        textColor: Colors.black87,
                        value: 'House Cleaning',
                        size: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      Icon(Icons.bookmark_remove_outlined,color: Colors.blueAccent)

                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundImage: NetworkImage('https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      ),
                      SizedBox(width: 10.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            textColor: Colors.black87,
                            value: 'Owned by Bessie Cooper',
                            size: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 5.h,),
                          Row(
                            children: [
                              Container(

                                height: 15.h,
                                width: 15.w,
                                decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(100)
                                ),
                                child: Center(child: Icon(Icons.star,size: 13,),),
                              ),
                              SizedBox(width: 5.h,),
                              TextWidget(
                                textColor: Colors.black87,
                                value: '4.8',
                                size: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(width: 5.h,),
                              TextWidget(
                                textColor: Colors.black87,
                                value: '/',
                                size: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(width: 5.h,),
                              TextWidget(
                                textColor: Colors.black87.withOpacity(0.5),
                                value: '(128)',
                                size: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )
                        ],
                      )

                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [

                        Container(
                          height: 30.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Icon(Icons.location_on,size: 25,),),
                        ),
                      SizedBox(width: 10.h,),
                      TextWidget(
                        textColor: Colors.black87.withOpacity(0.7),
                        value: 'Metrotech Center, Brooklyn, NY11201, USA',
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),

                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Container(
                        height: 30.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Icon(Icons.attach_money,size: 25,),),
                      ),
                      SizedBox(width: 10.h,),
                      TextWidget(
                        textColor: Colors.black87,
                        value: '20 USD',
                        size: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: 5.h,),
                      TextWidget(
                        textColor: Colors.black87.withOpacity(0.7),
                        value: '/',
                        size: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: 5.h,),
                      TextWidget(
                        textColor: Colors.black87.withOpacity(0.7),
                        value: 'floor price',
                        size: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),

                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Divider(thickness: 1.r,),
                  SizedBox(height: 20.h,),
                  TextWidget(
                    textColor: Colors.black87,
                    value: 'About Services',
                    size: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 10.h,),
                  TextWidget(
                    textColor: Colors.black87.withOpacity(0.7),
                    value: text,
                    size: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 20.h,),
                  Divider(thickness: 1.r,),


                ],
              ),
            ),

          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                    child: CustomButton(
                      width: 250.w,
                      height: 50.h,
                      title: 'Message',
                      buttonColor: Colors.blueGrey.shade100,
                      textColor: Colors.blueAccent, onPressed: () {  },

                    )
                ),
                SizedBox(width: 10.w,),
                Expanded(
                  flex: 1,
                    child: CustomButton(
                      width: 250.w,
                      height: 50.h,
                      title: 'Book Now',
                      buttonColor: Colors.blueAccent,
                      textColor: Colors.white, onPressed: () {  },

                    )
                ),
              ],
            ),
          ),

    )
    );
  }
}
