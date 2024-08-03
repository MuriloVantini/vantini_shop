import 'package:flutter/material.dart';
import 'package:vantini_shop/src/settings/settings_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
  static const routeName = '/login';
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    emailController.text = 'admin@admin.com';
    passwordController.text = 'password';
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                //Navega através de rotas nomeadas e guarda antiga página na pilha de navegação
                Navigator.pushNamed(context, SettingsView.routeName);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(child: Text('Login', style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center)),
              const SizedBox(height: 120),

              //Email
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),

              const SizedBox(height: 40),

              //Senha
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Senha'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8, top: 5),
                    child: Text('Esqueceu a senha?', style: TextStyle(color: Colors.white38)),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              TextButton.icon(onPressed: () {}, label: const Text('Login'), icon: const Icon(Icons.login))
            ],
          ),
        ),
      ),
    );
  }
}
