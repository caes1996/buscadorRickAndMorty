class InfoResponseModel {
    int count;
    int pages;
    String next;
    dynamic prev;

    InfoResponseModel({
        required this.count,
        required this.pages,
        required this.next,
        required this.prev,
    });

    factory InfoResponseModel.fromJson(Map<String, dynamic> json) => InfoResponseModel(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}