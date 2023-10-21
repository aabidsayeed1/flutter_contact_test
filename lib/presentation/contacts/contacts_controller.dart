import 'package:contact_test/data/models/contacts_model.dart';
import 'package:contact_test/domain/usecases/load_contacts_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_state_handler/page_state_handler.dart';
import '../../domain/usecases/contacts_usecase.dart';
import '../Base/base_controller.dart';

class ContactsController extends GetxController with BaseController {
  final ContactsUseCase _contactsUseCase;
  final LoadContactsUseCase _loadcontactsUseCase;
  RxList<ContactModel> contacts = <ContactModel>[].obs;
  ContactsController(this._contactsUseCase, this._loadcontactsUseCase);
  PageStateController pageStateController = PageStateController();
  TextEditingController? firstNameC;
  TextEditingController? lastNameC;
  TextEditingController? emailC;
  TextEditingController? dobC;

  @override
  void onInit() {
    super.onInit();
    loadContactsData();
    firstNameC = TextEditingController();
    lastNameC = TextEditingController();

    emailC = TextEditingController();

    dobC = TextEditingController();
  }

  void loadContactsData() async {
    try {
      pageStateController.onStateUpdate(PageState.loading);

      await _loadcontactsUseCase.execute().then((value) {
        print("weatherData ${value[0].email}");
        contacts.assignAll(value);
        pageStateController.onStateUpdate(PageState.loaded);
      });
    } catch (e) {
      pageStateController.onError(handleError(e, () {}, isBack: false));
    }
  }

  void addContact() {
    if (firstNameC!.text.isEmpty ||
        lastNameC!.text.isEmpty ||
        emailC!.text.isEmpty ||
        dobC!.text.isEmpty) {
      handleError('All Feilds Are Required', () {}, isBack: false);
      return;
    }
    contacts.insert(
        0,
        ContactModel(
          firstName: firstNameC?.text,
          lastName: lastNameC?.text,
          email: emailC?.text,
          dob: dobC?.text,
        ));
    Get.back();
    firstNameC?.clear();
    lastNameC?.clear();
    emailC?.clear();
    dobC?.clear();
  }
}
