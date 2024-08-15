class PageInfoModel {
    int count;
    int pages;
    String next;
    dynamic prev;

    PageInfoModel({
        required this.count,
        required this.pages,
        required this.next,
        required this.prev,
    });

    factory PageInfoModel.fromJson(Map<String, dynamic> json) => PageInfoModel(
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