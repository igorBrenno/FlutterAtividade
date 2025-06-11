// import 'dart:nativewrappers/_internal/vm/lib/ffi_patch.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp Flutter',
      theme: ThemeData(),
      home: const FormExampleScreen(),
    );
  }
}

class FormExampleScreen extends StatefulWidget {
  const FormExampleScreen({super.key});

  @override
  _FormExampleScreenState createState() => _FormExampleScreenState();
}

class _FormExampleScreenState extends State<FormExampleScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _cidades = ['Picui', 'Cuite', 'Carnauba'];
  final List<String> _pais = ['Brasil', 'USA', 'XINGILING'];

  String? _selectCidade;
  String? _selectPais;
  bool _termos = false;
  String? _selectedRadioOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário Completo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 16,
            children: [
              // cidades
              DropdownButtonFormField<String>(
                value: _selectCidade,
                decoration: const InputDecoration(
                  labelText: 'Cidades',
                  border: OutlineInputBorder(),
                ),
                items:
                    _cidades
                        .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                        .toList(),
                onChanged: (value) {
                  // Necessário setState pois altera o valor selecionado
                  setState(() {
                    _selectCidade = value;
                  });
                },
                validator:
                    (value) => value == null ? 'Selecione uma Cidades' : null,
              ),

              // pais
              DropdownButtonFormField<String>(
                value: _selectPais,
                decoration: const InputDecoration(
                  labelText: 'Cidades',
                  border: OutlineInputBorder(),
                ),
                items:
                    _pais
                        .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                        .toList(),
                onChanged: (value) {
                  // Necessário setState pois altera o valor selecionado
                  setState(() {
                    _selectPais = value;
                  });
                },
                validator:
                    (value) => value == null ? 'Selecione um Pais' : null,
              ),

              // Termos
              CheckboxListTile(
                title: const Text('Aceito os termos de uso'),
                value: _termos,
                onChanged: (value) {
                  setState(() {
                    _termos = value ?? false;
                  });
                },
                subtitle:
                    !_termos
                        ? const Text(
                          'Obrigatório aceitar os termos',
                          style: TextStyle(color: Colors.red),
                        )
                        : null,
                controlAffinity: ListTileControlAffinity.leading,
              ),

              // RadioBox
              const Text('Como prefere ser chamado?'),
              RadioListTile<String>(
                title: const Text('Sr.'),
                value: 'Sr.',
                groupValue: _selectedRadioOption,
                onChanged: (value) {
                  setState(() {
                    _selectedRadioOption = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Sra.'),
                value: 'Sra.',
                groupValue: _selectedRadioOption,
                onChanged: (value) {
                  setState(() {
                    _selectedRadioOption = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Não Binario'),
                value: 'Não Binario',
                groupValue: _selectedRadioOption,
                onChanged: (value) {
                  setState(() {
                    _selectedRadioOption = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Amigue'),
                value: 'Amigue',
                groupValue: _selectedRadioOption,
                onChanged: (value) {
                  setState(() {
                    _selectedRadioOption = value;
                  });
                },
              ),

              // Botão
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text('Dados do Formulário'),
                              content: Text('''
Cidade: ${_selectCidade ?? 'Não selecionada'}
País: ${_selectPais ?? 'Não selecionado'}
Aceita termos: ${_termos ? 'Sim' : 'Não'}
Como prefere ser chamado: ${_selectedRadioOption ?? 'Não selecionado'}
'''),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Fechar'),
                                ),
                              ],
                            ),
                      );
                    }
                  },
                  child: const Text('Enviar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
