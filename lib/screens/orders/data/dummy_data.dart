import 'package:faker/faker.dart';
import 'package:ptc_quiz2/core/helper/number_helper.dart';
import 'package:ptc_quiz2/screens/orders/data/model/order_model.dart';

final orders = List.generate(
  NumberHelper.randomInt(5, 15),
  (index) {
    return OrderModel(
      customerName: faker.person.name(),
      totalAmount: NumberHelper.randomDouble(50, 150),
      items: List.generate(
        NumberHelper.randomInt(5, 10),
        (index) {
          return OrderItem(
            productName: faker.food.dish(),
            quantity: NumberHelper.randomInt(1, 5),
            price: NumberHelper.randomDouble(1, 15),
          );
        },
      ),
    );
  },
);
