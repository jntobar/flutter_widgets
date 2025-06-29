import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name= 'snackbar_screen';
  const SnackbarScreen({super.key});
  void showCustomSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar=SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: Duration(seconds: 2),);
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    
  }

void openDialog(BuildContext context){
  showDialog(context: 
  context, 
  barrierDismissible: false,
  builder: (context)=> AlertDialog(
    title: const Text('Aqui va el dialogo'),
    content: const Text('Aqui va el dialogo que se debe de generar de manera automatica'),
    actions: [
      TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
      FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
    ],
  ));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sncakbars y dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(onPressed: () {
              showAboutDialog(context: context,
              children: [
                const Text('Aqui va el dialogo que va estar en la parte del codigo que hemos puesto en el snackbar')
              ]);
            }, child: Text('Licencias usadas')),
            FilledButton.tonal(onPressed: () => openDialog( context), child: Text('Mostrar DIalogo de pantalla'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
      label: const Text('Mostrar Snackbar'),
      icon: Icon(Icons.remove_red_eye),
      ),
    );
  }
}