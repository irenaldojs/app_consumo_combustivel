import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "" ;

  void _calcular(){
    double? _precoAlcool = double.tryParse(_controllerAlcool.text);
    double? _precoGasolina = double.tryParse(_controllerGasolina.text);
    if(_precoAlcool == null || _precoGasolina == null || _precoAlcool <= 0 || _precoGasolina <= 0){
      setState(() {
        _textoResultado = "Número inválido, digite um números maiores que 0 e ultilizando (.)";
      });
    }else{

      if( _precoAlcool /_precoGasolina >= 0.7 ) {
        setState(() {
          _textoResultado = "Álcool = $_precoAlcool\nGasolina = $_precoGasolina <==\nMelhor abastecer com Gasolina!";
          _limparCampos();
        });
      }
      else
        {
        setState(() {
          _textoResultado = "Álcool = $_precoAlcool <==\nGasolina = $_precoGasolina\nMelhor abastecer com Álcool!";
          _limparCampos();
        });
      }
    }
  }
  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Álcool ou Gasolina",
          style: TextStyle(
              fontSize: 30
          )
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: Image.asset("image/logo.png"),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Text(
                  "   Saiba qual a melhor opção para abastecimento do seu veículo!",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Preço do Álcool"
                ),
                style: const TextStyle(
                  fontSize: 20,
                ),
                controller: _controllerAlcool,
              ),

              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Preço do Gasolina"
                ),
                style: const TextStyle(
                  fontSize: 20,
                ),
                controller: _controllerGasolina,
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.indigo,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                      top: 20
                ),
                child: Text(
                  _textoResultado,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
