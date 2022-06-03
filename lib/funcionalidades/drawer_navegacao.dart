import 'package:flutter/material.dart';
import 'package:projeto_faculdade/telas/tela_chamados.dart';
import 'package:projeto_faculdade/telas/tela_login.dart';
import 'package:projeto_faculdade/telas/tela_principal.dart';

class DrawerNavegacao extends StatelessWidget {
  DrawerNavegacao({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(usuarioLogado),
            accountEmail: const Text('RA: 221962019'),
          ),
          /* ListTile do Drawer, ir para tela de lançar chamados
          ListTile(
            leading: const Icon(Icons.content_paste_sharp),
            title: const Text('Abrir Chamados'),
            subtitle: const Text('Lance novos chamados aqui.'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const TelaPrincipal();
                  },
                ),
              );
            },
          ),
          */
          ListTile(
            leading: const Icon(Icons.receipt_long_sharp),
            title: const Text('Consultar Chamados'),
            subtitle: const Text('Todos chamados lançados.'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaChamados(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            subtitle: const Text('Desconectar'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
