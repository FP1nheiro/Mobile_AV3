import 'package:av3/home.page.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
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
                const TextField(
                  decoration: InputDecoration(
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
                const TextField(
                  decoration: InputDecoration(
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
                const TextField(
                  decoration: InputDecoration(
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),                      
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
