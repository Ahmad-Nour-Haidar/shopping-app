import 'package:faker/faker.dart';
import 'package:ptc_quiz2/screens/address_card/data/models/address_model.dart';

final addresses = List.generate(10, (index) {
  return AddressModel(
    title: faker.lorem.word(),
    street: faker.address.streetAddress(),
  );
});
