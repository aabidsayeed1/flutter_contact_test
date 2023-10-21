import 'package:contact_test/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridContactItem extends StatelessWidget {
  final String name;

  const GridContactItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGray),
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 32.r,
            backgroundColor: AppColors.primary,
            child: Text(
              name[0],
              style: TextStyle(fontSize: 20.sp, color: AppColors.white),
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            name,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
