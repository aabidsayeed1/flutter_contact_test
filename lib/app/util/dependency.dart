import 'package:contact_test/data/respositories/weather_repository_impl.dart';
import 'package:get/get.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(
      () => ContactsRespositoryImpl(),
    );
  }
}
