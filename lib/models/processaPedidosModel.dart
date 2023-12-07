import 'package:hamburgueria_app/models/pedidoModel.dart';

class ProcessaPedidos {
  Pedido pedidoAtual;
  List<Pedido> pedidosTotais;

  ProcessaPedidos(this.pedidoAtual, this.pedidosTotais);
}
