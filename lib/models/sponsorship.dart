class Sponsorship {
  String name;
  String description;

  Sponsorship(this.name, this.description);

  Sponsorship.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
      };
}
