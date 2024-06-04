import 'package:av3/modules/authentication/authentication.controller.dart';
import 'package:av3/modules/authentication/create_account.page.dart';
import 'package:av3/routes/router.scheme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _showErrorMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            contentTextStyle: TextStyle(fontSize: 17, color: Colors.black),
            title: Text("Possui um erro nas suas credenciais digitadas."),
            content: Text("Verifique o E-mail e Senha digitados."),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
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

                    bool status = controller.verfiryLogin(
                        _emailController.text, _passwordController.text);

                    if (status) {
                      Navigator.pushReplacementNamed(context, RoutersUtil.home);
                    } else {
                      _showErrorMessage();
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size.fromWidth(
                        largura,
                      ),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(
                      Colors.blueAccent,
                    ),
                  ),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                //
                const SizedBox(
                  height: 24,
                ),
                //
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size.fromWidth(
                        largura,
                      ),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(
                      Colors.deepOrange,
                    ),
                  ),
                  child: const Text(
                    "Criar Conta",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
