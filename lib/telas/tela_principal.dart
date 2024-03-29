import 'package:flutter/material.dart';
import 'package:projeto_faculdade/funcionalidades/drawer_navegacao.dart';
import 'package:projeto_faculdade/funcionalidades/formulario.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportar Chamados'),
      ),
      drawer: DrawerNavegacao(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Formulario(),
            ),
          ),
        ],
      ),
    );
  }
}
