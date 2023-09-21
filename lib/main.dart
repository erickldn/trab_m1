import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TelaA(),
  ));
}

class TelaA extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController tipoAcessoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: tipoAcessoController,
              decoration: InputDecoration(labelText: 'Tipo de Acesso'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => TelaB(
                    nome: nomeController.text,
                    email: emailController.text,
                    tipoAcesso: tipoAcessoController.text,
                  ),
                ));
              },
              child: Text('Acessar'),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaB extends StatelessWidget {
  final String nome;
  final String email;
  final String tipoAcesso;

  TelaB({required this.nome, required this.email, required this.tipoAcesso});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false; 
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(nome),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Nome: $nome'),
              Text('Email: $email'),
              Text('Tipo de Acesso: $tipoAcesso'),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirmação'),
                        content: Text('Deseja ocultar as informações?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Confirmar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Ocultar Informações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}