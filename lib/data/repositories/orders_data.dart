import 'package:pandeli_app/core/entities/orders.dart';

class OrdersRepository {
  static List<Orders> getOrders() => List.generate(
      20,
      (index) => Orders(
          id: index + 1,
          name: 'Chocolate ${index + 1}',
          urlPedido:
              'https://ik.imagekit.io/0bods5tu3//Photos/Ordering1/3767/updated%20smores%20layer%20cake%203.jpg?Version=',
          size: '10 personas',
          flavor: 'Vainilla',
          status: 'Preparando',
          ordenday: '10/02/2023'));
}

