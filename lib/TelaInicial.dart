import 'package:app_viacep/TelaResultado.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  TextEditingController _controladorCEP = TextEditingController();

  String resultado;
  retonarCEP() async{
    String result;
    result = await obterCEP(_controladorCEP.text);
    setState(() {
      resultado = result;
    });
    print(resultado);
  }


  @override
  Widget build(BuildContext context) {
    retonarCEP();
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumo web de API JSON'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Text('Digite abaixo o CEP que deseja buscar: '),
              TextField(
                controller: _controladorCEP,
                decoration: InputDecoration(
                  labelText: 'CEP'
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    showDialog(
                        context: context, builder: (context) {
                          return AlertDialog(
                            title: Text('O resultado da busca é: '),
                            content: Text('${resultado}'),
                            actions: <Widget>[
                              ElevatedButton(
                                  onPressed: (){Navigator.pop(context);},
                                  child: Text('Fechar'))
                            ],
                          );
                    });
                  },
                  child: Text('Buscar')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
