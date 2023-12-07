import 'package:flutter/material.dart';
import '/pages/login.dart';
import '/pages/mesas.dart';
import '/pages/menu.dart';
import '/pages/pedidos.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurante El Fradolas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/pedidos': (context) => PedidosScreen(),
        '/mesas': (context) => MesasPage(),
        '/menu': (context) => MenuScreen(),
      },
    );
  }
}
