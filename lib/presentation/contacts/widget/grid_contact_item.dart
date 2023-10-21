// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:contact_test/app/config/app_colors.dart';

class GridContactItem extends StatelessWidget {
  final String name;
  final Color boderColor;
  const GridContactItem({
    Key? key,
    required this.name,
    required this.boderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: boderColor),
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'contact$name',
            child: CircleAvatar(
              radius: 32.r,
              backgroundColor: AppColors.primary,
              child: Text(
                name[0],
                style: TextStyle(fontSize: 20.sp, color: AppColors.white),
              ),
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
