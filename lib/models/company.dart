class Company {
  int id;
  String name;
  String type;

  Company({
    required this.id,
    required this.name,
    required this.type,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["ID"],
        name: json["Name"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Name": name,
        "Type": type,
      };
}
