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
  int RadioValor = 1;

  final TextEditingController inicioController = TextEditingController();
  final TextEditingController terminoController = TextEditingController();

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      // Remover brilho do Scroll
      // Link para entender https://stackoverflow.com/questions/51119795/how-to-remove-scroll-glow
      behavior: RemoverBriloScroll(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.grey.shade600, Colors.blueGrey.shade600]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 30, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 10),
                          SizedBox(
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
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 270,
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Motivo do Chamado:',
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
                    radioBuild(),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
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
                          radioDado: radioConvert(),
                        );
                        dados.add(newDado);
                        inicioController.clear();
                        terminoController.clear();
                        setState(
                          () {
                            valorMaq = null;
                            valorMotivo = null;
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget radioBuild() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Text(
            'Natureza da Operação:',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 1,
              groupValue: RadioValor,
              onChanged: (int? change) {
                setState(
                  () {
                    RadioValor = change!;
                    print(RadioValor);
                  },
                );
              },
            ),
            const Text('Manutenção', style: TextStyle(color: Colors.white)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 2,
              groupValue: RadioValor,
              onChanged: (int? change) {
                setState(
                  () {
                    RadioValor = change!;
                    print(RadioValor);
                  },
                );
              },
            ),
            const Text('Operacional', style: TextStyle(color: Colors.white)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 3,
              groupValue: RadioValor,
              onChanged: (int? change) {
                setState(
                  () {
                    RadioValor = change!;
                    print(RadioValor);
                  },
                );
              },
            ),
            const Text('Sistêmico', style: TextStyle(color: Colors.white)),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  String radioConvert() {
    switch (RadioValor) {
      case 1:
        return 'Manutenção';
      case 2:
        return 'Operacional';
      case 3:
        return 'Sistêmico';
      default:
        return '';
    }
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
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: TextFormField(
        focusNode:
            FocusNode(canRequestFocus: false, descendantsAreFocusable: false),
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

  void teste() {
    print('teste');
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

class RemoverBriloScroll extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}


// dropDown Button com indice https://matheustech.medium.com/flutter-descomplica-dropdownbutton-22841cafdecb