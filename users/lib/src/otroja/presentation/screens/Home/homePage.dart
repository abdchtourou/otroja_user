import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otroja_users/src/core/utils/extensions.dart';
import 'package:otroja_users/src/otroja/presentation/screens/Home/widgets/appBarOptionalWidget.dart';

import '../../../../core/routing/routes.dart';
import '../../../cubits/announcement/show_announcement_cubit.dart';
import 'widgets/Centerdwidget.dart';
import 'widgets/homePageaApBar.dart';
import 'widgets/homepagebutton.dart';
import 'widgets/newsManager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive sizing
    ScreenUtil.init(context);
    final cubit =context.read<AnnouncementCubit1>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 245, 239),
      appBar: HomePageAppBar(
        mainText: '',
        secText: '',
        optionalWidget: const AppBarOptionalHome(),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.w, left: 0),
                child: Text(
                  'أهم الأحداث',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              NewsManager(list:cubit.list ,),
              Divider(
                indent: 30.w,
                endIndent: 30.w,
                thickness: 2,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                          child: Image.asset(
                              'assets/images/homepagebodyleft.png')),
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: 170.w,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                          child: Image.asset(
                              'assets/images/homepagebodyright.png')),
                    ),
                  ],
                ),
                CenterWidget(),
                Positioned(
                  left: 131.w,
                  top: 20.h,
                  child: HomePageButton(
                    onPressed: () {
                      context.pushNamed(Routes.myReciteScreen);
                    },
                    width: 100.w,
                    height: 90.h,
                    text: 'تسميعاتي',
                  ),
                ),
                Positioned(
                  left: 131.w,
                  top: 225.h,
                  child: HomePageButton(
                    onPressed: () {
                      context.pushNamed(Routes.showStudent);
                    },
                    width: 100.w,
                    height: 90.h,
                    text: 'الأنشطة',
                  ),
                ),
                Positioned(
                  left: 240.w,
                  top: 120.h,
                  child: HomePageButton(
                    width: 100.w,
                    height: 90.h,
                    text: 'الطلاب',
                  ),
                ),
                Positioned(
                  left: 240.w,
                  top: 120.h,
                  child: HomePageButton(
                    width: 100.w,
                    height: 90.h,
                    text: 'حسابي',
                    onPressed: () {
                      context.pushNamed(Routes.studentDetails);
                    },
                  ),
                ),
                Positioned(
                  left: 20.w,
                  top: 120.h,
                  child: HomePageButton(
                    onPressed: () {
                      context.pushNamed(Routes.library);
                    },
                    width: 100.w,
                    height: 90.h,
                    text: 'المكتبة',
                  ),
                ),
                Positioned(
                  left: 230.w,
                  top: 47.h,
                  child: HomePageButton(
                    onPressed: () {
                      // context.pushNamed(Routes.checkStudents);
                    },
                    width: 80.w,
                    height: 75.h,
                    text: 'تفقد الطلاب',
                    textSize: 9.sp,
                  ),
                ),
                Positioned(
                  left: 230.w,
                  top: 210.h,
                  child: HomePageButton(
                    onPressed: (){
                      context.pushNamed(Routes.showExams);
                    },
                    width: 80.w,
                    height: 75.h,
                    text: 'الامتحانات',
                    textSize: 9.sp,
                  ),
                ),
                Positioned(
                  left: 50.w,
                  top: 210.h,
                  child: HomePageButton(
                    onPressed: () {},
                    width: 80.w,
                    height: 75.h,
                    text: 'الصلاحيات',
                    textSize: 9.sp,
                  ),
                ),
                Positioned(
                  left: 50.w,
                  top: 45.h,
                  child: HomePageButton(
                    onPressed: () {
                      //  context.pushNamed(Routes.checkGroups);
                    },
                    width: 80.w,
                    height: 75.h,
                    text: 'تفقد الأساتذة',
                    textSize: 9.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}