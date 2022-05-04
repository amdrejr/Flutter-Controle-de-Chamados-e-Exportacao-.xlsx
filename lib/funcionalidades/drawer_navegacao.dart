import 'package:flutter/material.dart';
import 'package:projeto_faculdade/telas/tela_chamados.dart';
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
          const UserAccountsDrawerHeader(
            accountName: Text('Nome do Usuário'),
            accountEmail: Text('RA: 123456789'),
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
          const ListTile(
            enabled: false,
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            subtitle: Text('Desconectar'),
          )
        ],
      ),
    );
  }
}
