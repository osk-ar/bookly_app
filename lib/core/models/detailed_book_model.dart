import 'package:bookly_app/core/extentions.dart';
import 'package:bookly_app/core/models/book_model.dart';

class DetailedBookModel {
  final String title;
  final String author;
  final String description;
  final double averageRating;
  final int ratingsCount;
  final SaleInfo saleInfo;
  final ImageLinks imageLinks;

  DetailedBookModel({
    required this.title,
    required this.author,
    required this.description,
    required this.imageLinks,
    required this.saleInfo,
    required this.averageRating,
    required this.ratingsCount,
  });

  factory DetailedBookModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> volumeJson = json["volumeInfo"];
    final rawRating = volumeJson['averageRating'];
    double parsedRating;

    if (rawRating is int) {
      parsedRating = rawRating.toDouble();
    } else if (rawRating is double) {
      parsedRating = rawRating;
    } else {
      parsedRating = 0.0;
    }
    return DetailedBookModel(
      title: volumeJson["title"] ?? "No Title",
      author: volumeJson["authors"]?[0] ?? "Unknown Author",
      description: volumeJson["description"] ?? "No Description",
      averageRating: parsedRating,
      ratingsCount: volumeJson["ratingsCount"] ?? 0,
      imageLinks: ImageLinks.fromJson(volumeJson["imageLinks"]),
      saleInfo: SaleInfo.fromJson(json["saleInfo"]),
    );
  }

  factory DetailedBookModel.empty() {
    return DetailedBookModel(
      title: "No Title",
      author: "Unknown Author",
      description: "No Description",
      imageLinks: ImageLinks.empty(),
      averageRating: 0,
      ratingsCount: 0,
      saleInfo: SaleInfo.empty(),
    );
  }
}

class SaleInfo {
  final Salability salability;
  final PriceModel price;

  SaleInfo({required this.salability, required this.price});

  factory SaleInfo.fromJson(Map<String, dynamic> json) {
    Salability salability =
        (json["saleability"] as String).salabilityFromString;
    return SaleInfo(
      salability: salability,
      price:
          salability == Salability.forSale
              ? PriceModel.fromJson(json["listPrice"])
              : PriceModel.empty(),
    );
  }

  factory SaleInfo.empty() {
    return SaleInfo(salability: Salability.unKnown, price: PriceModel.empty());
  }
}

class PriceModel {
  final double price;
  final String currencyCode;

  PriceModel({required this.price, required this.currencyCode});

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      price: json["amount"]?.toDouble() ?? 0.0,
      currencyCode: json["currencyCode"] ?? "EGP",
    );
  }

  factory PriceModel.empty() {
    return PriceModel(price: 0.0, currencyCode: "EGP");
  }
}

enum Salability { notForSale, free, forSale, unKnown }
