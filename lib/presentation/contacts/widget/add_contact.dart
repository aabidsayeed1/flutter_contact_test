import 'package:contact_test/presentation/contacts/contacts_controller.dart';
import 'package:contact_test/presentation/widgets/add_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../app/config/app_colors.dart';

class AddContactWidget extends GetView<ContactsController> {
  const AddContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddSpace.vertical(40.h),
          Center(
            child: CircleAvatar(
              radius: 70.r,
              backgroundColor: AppColors.primary,
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.r),
            color: AppColors.lightGray.withOpacity(0.1),
            child: const Text(
              'Main Information',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          AddSpace.vertical(10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: controller.firstNameC,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'First Name',
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lightGray)),
              ),
            ),
          ),
          AddSpace.vertical(10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: controller.lastNameC,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lightGray),
                  )),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.r),
            color: AppColors.lightGray.withOpacity(0.1),
            child: const Text(
              'Sub Information',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          AddSpace.vertical(10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: controller.emailC,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Email',
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lightGray)),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          AddSpace.vertical(10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: controller.dobC,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightGray)),
                  labelText: 'Date of Birth'),
              keyboardType: TextInputType.datetime,
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
