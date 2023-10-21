import 'package:contact_test/app/config/app_colors.dart';
import 'package:contact_test/presentation/contacts/contacts_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../router/routes.dart';
import 'contacts/contacts_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        initialRoute: "/",
        getPages: appRoutes(),
        initialBinding: ContactsBindings(),
        home: const ConatactsPage(),
      ),
      builder: (context, child) =>
          NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: child!),
    );
  }
}
