import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/config/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? fontSize;
  final double? lineHeight;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const AppText({
    required this.text,
    this.style,
    super.key,
    this.fontSize,
    this.lineHeight,
    this.color,
    this.fontWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style ??
          TextStyle(
              fontFamily:
                  GoogleFonts.poppins(fontWeight: fontWeight ?? FontWeight.w500)
                      .fontFamily,
              fontSize: fontSize ?? 13.sp,
              fontWeight: fontWeight ?? FontWeight.w500,
              color: color ?? AppColors.white,
              height: lineHeight //?? 1.19,
              ),
    );
  }
}
