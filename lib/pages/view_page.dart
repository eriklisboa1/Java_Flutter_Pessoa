import 'package:crud_user_application/controllers/login_controller.dart';
import 'package:crud_user_application/models/cliente_model.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Text('Lista de Clientes'), centerTitle: true),
        body: Container(
          child: FutureBuilder(
            future: LoginController().getClientes(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  // ignore: prefer_const_constructors
                  child: Center(
                    child: const Text('Loading...'),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            snapshot.data![index].imgPerfil.toString()),
                      ),
                      title: Text(snapshot.data![index].nome.toString()),
                      subtitle: Text(snapshot.data![index].email.toString()),
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(snapshot.data![index])));
                      },
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}

class DetailPage extends StatelessWidget {
  final Cliente cliente;
  DetailPage(this.cliente);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cliente.nome.toString()),
      ),
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
                        onChanged: (value) => cliente.nome = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: cliente.nome.toString()),
                      ),
                      TextField(
                        onChanged: (value) => cliente.email = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: cliente.email.toString()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: 250,
                            child: TextField(
                              onChanged: (value) => cliente.cidade = value,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: cliente.cidade.toString()),
                            ),
                          ),
                          SizedBox(
                            width: 75,
                            child: TextField(
                              onChanged: (value) => cliente.estado = value,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: cliente.estado.toString()),
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        onChanged: (value) => cliente.tel = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: cliente.tel.toString()),
                      ),
                      TextField(
                        onChanged: (value) => cliente.imgPerfil = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: cliente.imgPerfil.toString()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  LoginController().putCliente(cliente);
                                },
                                child: const Text('Alterar')),
                          ),
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  LoginController().deleteCliente(cliente);
                                },
                                child: const Text('Deletar')),
                          ),
                        ],
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
