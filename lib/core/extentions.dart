import 'package:bookly_app/core/models/detailed_book_model.dart';

extension GetSalability on String {
  Salability get salabilityFromString {
    switch (this) {
      case "NOT_FOR_SALE":
        return Salability.notForSale;
      case "FOR_SALE":
        return Salability.forSale;
      case "FREE":
        return Salability.free;

      default:
        return Salability.unKnown;
    }
  }
}
