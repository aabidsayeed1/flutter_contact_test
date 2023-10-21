import 'package:contact_test/data/models/contacts_model.dart';
import 'package:contact_test/domain/repositories/contacts_repository.dart';

import '../../app/core/usecases/param_usecase.dart';

class ContactsUseCase extends ParamUseCase<ContactModel, dynamic> {
  final ContactsRepository _repo;
  ContactsUseCase(this._repo);
  @override
  Future<ContactModel> execute(params) {
    return _repo.contacts(params);
  }
}
