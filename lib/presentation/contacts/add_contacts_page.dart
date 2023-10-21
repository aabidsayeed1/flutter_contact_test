import 'package:contact_test/presentation/contacts/contacts_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../app/config/app_colors.dart';
import 'widget/add_contact.dart';

class AddContactPage extends GetView<ContactsController> {
  const AddContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 100.w,
          leading: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
            ),
          ),
          backgroundColor: AppColors.white,
          actions: [
            TextButton(
              onPressed: () {
                controller.addContact();
              },
              child: Text(
                'Save',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary),
              ),
            ),
          ],
        ),
        body: const AddContactWidget());
  }
}
