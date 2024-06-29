import 'package:uuid/uuid.dart';

import '../../../core/helper/ID_helper.dart';
import '../models/product.dart';

const uuid = Uuid();
final List<ProductModel> products = [
  ProductModel(
      id: IDHelper.idV1,
      categoryId: IDHelper.randomCategoryID,
      name: 'Apple',
      category: 'Fruit',
      price: 1.5,
      image: 'assets/images/apple.jpg'),
  ProductModel(
      id: IDHelper.idV1,
      categoryId: IDHelper.randomCategoryID,
      name: 'Banana',
      category: 'Fruit',
      price: 0.5,
      image: 'assets/images/banana.jpg'),
  ProductModel(
      id: IDHelper.idV1,
      categoryId: IDHelper.randomCategoryID,
      name: 'Orange',
      category: 'Fruit',
      price: 0.8,
      image: 'assets/images/orange.jpg'),
  ProductModel(
      id: IDHelper.idV1,
      categoryId: IDHelper.randomCategoryID,
      name: 'Strawberry',
      category: 'Fruit',
      price: 2.0,
      image: 'assets/images/strawberry.jpg'),
  ProductModel(
      id: IDHelper.idV1,
      categoryId: IDHelper.randomCategoryID,
      name: 'Green Tea',
      category: 'Tea',
      price: 3.5,
      image: 'assets/images/green_tea.jpg'),
  ProductModel(
      id: IDHelper.idV1,
      categoryId: IDHelper.randomCategoryID,
      name: 'Black Tea',
      category: 'Tea',
      price: 4.0,
      image: 'assets/images/black_tea.jpg'),
  ProductModel(
      id: IDHelper.idV1,
      categoryId: IDHelper.randomCategoryID,
      name: 'Chamomile Tea',
      category: 'Tea',
      price: 3.8,
      image: 'assets/images/chamomile_tea.jpg'),
  ProductModel(
      id: IDHelper.idV1,
      categoryId: IDHelper.randomCategoryID,
      name: 'Mango',
      category: 'Fruit',
      price: 1.2,
      image: 'assets/images/mango.jpg'),
  ProductModel(
      id: IDHelper.idV1,
      categoryId: IDHelper.randomCategoryID,
      name: 'Pineapple',
      category: 'Fruit',
      price: 1.8,
      image: 'assets/images/pineapple.jpg'),
  ProductModel(
      id: IDHelper.idV1,
      categoryId: IDHelper.randomCategoryID,
      name: 'Oolong Tea',
      category: 'Tea',
      price: 5.0,
      image: 'assets/images/oolong_tea.jpg'),
];
