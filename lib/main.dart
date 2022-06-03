import 'package:flutter/material.dart';
import 'package:projeto_faculdade/telas/tela_login.dart';
import 'telas/tela_principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Color corTexto = const Color(0xFFB3E5FC);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
        theme: ThemeData.dark().copyWith(
          hintColor: corTexto,
          textTheme:
              TextTheme(bodyText2: TextStyle(color: Colors.lightBlue[100])),
        ));
  }
}
