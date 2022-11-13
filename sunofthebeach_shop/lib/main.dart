import 'package:sunofthebeach_shop/route.dart';
import 'package:sunofthebeach_shop/service/auth_service.dart';
import 'package:sunofthebeach_shop/service/database_service.dart';
import 'package:sunofthebeach_shop/service/storage_service.dart';
import 'package:sunofthebeach_shop/themes/style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final messageKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DatabaseService>(create: (_) => DatabaseService()),
        Provider<StorageService>(create: (_) => StorageService()),
        ProxyProvider<DatabaseService, AuthService>(
            update: (_, dbService, __) => AuthService(dbService: dbService))
      ],
      child: MaterialApp(
        scaffoldMessengerKey: messageKey,
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        initialRoute: '/login',
        routes: routes,
      ),
    );
  }
}
