import 'package:contact_test/app/services/local_data.dart';
import 'package:contact_test/data/models/contacts_model.dart';

import '../../domain/repositories/contacts_repository.dart';

class ContactsRespositoryImpl extends ContactsRepository {
  @override
  Future<ContactModel> addContacts(params) async {
    await Future.delayed(const Duration(seconds: 2));
    contactsData.insert(0, params);
    return ContactModel.fromJson(contactsData[0]);
  }

  @override
  Future<List<ContactModel>> loadContacts() async {
    await Future.delayed(const Duration(seconds: 2));
    List<ContactModel> contacts = List<ContactModel>.from(
        contactsData.map((contact) => ContactModel.fromJson(contact)));
    return contacts;
  }
}
