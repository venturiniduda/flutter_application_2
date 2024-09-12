// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MainApp(),
  ));
}

// StateFull: tipo de UI utilizada para manipulação de dados
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Atributos da classe
  // Identificador para um Form (formulário):
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Para a mensagem na barra
  final msgKey = GlobalKey<ScaffoldMessengerState>();

  // Para salvar as informações recebidas nos TextField:
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: msgKey,
      home: Scaffold(
        body: Padding(
          // Espaçamento entre os elementos

          // para todas as bordas:
          //padding: const EdgeInsets.all(30.0),

          //para determinar o espaçamento em cada borda:
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Icon(Icons.calculate, size: 120, color: Colors.purple[900]),
                TextFormField(
                    controller: txtValor1,
                    decoration: InputDecoration(
                      labelText: 'Valor 1',
                      labelStyle: TextStyle(color: Colors.purple[900]),
                      hintText: 'Informe o valor 1',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),

                    // Validação:
                    validator: (value) {
                      if (value == null) {
                        return 'Informe um valor!';
                      } else if (value.isEmpty) {
                        return 'Informe um valor!';
                      } else if (double.tryParse(value) == null) {
                        return 'Informe um valor numérico.';
                      }
                      return null;
                    }),
                SizedBox(
                  // para dar um espaço entre os TextFormField
                  height: 15,
                ),
                TextFormField(
                    controller: txtValor2,
                    decoration: InputDecoration(
                      labelText: 'Valor 2',
                      labelStyle: TextStyle(color: Colors.purple[900]),
                      hintText: 'Informe o valor 2',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),

                    // Validação:
                    // o 'responsável' por testar é o tryParse
                    validator: (value) {
                      if (value == null) {
                        return 'Informe um valor!';
                      } else if (value.isEmpty) {
                        return 'Informe um valor!';
                      } else if (double.tryParse(value) == null) {
                        return 'Informe um valor numérico.';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),

                // SOMA
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(80, 60),
                          textStyle: TextStyle(fontSize: 24),
                        ),
                        // Evento disparado quando o usuário pressiona o botão:
                        onPressed: () {
                          // Executa os validadores
                          if (formKey.currentState!.validate()) {
                            // Form validado com sucesso!
                            // Recuperar os valores informados nos campos:
                            setState(() {
                              // double.parse é responsável por converter string em double
                              double v1 = double.parse(txtValor1.text);
                              double v2 = double.parse(txtValor2.text);
                              double s = v1 + v2;

                              //Exibir o resultado
                              msgKey.currentState!.showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Resultado: ${s.toStringAsFixed(2)}'),
                                  duration: Duration(seconds: 5),
                                ),
                              );
                            });
                          }
                        },
                        child: Text('+'),
                      ),
                    ),

                    // SUBTRAÇÃO
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(80, 60),
                          textStyle: TextStyle(fontSize: 24),
                        ),
                        // Evento disparado quando o usuário pressiona o botão:
                        onPressed: () {
                          // Executa os validadores
                          if (formKey.currentState!.validate()) {
                            // Form validado com sucesso!
                            // Recuperar os valores informados nos campos:
                            setState(() {
                              // double.parse é responsável por converter string em double
                              double v1 = double.parse(txtValor1.text);
                              double v2 = double.parse(txtValor2.text);
                              double s = v1 - v2;

                              //Exibir o resultado
                              msgKey.currentState!.showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Resultado: ${s.toStringAsFixed(2)}'),
                                  duration: Duration(seconds: 5),
                                ),
                              );
                            });
                          }
                        },
                        child: Text('-'),
                      ),
                    ),

                    // MULTIPLICAÇÃO
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(80, 60),
                          textStyle: TextStyle(fontSize: 24),
                        ),
                        // Evento disparado quando o usuário pressiona o botão:
                        onPressed: () {
                          // Executa os validadores
                          if (formKey.currentState!.validate()) {
                            // Form validado com sucesso!
                            // Recuperar os valores informados nos campos:
                            setState(() {
                              // double.parse é responsável por converter string em double
                              double v1 = double.parse(txtValor1.text);
                              double v2 = double.parse(txtValor2.text);
                              double s = v1 * v2;

                              //Exibir o resultado
                              msgKey.currentState!.showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Resultado: ${s.toStringAsFixed(2)}'),
                                  duration: Duration(seconds: 5),
                                ),
                              );
                            });
                          }
                        },
                        child: Text('x'),
                      ),
                    ),

                    // DIVISÃO
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(80, 60),
                          textStyle: TextStyle(fontSize: 24),
                        ),
                        // Evento disparado quando o usuário pressiona o botão:
                        onPressed: () {
                          // Executa os validadores
                          if (formKey.currentState!.validate()) {
                            // Form validado com sucesso!
                            // Recuperar os valores informados nos campos:
                            setState(() {
                              // double.parse é responsável por converter string em double
                              double v1 = double.parse(txtValor1.text);
                              double v2 = double.parse(txtValor2.text);
                              double s = v1 / v2;

                              //Exibir o resultado
                              msgKey.currentState!.showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Resultado: ${s.toStringAsFixed(2)}'),
                                  duration: Duration(seconds: 5),
                                ),
                              );
                            });
                          }
                        },
                        child: Text('÷'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
