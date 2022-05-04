import 'package:flutter/material.dart';
import 'envio_dado.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'listagem_maq_motivos.dart';

class Formulario extends StatefulWidget {
  const Formulario();

  @override
  State<Formulario> createState() => _FormularioState();
}

List<EnvioDado> dados = [];

class _FormularioState extends State<Formulario> {
  String? valorMaq;
  String? valorMotivo;

  final TextEditingController inicioController = TextEditingController();
  final TextEditingController terminoController = TextEditingController();

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.grey.shade600, Colors.blueGrey.shade600]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 34, 16, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10),
                        Container(
                          child: SizedBox(
                            width: 270,
                            child: DropdownButtonFormField<String>(
                              // MAQUINA
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Máquina Selecionada:',
                                prefixIcon: Icon(
                                  Icons.manage_accounts_outlined,
                                  size: 25,
                                ),
                              ),
                              alignment: AlignmentDirectional.center,
                              hint: const Text('Selecione a Máquina: '),
                              dropdownColor: Colors.grey[700],
                              value: valorMaq,
                              items: Lista.listagem.map(buildMenuItem).toList(),
                              onChanged: (value) =>
                                  setState(() => valorMaq = value),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CampoTempo(
                    texto: 'Início Parada',
                    controlador: inicioController,
                  ),
                  CampoTempo(
                    texto: 'Volta Parada',
                    controlador: terminoController,
                  ),
                  Padding(
                    // MOTIVO
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 270,
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Máquina Selecionada:',
                              prefixIcon: Icon(
                                Icons.manage_accounts_outlined,
                                size: 25,
                              ),
                            ),
                            hint: const Text('Selecione o Motivo: '),
                            alignment: AlignmentDirectional.center,
                            value: valorMotivo,
                            items: Lista.motivos.map(buildMenuItem).toList(),
                            onChanged: (value) =>
                                setState(() => valorMotivo = value),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              // BOTÕES
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotaoAp(
                      texto: 'Apagar',
                      acao: () {
                        setState(() {
                          inicioController.clear();
                          terminoController.clear();
                          valorMaq = null; ////////// ATENÇÃO
                          valorMotivo = null;
                        });
                      }),
                  const SizedBox(width: 30),
                  BotaoAp(
                      texto: 'Salvar',
                      acao: () {
                        String dadoInicio = inicioController.text;
                        String dadoTermino = terminoController.text;
                        if (dadoInicio.isNotEmpty &&
                            dadoTermino.isNotEmpty &&
                            valorMaq != null &&
                            valorMotivo != null) {
                          EnvioDado newDado = EnvioDado(
                            maquina: valorMaq!,
                            inicioParada: dadoInicio,
                            voltaParada: dadoTermino,
                            motivo: valorMotivo!,
                            dateTime: DateTime.now(),
                          );
                          dados.add(newDado);
                          inicioController.clear();
                          terminoController.clear();
                          setState(() {
                            valorMaq = null;
                            valorMotivo = null;
                          });
                        }
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CampoTempo extends StatelessWidget {
  final String texto;
  final TextEditingController controlador;
  final _mascara = MaskTextInputFormatter(mask: '@#:!#', filter: {
    "#": RegExp(r'[0-9]'),
    "@": RegExp(r'[0-2]'),
    "!": RegExp(r'[0-5]')
  });
  CampoTempo({required this.texto, required this.controlador});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: TextFormField(
        controller: controlador,
        inputFormatters: [_mascara],
        keyboardType: const TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          label: Text(texto),
          alignLabelWithHint: true,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class BotaoAp extends StatelessWidget {
  final String texto;
  final Function() acao;

  BotaoAp({required this.texto, required this.acao});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: acao,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey[700])),
      child: Container(
        alignment: Alignment.center,
        width: 80,
        height: 50,
        child: Text(
          texto,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}


// dropDown Button com indice https://matheustech.medium.com/flutter-descomplica-dropdownbutton-22841cafdecb