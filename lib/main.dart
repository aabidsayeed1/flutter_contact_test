import 'package:flutter/material.dart';

import 'app/util/dependency.dart';
import 'presentation/app.dart';
import 'presentation/contacts/contacts_binding.dart';

void main() async {
  DependencyCreator.init();
  ContactsBindings().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
