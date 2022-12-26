class NewsModal {
   String? status;
   List<Result>? result;

  NewsModal({required this.status, required this.result});

  NewsModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result =  <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? author;
  String? description;
  String? publishedAt;
  String? sourceName;
  String? title;
  String? url;
  String? urlToImage;

  Result(
      {required this.author,
      required this.description,
      required this.publishedAt,
      required this.sourceName,
      required this.title,
      required this.url,
      required this.urlToImage});

  Result.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    description = json['description'];
    publishedAt = json['publishedAt'];
    sourceName = json['sourceName'];
    title = json['title'];
    url = json['url'];
    urlToImage = json['urlToImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['description'] = this.description;
    data['publishedAt'] = this.publishedAt;
    data['sourceName'] = this.sourceName;
    data['title'] = this.title;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    return data;
  }
}
