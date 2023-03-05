import 'package:crud_user_application/models/cliente_model.dart';
import 'package:flutter/material.dart';
import 'package:crud_user_application/controllers/login_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // TextEditingController txtNome = TextEditingController();
  String? edtNome;
  String? edtEmail;
  String? edtCidade;
  String? edtUf;
  String? edtTel;
  String? edtImgPerfil;

  void save() {
    if ((edtNome != null && edtNome != '') &&
        (edtEmail != null && edtEmail != '') &&
        (edtCidade != null && edtCidade != '') &&
        (edtUf != null && edtUf != '') &&
        (edtTel != null && edtTel != '') &&
        (edtImgPerfil != null && edtImgPerfil != '')) {
      var cliente = new Cliente(
          cidade: edtCidade,
          email: edtEmail,
          estado: edtUf,
          nome: edtNome,
          tel: edtTel,
          imgPerfil: edtImgPerfil);

      LoginController().postCliente(cliente);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Page'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SizedBox(
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      TextField(
                        onChanged: (value) => edtNome = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nome Completo'),
                      ),
                      TextField(
                        onChanged: (value) => edtEmail = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Email: example@gmail.com'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: 250,
                            child: TextField(
                              onChanged: (value) => edtCidade = value,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Cidade'),
                            ),
                          ),
                          SizedBox(
                            width: 75,
                            child: TextField(
                              onChanged: (value) => edtUf = value,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(), hintText: 'UF'),
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        onChanged: (value) => edtTel = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Tel: (XX) XXXXX-XXXX'),
                      ),
                      TextField(
                        onChanged: (value) => edtImgPerfil = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Link img perfil'),
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              save();
                            },
                            child: const Text('Salvar')),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
