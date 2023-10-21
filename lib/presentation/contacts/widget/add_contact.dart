import 'package:contact_test/presentation/contacts/contacts_controller.dart';
import 'package:contact_test/presentation/widgets/add_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
            child: Hero(
              tag: 'contact${controller.firstNameC!.text}',
              child: CircleAvatar(
                radius: 70.r,
                backgroundColor: AppColors.primary,
                child: Text(
                  controller.selectedContactId.isEmpty
                      ? ''
                      : controller.firstNameC!.text[0].toString(),
                  style: TextStyle(
                      fontSize: 50.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
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
              readOnly: true,
              onTap: () {
                _datePicker(context);
              },
              controller: controller.dobC,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      _datePicker(context);
                    },
                    icon: Icon(
                      Icons.date_range_outlined,
                      color: AppColors.lightGray,
                    ),
                  ),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightGray)),
                  labelText: 'Date of Birth'),
              keyboardType: TextInputType.datetime,
            ),
          ),
          AddSpace.vertical(25.h),
        ],
      ),
    );
  }

  _datePicker(BuildContext context) async {
    final DateTime? selectedDate = await Get.dialog(Theme(
      data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.primary,
            onPrimary: AppColors.white,
            onSurface: AppColors.lightblack,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
            ),
          )),
      child: DatePickerDialog(
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime.now()),
    ));
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");

    controller.dobC!.text = dateFormat.format(selectedDate!);
  }
}
