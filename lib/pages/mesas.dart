import 'package:flutter/material.dart';
import '../models/processaPedidosModel.dart';

class MesasPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MesasPage> {
  @override
  Widget build(BuildContext context) {
    ProcessaPedidos processaPedidos =
        ModalRoute.of(context)!.settings.arguments as ProcessaPedidos;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mesas'),
        toolbarHeight: 70.0,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Primeira Coluna
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildMesaContainer('Mesa 1', '/menu', processaPedidos, 1),
                buildMesaContainer('Mesa 3', '/menu', processaPedidos, 3),
                buildMesaContainer('Mesa 5', '/menu', processaPedidos, 5),
              ],
            ),

            // Segunda Coluna
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildMesaContainer('Mesa 2', '/menu', processaPedidos, 2),
                buildMesaContainer('Mesa 4', '/menu', processaPedidos, 4),
                buildMesaContainer('Mesa 6', '/menu', processaPedidos, 6),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMesaContainer(String mesaName, String route,
      ProcessaPedidos processaPedidos, int numeroMesa) {
    return GestureDetector(
      onTap: () {
        processaPedidos.pedidoAtual.mesa = numeroMesa;
        Navigator.pushNamed(context, route, arguments: processaPedidos);
      },
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            mesaName,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
