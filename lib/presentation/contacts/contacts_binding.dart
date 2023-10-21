import 'package:contact_test/data/respositories/weather_repository_impl.dart';
import 'package:contact_test/domain/usecases/load_contacts_usecase.dart';
import 'package:contact_test/presentation/contacts/contacts_controller.dart';
import 'package:get/get.dart';

import '../../domain/usecases/contacts_usecase.dart';

class ContactsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoadContactsUseCase(Get.find<ContactsRespositoryImpl>()));
    Get.lazyPut(() => ContactsUseCase(Get.find<ContactsRespositoryImpl>()));
    Get.lazyPut(() => ContactsController(Get.find(), Get.find()));
  }
}
