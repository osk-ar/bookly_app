class BookModel {
  final String id;
  final String title;
  final String author;
  final String description;
  final ImageLinks imageLinks;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.imageLinks,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> volumeJson = json["volumeInfo"];
    return BookModel(
      title: volumeJson["title"] ?? "No Title",
      author: volumeJson["authors"]?[0] ?? "Unknown Author",
      description: volumeJson["description"] ?? "No Description",
      imageLinks: ImageLinks.fromJson(volumeJson["imageLinks"]),
      id: json["id"],
    );
  }

  factory BookModel.empty() {
    return BookModel(
      title: "No Title",
      author: "Unknown Author",
      description: "No Description",
      imageLinks: ImageLinks.empty(),
      id: "FAKE_ID",
    );
  }
}

class ImageLinks {
  final String thumbNail;
  final String smallThumbNail;
  ImageLinks({required this.thumbNail, required this.smallThumbNail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
      thumbNail:
          json["thumbnail"] ??
          "http://books.google.com/books/content?id=qexu-ZE_6AEC&printsec=frontcover&img=1&zoom=5&edge=curl&imgtk=AFLRE72lTBz6Pg7tgYr4ptXeYrE9kAHRm_8t1TBIA8hgrIEgHgtlYbo7xju9f1Tz9sUPtOqaiCkYHWkzK7kQYu7A_B0tpawDoYH-1l3u2OEkga_x8FvUM9nfR28Gmb2JNUhvAmzAjkRu&source=gbs_api",
      smallThumbNail:
          json["smallThumbnail"] ??
          "http://books.google.com/books/content?id=qexu-ZE_6AEC&printsec=frontcover&img=1&zoom=5&edge=curl&imgtk=AFLRE72lTBz6Pg7tgYr4ptXeYrE9kAHRm_8t1TBIA8hgrIEgHgtlYbo7xju9f1Tz9sUPtOqaiCkYHWkzK7kQYu7A_B0tpawDoYH-1l3u2OEkga_x8FvUM9nfR28Gmb2JNUhvAmzAjkRu&source=gbs_api",
    );
  }

  factory ImageLinks.empty() {
    return ImageLinks(thumbNail: "", smallThumbNail: "");
  }
}
