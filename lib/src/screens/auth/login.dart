import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:vantini_shop/api/repositories/auth_repository.dart';
import 'package:vantini_shop/api/repositories/user_repository.dart';
import 'package:vantini_shop/api/stores/auth_store.dart';
import 'package:vantini_shop/api/stores/user_store.dart';
import 'package:vantini_shop/src/components/bottom_navbar.dart';
import 'package:vantini_shop/src/settings/settings_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthStore authStore = AuthStore(repository: AuthRepository());
  UserStore userStore = UserStore(repository: UserRepository());

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
          child: AnimatedBuilder(
            animation: Listenable.merge([
              authStore.stateToLogin,
              authStore.isLoading,
              authStore.erro,
              userStore.state,
              userStore.isLoading,
              userStore.erro,
            ]),
            builder: (context, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(child: Text('Login', style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center)),
                  const SizedBox(height: 120),

                  //Email
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'E-mail'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe um email.';
                      }
                      if (!EmailValidator.validate(value)) {
                        return 'Email inválido.';
                      }
                      if (authStore.erro.value.isNotEmpty) {
                        return authStore.erro.value;
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 40),

                  //Senha
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(labelText: 'Senha'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Informe uma senha.';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 20, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Esqueceu a senha?', style: Theme.of(context).textTheme.bodySmall),
                            Text(
                              'Registre-se',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Theme.of(context).textTheme.titleLarge!.color,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 0.5,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  authStore.isLoading.value
                      ? const Center(child: CircularProgressIndicator.adaptive())
                      : TextButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await authStore.login(
                                {"email": emailController.text.trim(), "password": passwordController.text.trim()},
                              ).whenComplete(() async {
                                if (authStore.erro.value.isNotEmpty) {
                                  formKey.currentState!.validate();
                                  authStore.erro.value = '';
                                }
                                if (authStore.stateToLogin.value.isNotEmpty) {
                                  await userStore.showUser(authStore.stateToLogin.value).whenComplete(() {
                                    if (userStore.state.value != null) {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyBottomNavbar(user: userStore.state.value!)));
                                    }
                                  });
                                }
                              });
                            }
                          },
                          child: const Text('Entrar'))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
