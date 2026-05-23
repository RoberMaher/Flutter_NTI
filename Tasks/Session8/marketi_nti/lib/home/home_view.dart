import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 200,
        leading: Row(
          children: [
            SizedBox(width: 20),
            CircleAvatar(radius: 20),
            SizedBox(width: 10.w),
            Text(
              "Hi, Rober",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/Bell_Icon_UIA.png',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ],
      ),
      body: const Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              decoration: InputDecoration(
                // prefixIcon: Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Image.asset(
                //     'assets/icons/Search_Icons_UIA.png',
                //     width: 20,
                //     height: 20,
                //   ),
                // ),
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
