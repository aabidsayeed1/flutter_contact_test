import 'package:contact_test/app/config/app_colors.dart';
import 'package:contact_test/app/config/app_constants.dart';
import 'package:contact_test/presentation/contacts/contacts_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_state_handler/page_state_handler.dart';

import 'widget/grid_contact_item.dart';

class ConatactsPage extends GetView<ContactsController> {
  const ConatactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 40.sp,
                color: AppColors.primary,
              )),
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Text(
            AppStrings.contacts,
            style: TextStyle(
                fontSize: 24.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w900),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  size: 40.sp,
                  color: AppColors.primary,
                )),
          ],
        ),
        body: PageStateHandler(
            isRefreshOnTop: false,
            rColor: AppColors.primary,
            loading: CircularProgressIndicator(
              color: AppColors.primary,
            ),
            controller: controller.pageStateController,
            retry: () => Future(
                  () => controller.loadContactsData(),
                ),
            child: Obx(
              () => GridView.builder(
                padding: EdgeInsets.all(20.r),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: controller.contacts.length,
                itemBuilder: (context, index) {
                  return GridContactItem(
                      name: controller.contacts[index].firstName!);
                },
              ),
            )));
  }
}
