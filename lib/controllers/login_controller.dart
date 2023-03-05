import 'dart:convert';
import 'dart:html';

import 'package:crud_user_application/models/cliente_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginController {
  String url = 'localhost:8080';

  Future<List<Cliente>> getClientes() async {
    var endereco = Uri.http(url, '/api/clientes');
    var response = await http.get(endereco);
    List<Cliente> listaClientes = [];

    if (response.statusCode == 200) {
      var listResponse =
          convert.jsonDecode(response.body); //as Map<String, dynamic>;

      var jsonResponse =
          Map<dynamic, dynamic>.fromIterable(listResponse as List);

      jsonResponse.forEach((key, value) {
        listaClientes.add(Cliente.fromJson(value));
      });
      return listaClientes;
    }
    return <Cliente>[];
  }

  Future<void> postCliente(Cliente cliente) async {
    var endereco = Uri.http(url, '/api/cliente');
    Map<String, String> headersBody = {"Content-type": "application/json"};
    var jsonBody = {
      "nome": cliente.nome,
      "cidade": cliente.cidade,
      "estado": cliente.estado,
      "email": cliente.email,
      "tel": cliente.tel,
      "imgPerfil": cliente.imgPerfil
    };

    var response = await http.post(endereco,
        headers: headersBody, body: jsonEncode(jsonBody));

    if (response.statusCode == 201) print('Cadastro Executado Com Sucesso');
  }

  Future<void> putCliente(Cliente cliente) async {
    var endereco = Uri.http(url, '/api/cliente');
    Map<String, String> headersBody = {"Content-type": "application/json"};
    var jsonBody = {
      "id": cliente.id,
      "nome": cliente.nome,
      "cidade": cliente.cidade,
      "estado": cliente.estado,
      "email": cliente.email,
      "tel": cliente.tel,
      "imgPerfil": cliente.imgPerfil
    };

    var response = await http.put(endereco,
        headers: headersBody, body: jsonEncode(jsonBody));

    if (response.statusCode == 201) print('Alteração Executada Com Sucesso');
  }

  Future<void> deleteCliente(Cliente cliente) async {
    var endereco = Uri.http(url, '/api/cliente');
    Map<String, String> headersBody = {"Content-type": "application/json"};
    var jsonBody = {
      "id": cliente.id,
      "nome": cliente.nome,
      "cidade": cliente.cidade,
      "estado": cliente.estado,
      "email": cliente.email,
      "tel": cliente.tel,
      "imgPerfil": cliente.imgPerfil
    };

    var response = await http.delete(endereco,
        headers: headersBody, body: jsonEncode(jsonBody));

    if (response.statusCode == 200) print('Cliente Deletado Com Sucesso');
  }
}
