class ProduitModel {
  String id;
  String name;
  String imageUrl;
  String description;
  String qte;
  String price;
 
  ProduitModel({
    required this.id,
    required this.name,
    required this.imageUrl, required this.description, required this.qte, required this.price,
  });

 
 factory ProduitModel.fromJson(Map<String, dynamic> json) {
  return ProduitModel(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    description: json['description'] ?? '',
    qte: json['qte'] ?? '',
    price: json['price'] ?? '',
    imageUrl: '',  
  );
}
}
