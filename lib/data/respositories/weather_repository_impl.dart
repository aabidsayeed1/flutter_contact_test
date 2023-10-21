import 'package:contact_test/app/services/local_data.dart';
import 'package:contact_test/data/models/contacts_model.dart';

import '../../domain/repositories/contacts_repository.dart';
import '../provider/network/apis/contact_api.dart';

class ContactsRespositoryImpl extends ContactsRepository {
  @override
  Future<ContactModel> contacts(params) async {
    final response = await ContactsAPI.contacts(params).request();
    print(response);
    return ContactModel.fromJson(response);
  }

  @override
  Future<List<ContactModel>> loadContacts() async {
    await Future.delayed(const Duration(seconds: 2));
    List<ContactModel> contacts = List<ContactModel>.from(
        contactsData.map((contact) => ContactModel.fromJson(contact)));
    return contacts;
  }
}
