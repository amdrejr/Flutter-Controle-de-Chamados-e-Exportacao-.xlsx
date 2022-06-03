import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:projeto_faculdade/funcionalidades/envio_dado.dart';
import 'package:projeto_faculdade/funcionalidades/formulario.dart';
import 'package:projeto_faculdade/funcionalidades/gerar_excel.dart';

class TelaChamados extends StatefulWidget {
  TelaChamados();

  @override
  State<TelaChamados> createState() => _TelaChamadosState();
}

class _TelaChamadosState extends State<TelaChamados> {
  EnvioDado? dadoDeletado;
  int? posicaoDadoDeletado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: DrawerNavegacao(),
      appBar: AppBar(
        title: const Text('Chamados Lançados'),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 2.5),
                for (EnvioDado dado in dados)
                  CartaoLista(
                    dado: dado,
                    deletar: onDelete,
                  ),
              ],
            ),
          ),
          dados.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BotaoTelaChamado(
                        texto: 'Limpar todos Chamados',
                        cor: Colors.red,
                        icone: Icons.delete_forever,
                        acao: () {}),
                    BotaoTelaChamado(
                        texto: 'Gerar Planilha',
                        cor: Colors.green,
                        icone: Icons.receipt_long_rounded,
                        acao: () {
                          GerarExcel().createExcel();
                        }),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  void onDelete(EnvioDado dado) {
    dadoDeletado = dado; // Salvando dado que será deletada
    posicaoDadoDeletado = dados.indexOf(dado); // posicao da dado

    setState(() {
      dados.remove(dado);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Chamado Removido com Sucesso!',
          style: TextStyle(color: Color(0xffFFFFFF)),
        ),
        backgroundColor: Colors.grey[700],
        action: SnackBarAction(
          textColor: Colors.lightBlue[100],
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              dados.insert(posicaoDadoDeletado!, dadoDeletado!);
            });
          },
        ),
      ),
    );
  }
}

class CartaoLista extends StatelessWidget {
  final EnvioDado dado;
  final Function(EnvioDado) deletar;

  CartaoLista({
    required this.dado,
    required this.deletar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
      child: Slidable(
        actionExtentRatio: 0.25,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey.shade600, Colors.blueGrey.shade600]),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                  color: const Color(0xff303030),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  dado.maquina,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('dd/MM/yyyy - HH:mm').format(dado.dateTime),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        'Inicio Parada: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        dado.inicioParada,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        'Volta Parada: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        dado.voltaParada,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        'Motivo: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        dado.motivo,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_back_ios_new,
                size: 40,
              ),
            ],
          ),
        ),
        actionPane: const SlidableDrawerActionPane(),
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            caption: 'Deletar',
            onTap: () {
              deletar(dado);
            },
          )
        ],
      ),
    );
  }
}

class BotaoTelaChamado extends StatelessWidget {
  final String texto;
  final Function() acao;
  final Color cor;
  final IconData icone;

  const BotaoTelaChamado({
    required this.texto,
    required this.cor,
    required this.icone,
    required this.acao,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 30),
      child: ElevatedButton(
        onPressed: acao,
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(cor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icone,
              size: 30,
            ),
            const SizedBox(width: 5),
            Container(
              alignment: Alignment.center,
              width: 101,
              height: 50,
              child: Text(
                texto,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
