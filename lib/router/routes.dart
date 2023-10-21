import 'package:contact_test/presentation/contacts/add_contacts_page.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../presentation/contacts/contacts_page.dart';
import 'route_page_strings.dart';

appRoutes() => [
      GetPage(
        name: RoutePageString.contacts,
        page: () => const ConatactsPage(),
        middlewares: [MyMiddelware()],
        // transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutePageString.addContact,
        page: () => const AddContactPage(),
        middlewares: [MyMiddelware()],
        // transition: Transition.rightToLeft,
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    debugPrint(page?.name);
    return super.onPageCalled(page);
  }
}
