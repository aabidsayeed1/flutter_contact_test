import 'package:contact_test/app/config/app_colors.dart';
import 'package:contact_test/app/config/app_constants.dart';
import 'package:contact_test/presentation/contacts/contacts_controller.dart';
import 'package:contact_test/router/route_page_strings.dart';
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
              onPressed: () {
                controller.isSearch(true);
              },
              icon: Icon(
                Icons.search,
                size: 40.sp,
                color: AppColors.primary,
              )),
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Obx(() => controller.isSearch.value
              ? Container(
                  height: 55.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                  child: TextField(
                    controller: controller.searchC,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      controller.searchC?.text = value;
                      controller.searchList.value = controller.contacts
                          .where((element) => element.firstName!
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.clearSearchData();
                          },
                          icon: const Icon(Icons.close)),
                      labelText: 'Search',
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.lightGray)),
                    ),
                  ),
                )
              : Text(
                  AppStrings.contacts,
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w900),
                )),
          actions: [
            Obx(
              () => controller.deleteIdList.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        controller.showConfirmationDialog(() {
                          controller.delete();
                        });
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 35.sp,
                        color: AppColors.primary,
                      ))
                  : IconButton(
                      onPressed: () {
                        controller.clearAllTextFeild();
                        Get.toNamed(RoutePageString.addContact);
                      },
                      icon: Icon(
                        Icons.add,
                        size: 40.sp,
                        color: AppColors.primary,
                      )),
            ),
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
                itemCount: controller.searchList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      controller.deleteIdList
                          .add(controller.searchList[index].id!);
                    },
                    onTap: () {
                      if (controller.deleteIdList.isNotEmpty) {
                        if (controller.deleteIdList
                            .contains(controller.searchList[index].id!)) {
                          controller.deleteIdList.removeWhere((element) =>
                              element == controller.searchList[index].id!);
                        } else {
                          controller.deleteIdList
                              .add(controller.searchList[index].id!);
                        }
                      } else {
                        controller.editContact(index);
                      }
                    },
                    child: Obx(
                      () => GridContactItem(
                          boderColor: controller.deleteIdList
                                  .contains(controller.searchList[index].id!)
                              ? AppColors.primary
                              : AppColors.lightGray,
                          name: controller.searchList[index].firstName!),
                    ),
                  );
                },
              ),
            )));
  }
}
