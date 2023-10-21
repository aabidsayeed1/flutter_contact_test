import 'dart:math';

import 'package:contact_test/app/services/local_data.dart';
import 'package:contact_test/data/models/contacts_model.dart';
import 'package:contact_test/domain/usecases/load_contacts_usecase.dart';
import 'package:contact_test/router/route_page_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_state_handler/page_state_handler.dart';
import '../../domain/usecases/add_contacts_usecase.dart';
import '../Base/base_controller.dart';

class ContactsController extends GetxController with BaseController {
  final AddContactsUseCase _addContactsUseCase;
  final LoadContactsUseCase _loadcontactsUseCase;
  RxList<ContactModel> contacts = <ContactModel>[].obs;
  RxList<ContactModel> searchList = <ContactModel>[].obs;

  ContactsController(this._addContactsUseCase, this._loadcontactsUseCase);
  PageStateController pageStateController = PageStateController();
  TextEditingController? firstNameC;
  TextEditingController? lastNameC;
  TextEditingController? emailC;
  TextEditingController? dobC;
  TextEditingController? searchC;
  String selectedContactId = '';
  var isSearch = false.obs;
  @override
  void onInit() {
    super.onInit();
    loadContactsData();
    firstNameC = TextEditingController();
    lastNameC = TextEditingController();
    emailC = TextEditingController();
    dobC = TextEditingController();
    searchC = TextEditingController();
  }

  void loadContactsData() async {
    try {
      pageStateController.onStateUpdate(PageState.loading);

      await _loadcontactsUseCase.execute().then((value) {
        contacts.assignAll(value);
        searchList.assignAll(value);
        pageStateController.onStateUpdate(PageState.loaded);
      });
    } catch (e) {
      pageStateController.onError(handleError(e, () {}, isBack: false));
    }
  }

  void addOrUpdateContact() {
    //Todo:
    // add or update Contacts  through repository pending
    // for now i'm adding direct into contactsData
    if (selectedContactId.isNotEmpty) {
      contacts.removeWhere((element) => element.id == selectedContactId);
      addContact();
    } else {
      addContact();
    }
  }

  void editContact(int index) {
    selectedContactId = searchList[index].id ?? '';
    firstNameC!.text = searchList[index].firstName ?? '';
    lastNameC!.text = searchList[index].lastName ?? '';
    emailC!.text = searchList[index].email ?? '';
    dobC!.text = searchList[index].dob ?? '';
    Get.toNamed(RoutePageString.addContact);
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
          id: Random.secure().nextInt(100).toString(),
          firstName: firstNameC?.text,
          lastName: lastNameC?.text,
          email: emailC?.text,
          dob: dobC?.text,
        ));
    searchList.assignAll(contacts);
    contactsData.clear();
    for (var e in contacts) {
      contactsData.add({
        "id": e.id ?? '',
        "firstName": e.firstName ?? '',
        "lastName": e.lastName ?? '',
        "email": e.email ?? '',
        "dob": e.dob ?? '',
      });
    }
    Get.back();
    clearAllTextFeild();
    clearSearchData();
  }

  void clearAllTextFeild() {
    selectedContactId = '';
    firstNameC?.clear();
    lastNameC?.clear();
    emailC?.clear();
    dobC?.clear();
  }

  void clearSearchData() {
    searchC?.clear();
    isSearch(false);
    searchList.assignAll(contacts);
  }
}
