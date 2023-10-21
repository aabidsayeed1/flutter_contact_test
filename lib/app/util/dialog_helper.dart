import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';

class DialogHelper {
  //show error dialog
  static void showErroDialog({
    VoidCallback? hitApi,
    String title = 'Error',
    String? description = 'Something went wrong',
  }) {
    showCupertinoDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white.withOpacity(0.6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.titleLarge!.copyWith(color: Colors.red),
              ),
              Text(
                description ?? '',
                textAlign: TextAlign.center,
                style: Get.textTheme.titleMedium!.copyWith(color: Colors.black),
              ),
              CupertinoButton(
                onPressed: () {
                  // if (hitApi != null) {
                  hitApi!();
                  // }
                  // if (Get.isDialogOpen!)
                  Get.back();
                },
                child: Text(
                  'Okay',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showSuccesDialog({
    VoidCallback? hitApi,
    String title = 'Success',
    String? description = 'Successfully',
    bool isNoButton = false,
  }) {
    showCupertinoDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white.withOpacity(0.6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.titleLarge!
                    .copyWith(color: AppColors.primary),
              ),
              Text(
                description ?? '',
                textAlign: TextAlign.center,
                style: Get.textTheme.titleMedium!.copyWith(color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isNoButton)
                    CupertinoButton(
                      onPressed: () {
                        // if (hitApi != null) {
                        // hitApi!();
                        // } else {
                        Get.back();
                        // }
                        // if (Get.isDialogOpen!)
                      },
                      child: Text(
                        'No',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  CupertinoButton(
                    onPressed: () {
                      if (hitApi != null) {
                        hitApi();
                      } else {
                        Get.back();
                      }
                      // if (Get.isDialogOpen!)
                    },
                    child: Text(
                      'Okay',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show toast
  //show snack bar
  //show loading
  static void showLoading([String? message]) {
    showCupertinoDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) => CupertinoDialogAction(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: AppColors.primary,
              )
              // CupertinoActivityIndicator(),
              // SizedBox(height: 8),
              // Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    Get.back();
  }
}
