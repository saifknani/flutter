class ProduitModel {
  String name;
  String etat;
  String imageUrl;

  ProduitModel({
    required this.name,
    required this.etat,
    required this.imageUrl,
  });

  static fromJson(json) {}
}
