import 'package:flutter/material.dart';
import '../models/menuItemModel.dart';
import '../models/pedidoModel.dart';
import '../models/processaPedidosModel.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<MenuItem> menuItems = [
    MenuItem(name: 'Hambúrguer', price: 15.99),
    MenuItem(name: 'Pizza de Mussarela', price: 20.99),
    MenuItem(name: 'Pizza de Calabresa', price: 18.99),
    MenuItem(name: 'Pizza de Frango Catupiry', price: 18.99),
    MenuItem(name: 'Lanche', price: 10.99),
    MenuItem(name: 'File de frango a parmegiana', price: 35.99),
    MenuItem(name: 'Salada Caesar', price: 12.99),
    MenuItem(name: 'Água', price: 2.99),
    MenuItem(name: 'Refrigerante', price: 4.99),
    MenuItem(name: 'Suco', price: 6.99),
  ];

  @override
  Widget build(BuildContext context) {
    ProcessaPedidos processaPedidos =
        ModalRoute.of(context)!.settings.arguments as ProcessaPedidos;
    if (processaPedidos.pedidoAtual.itens != null) {
      menuItems = processaPedidos.pedidoAtual.itens as List<MenuItem>;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio'),
        toolbarHeight: 70.0,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ItemCard(
              itens: menuItems,
              onItemTap: (MenuItem item) {},
            ),
          ),
          FinalizarPedido(
            onFinalizarPedido: () {
              if (processaPedidos.pedidoAtual.itens == null) {
                processaPedidos.pedidoAtual.itens = menuItems;
                processaPedidos.pedidosTotais.add(processaPedidos.pedidoAtual);
              }
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/pedidos', (Route route) => false,
                  arguments: processaPedidos.pedidosTotais);
            },
          )
        ],
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final List<MenuItem> itens;
  final Function(MenuItem) onItemTap;

  ItemCard({required this.itens, required this.onItemTap});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itens.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text('${widget.itens[index].name.toString()}'),
            subtitle: Text('R\$: ${widget.itens[index].price}'),
            onTap: () {
              widget.onItemTap(widget.itens[index]);
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (widget.itens[index].quantity > 0) {
                        widget.itens[index].quantity--;
                      }
                    });
                  },
                ),
                Text(widget.itens[index].quantity.toString()),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      widget.itens[index].quantity++;
                    });
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

class FinalizarPedido extends StatelessWidget {
  final Function() onFinalizarPedido;

  FinalizarPedido({
    required this.onFinalizarPedido,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onFinalizarPedido,
          child: Text('Finalizar Pedido'),
        ),
      ],
    );
  }
}
