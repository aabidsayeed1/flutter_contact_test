import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../app/config/app_colors.dart';
import '../../app/util/dialog_helper.dart';
import '../../data/provider/network/api_provider.dart';

mixin class BaseController {
  String handleError(error, VoidCallback? hitApi, {bool isBack = true}) {
    String errorMessage = 'Something Went Wrong';
    if (isBack) {
      hideLoading();
    }

    if (error is BadRequestException) {
      var message = error.details;
      errorMessage = message;
      DialogHelper.showErroDialog(description: message, hitApi: hitApi);
    } else if (error is FetchDataException) {
      var message = error.details;
      errorMessage = message;
      DialogHelper.showErroDialog(description: message, hitApi: hitApi);
    } else if (error is UnauthorisedException) {
      var message = error.details;
      errorMessage = message;
      DialogHelper.showErroDialog(description: message, hitApi: hitApi);
    } else if (error is NoInternetException) {
      var message = error.details;
      errorMessage = message;
      DialogHelper.showErroDialog(description: message, hitApi: hitApi);
    } else if (error is FetchDataException) {
      errorMessage = 'Oops! It took longer to respond.';
      DialogHelper.showErroDialog(
          description: 'Oops! It took longer to respond.', hitApi: hitApi);
    } else {
      errorMessage = ErrorWidget(error).message;

      DialogHelper.showErroDialog(description: errorMessage, hitApi: hitApi);
    }
    return errorMessage;
  }

  showSuccessDialog(VoidCallback? hitApi,
      {String title = 'Success',
      String? description = 'Successfully',
      isNoButton = false}) {
    DialogHelper.showSuccesDialog(
        title: title,
        description: description,
        hitApi: hitApi,
        isNoButton: isNoButton);
  }

  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }

  showConfirmationDialog(VoidCallback onDelete) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete?'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                onDelete();
              },
              child: Text(
                'Delete',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        );
      },
    );
  }

  void showToast(String title, message,
      {Color? bgColor, textColor, int? time}) {
    Future.delayed(Duration(milliseconds: time ?? 300), () {
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(30.r),
        backgroundColor: bgColor ?? AppColors.primary,
        colorText: textColor ?? AppColors.white,
      );
    });
  }
}
