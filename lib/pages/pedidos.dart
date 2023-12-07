import 'package:flutter/material.dart';
import 'package:hamburgueria_app/models/processaPedidosModel.dart';
import '../models/pedidoModel.dart';

class PedidosScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<PedidosScreen> {
  List<Pedido> pedidos = [];
  int pedidoCount = 0;

  @override
  Widget build(BuildContext context) {
    List<Pedido>? listaPedidos =
        ModalRoute.of(context)!.settings.arguments as List<Pedido>?;
    if (listaPedidos != null) {
      pedidos = listaPedidos;
      pedidoCount = listaPedidos.last.pedidoId;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
        toolbarHeight: 70.0,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: PedidoCard(
              pedidos: pedidos,
              onItemTap: (Pedido item) {},
            ),
          ),
          NewPedido(
            onNovoPedido: () {
              Pedido pedido = new Pedido(mesa: 0, pedidoId: ++pedidoCount);
              Navigator.pushNamed(context, '/mesas',
                  arguments: new ProcessaPedidos(pedido, pedidos));
            },
          ),
        ],
      ),
    );
  }
}

class PedidoCard extends StatelessWidget {
  final List<Pedido> pedidos;
  final Function(Pedido) onItemTap;

  PedidoCard({required this.pedidos, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pedidos.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title:
                Text('Número do pedido: ${pedidos[index].pedidoId.toString()}'),
            subtitle: Text('Mesa: ${pedidos[index].mesa}'),
            onTap: () {
              onItemTap(pedidos[index]);
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(context, '/menu',
                        arguments:
                            new ProcessaPedidos(pedidos[index], pedidos));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    pedidos.remove(pedidos[index]);
                    if (pedidos.length > 0) {
                      Navigator.of(context)
                          .popAndPushNamed('/pedidos', arguments: pedidos);
                    } else {
                      Navigator.of(context)
                          .popAndPushNamed('/pedidos', arguments: null);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NewPedido extends StatelessWidget {
  final Function() onNovoPedido;

  NewPedido({
    required this.onNovoPedido,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onNovoPedido,
          child: Text('Novo pedido'),
        ),
      ],
    );
  }
}
