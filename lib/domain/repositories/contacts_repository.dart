import 'package:contact_test/data/models/contacts_model.dart';

abstract class ContactsRepository {
  Future<ContactModel> addContacts(dynamic params);
  Future<List<ContactModel>> loadContacts();
}
