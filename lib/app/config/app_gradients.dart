import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradient {
  static Gradient auth = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.primary, AppColors.lightGray]);
}
