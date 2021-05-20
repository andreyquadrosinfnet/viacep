import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> obterCEP(var CEP) async {
  List listagem = [];
  var URL = Uri.https('viacep.com.br', '/ws/${CEP}/json/');
  var resposta = await http.get(URL);
  print('RESPOSTA OK');
  if(resposta.statusCode == 200) {
    Map<String, dynamic> retorno = json.decode(resposta.body);
    listagem.add(retorno["logradouro"]);
    listagem.add(retorno["localidade"]);
    return listagem[0];
  }else{
    throw 'Erro no consumo da API';
  }
}

