class Sponsorship {
  String name;
  String description;
  int id;

  Sponsorship(this.name, this.description, [this.id]);

  Sponsorship.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        id = json['pk'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'description': description, 'pk': id};
}
