import 'package:flutter/material.dart';

import '../ui/ui_class.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Text(
              'Welcome to',
              style: TextStyle(fontSize: 30, color: Colors.black26),
            ),
            Text(
              'Espoch',
              style: TextStyle(
                  fontSize: 70, color: Color.fromARGB(255, 237, 71, 21)),
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              //color: Colors.blueGrey,
              height: 60,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    //color: Color.fromARGB(255, 221, 100, 64),
                  ),
                  child: _inputForm(
                    htext: 'jhondoe@gmail.com',
                    ltext: 'Correo Electronico',
                    icon: Icons.mark_email_read,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _inputForm extends StatelessWidget {
  const _inputForm({
    required this.icon,
    required this.ltext,
    required this.htext,
  });
  final IconData icon;
  final String ltext;
  final String htext;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      //se crea la clase en UI y se hace referencia
      decoration: InputDecorationss.logindecoracion(
        hintText: htext,
        labelText: ltext,
        iconL: icon,
      ),
    );
  }
}
