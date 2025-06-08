import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:taati_flutter_template/app.dart';
import 'package:taati_flutter_template/data_models/user.dart';
import 'package:taati_flutter_template/storage/local_storage.dart';

late LocalStorage _localStorage;
late User _user;

List<SingleChildWidget> _createProviders() {
  _localStorage = LocalStorage();
  _user = User();

  return [
    Provider<LocalStorage>(create: (_) => _localStorage),
    ChangeNotifierProvider<User>(create: (_) => _user),
  ];
}

Future<void> _initialize() async {
  await _localStorage.initialize();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final providers = _createProviders();

  await _initialize();

  runApp(MultiProvider(providers: providers, child: const App()));
}
