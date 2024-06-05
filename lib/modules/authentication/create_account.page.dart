import 'package:av3/dao/local_storage.dao.dart';
import 'package:av3/modules/authentication/authentication.controller.dart';
import 'package:av3/routes/router.scheme.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _showErrorEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            contentTextStyle: TextStyle(fontSize: 17, color: Colors.black),
            title: Text("Possui um erro no seu E-mail."),
            content: Text("Verifique o E-mail digitados."),
          );
        });
  }

  _showErrorPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            contentTextStyle: TextStyle(fontSize: 17, color: Colors.black),
            title: Text("Possui um erro nas sua senha."),
            content: Text("Verifique a Senha digitados, ela deve possui mais que 8 caracteres."),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Criação de Conta"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          width: largura,
          height: altura,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) => const RadialGradient(
                    center: Alignment.center,
                    radius: 0.3,
                    colors: [
                      Colors.green,
                      Colors.purple,
                      Colors.orange,
                    ],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds),
                  child: const Icon(
                    Icons.person_2,
                    size: 100,
                  ),
                ),
                //
                const SizedBox(
                  height: 36,
                ),
                //
                TextField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Nome"),
                    hintText: "Digite seu nome",
                  ),
                ),
                //
                const SizedBox(
                  height: 36,
                ),
                //
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("E-mail"),
                    hintText: "Digite seu e-mail",
                  ),
                ),
                //
                const SizedBox(
                  height: 36,
                ),
                //
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Senha"),
                    hintText: "Digite sua senha",
                  ),
                ),
                //
                const SizedBox(
                  height: 36,
                ),
                //
                ElevatedButton(
                  onPressed: () {
                    AuthenticationController controller =
                        AuthenticationController();
                    bool statusEmail =
                        controller.verifyEmail(_emailController.text);
                    bool statusPassword =
                        controller.verifyPassowrd(_passwordController.text);

                    if (statusEmail) {
                      if (statusPassword) {
                        LocalStorage().createAccount(_nomeController.text,
                            _emailController.text, _passwordController.text);
                        Navigator.pushReplacementNamed(context, RoutersUtil.home);
                      } else {
                        _showErrorPassword();
                      }
                    } else {
                      _showErrorEmail();
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size.fromWidth(
                        largura,
                      ),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(
                      Colors.greenAccent,
                    ),
                  ),
                  child: const Text(
                    "Criar Conta e Entrar",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                //
                const SizedBox(
                  height: 24,
                ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
