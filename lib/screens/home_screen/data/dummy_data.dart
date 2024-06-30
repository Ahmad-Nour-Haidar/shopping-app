import 'package:faker/faker.dart';
import 'package:ptc_quiz2/core/helper/number_helper.dart';

import '../../../core/helper/ID_helper.dart';
import '../models/product.dart';

final faker = Faker();

final List<ProductModel> products = List.generate(
  50,
  (index) {
    final category = IDHelper.randomCategory;
    return ProductModel(
      id: IDHelper.idV1,
      categoryId: category.id,
      name: faker.food.dish(),
      category: category.name,
      price: NumberHelper.randomInt(100, 500).toDouble(),
      rating: NumberHelper.randomDouble(1, 5),
      image: '',
      discount: NumberHelper.randomInt(5, 25).toDouble(),
      countReviews: NumberHelper.randomInt(),
      reviews: faker.lorem.words(30).join(' '),
      details: faker.lorem.words(30).join(' '),
      nutritionalFacts: faker.lorem.words(30).join(' '),
    );
  },
);
// [
//   ProductModel(
//       id: IDHelper.idV1,
//       categoryId: IDHelper.randomCategoryID,
//       name: 'Apple',
//       category: 'Fruit',
//       price: 1.5,
//       image: 'assets/images/apple.jpg'),
//   ProductModel(
//       id: IDHelper.idV1,
//       categoryId: IDHelper.randomCategoryID,
//       name: 'Banana',
//       category: 'Fruit',
//       price: 0.5,
//       image: 'assets/images/banana.jpg'),
//   ProductModel(
//       id: IDHelper.idV1,
//       categoryId: IDHelper.randomCategoryID,
//       name: 'Orange',
//       category: 'Fruit',
//       price: 0.8,
//       image: 'assets/images/orange.jpg'),
//   ProductModel(
//       id: IDHelper.idV1,
//       categoryId: IDHelper.randomCategoryID,
//       name: 'Strawberry',
//       category: 'Fruit',
//       price: 2.0,
//       image: 'assets/images/strawberry.jpg'),
//   ProductModel(
//       id: IDHelper.idV1,
//       categoryId: IDHelper.randomCategoryID,
//       name: 'Green Tea',
//       category: 'Tea',
//       price: 3.5,
//       image: 'assets/images/green_tea.jpg'),
//   ProductModel(
//       id: IDHelper.idV1,
//       categoryId: IDHelper.randomCategoryID,
//       name: 'Black Tea',
//       category: 'Tea',
//       price: 4.0,
//       image: 'assets/images/black_tea.jpg'),
//   ProductModel(
//       id: IDHelper.idV1,
//       categoryId: IDHelper.randomCategoryID,
//       name: 'Chamomile Tea',
//       category: 'Tea',
//       price: 3.8,
//       image: 'assets/images/chamomile_tea.jpg'),
//   ProductModel(
//       id: IDHelper.idV1,
//       categoryId: IDHelper.randomCategoryID,
//       name: 'Mango',
//       category: 'Fruit',
//       price: 1.2,
//       image: 'assets/images/mango.jpg'),
//   ProductModel(
//       id: IDHelper.idV1,
//       categoryId: IDHelper.randomCategoryID,
//       name: 'Pineapple',
//       category: 'Fruit',
//       price: 1.8,
//       image: 'assets/images/pineapple.jpg'),
//   ProductModel(
//       id: IDHelper.idV1,
//       categoryId: IDHelper.randomCategoryID,
//       name: 'Oolong Tea',
//       category: 'Tea',
//       price: 5.0,
//       image: 'assets/images/oolong_tea.jpg'),
// ];
