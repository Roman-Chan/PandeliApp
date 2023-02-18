class Orders {
  final int id;
  final String name;
  final String urlPedido;
  final String size;
  final String flavor;
  final String status;
  final String ordenday;

  Orders(
      {required this.id,
      required this.name,
      required this.urlPedido,
      required this.size,
      required this.flavor,
      required this.status,
      required this.ordenday});
}
