import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx/screens/base/base_screen.dart';
import 'package:olx/stores/page_store.dart';
import 'package:olx/stores/user_manager_store.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(const MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    '56O0iTbx0invv6mcB9jQeIVIAQt2HeKEF0bIAixS',
    'https://parseapi.back4app.com/',
    clientKey: 'b1HPJ3p5Jfw1wbBkB330W2c8Qzo8SF0VlCJ9wucJ',
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OLX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(elevation: 0),
      ),
      home: BaseScreen(),
    );
  }
}
