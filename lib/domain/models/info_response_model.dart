class InfoResponseModel {
    int count;
    int pages;
    String? next;
    String? prev;

    InfoResponseModel({
        required this.count,
        required this.pages,
        this.next,
        this.prev,
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