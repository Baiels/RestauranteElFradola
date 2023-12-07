import 'menuItemModel.dart';

class Pedido {
  final int pedidoId;
  int mesa;
  List<MenuItem>? itens;

  Pedido({required this.pedidoId, required this.mesa});
}
