import 'package:flutter/foundation.dart' show immutable;
import 'package:ptc_quiz2/core/helper/ID_helper.dart';

@immutable
final class AddressModel {
  final String title;
  final String street;
  final String id;

  AddressModel({
    required this.title,
    required this.street,
  }) : id = IDHelper.idV1;
}
