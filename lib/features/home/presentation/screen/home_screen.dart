import 'package:dase_backoffice/features/home/presentation/screen/create_costumer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed(ClienteFormScreen.route);
            },
            child: Text('Crear Nuevo Cliente'),)
          ],
        ),
      ),
    );
  }
}