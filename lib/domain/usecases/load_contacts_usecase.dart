import 'package:contact_test/data/models/contacts_model.dart';
import 'package:contact_test/domain/repositories/contacts_repository.dart';
import '../../app/core/usecases/no_param_usecase.dart';

class LoadContactsUseCase extends NoParamUseCase<List<ContactModel>> {
  final ContactsRepository _repo;
  LoadContactsUseCase(this._repo);
  @override
  Future<List<ContactModel>> execute() {
    return _repo.loadContacts();
  }
}
