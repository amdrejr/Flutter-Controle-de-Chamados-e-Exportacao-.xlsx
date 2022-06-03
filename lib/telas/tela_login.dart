import 'package:flutter/material.dart';
import 'package:projeto_faculdade/telas/tela_principal.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();

  TextEditingController senhaController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Usuario newUser = Usuario(
        nome: 'André Jr Almeida Mello',
        email: 'andre@teste.com',
        senha: '12345');

    Usuario.cadastrados.add(newUser);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: ,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Realize seu Login',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30), // Espaçamento Vertical 30px

                  // CAMPO USUÁRIO
                  TextField(
                    controller: emailController,
                    style: const TextStyle(),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        label: Text('Digite seu e-mail'),
                        focusColor: Colors.red,
                        labelStyle: const TextStyle(),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.blueGrey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: Colors.blueGrey.shade200),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)))),
                  ),

                  const SizedBox(height: 25), // Espaçamento Vertical 25px

                  // CAMPO USUÁRIO
                  TextField(
                    controller: senhaController,
                    obscureText: true,
                    style: const TextStyle(),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        label: Text('Digite sua senha:'),
                        focusColor: Colors.red,
                        labelStyle: const TextStyle(),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.blueGrey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: Colors.blueGrey.shade200),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)))),
                  ),

                  const SizedBox(height: 25), // Espaçamento Vertical 25px

                  ElevatedButton(
                    // BOTÃO ENTRAR
                    onPressed: () {
                      for (int c = 0; c < Usuario.cadastrados.length; c++) {
                        // VERIFICAR SE USUÁRIO ESTÁ CADASTRADO
                        if (Usuario.cadastrados[c].email ==
                            emailController.text) {
                          if (Usuario.cadastrados[c].senha ==
                              senhaController.text) {
                            setState(() {
                              conectou = '';
                            });
                            usuarioLogado = Usuario.cadastrados[c].nome;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TelaPrincipal(),
                              ),
                            );
                            emailController.clear();
                            senhaController.clear();
                          } else {
                            setState(() {
                              conectou = 'Senha incorreta';
                            });
                          }
                        } else {
                          setState(() {
                            conectou = 'Conta não cadastrada';
                          });
                        }
                      }
                    },

                    child: const Text(
                      'Entrar',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ButtonStyle(
                        //backgroundColor: MaterialStateProperty.all(),
                        ),
                  ),

                  const SizedBox(height: 20), // Espaçamento Vertical 25px
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              ' $conectou',
              style: const TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}

late String usuarioLogado;
String conectou = '';

class Usuario {
  String nome;
  String email;
  String senha;

  Usuario({
    required this.nome,
    required this.email,
    required this.senha,
  });

  static List<Usuario> cadastrados = [];
}
