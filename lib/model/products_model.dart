class Products {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductsModel> _products;

  List<ProductsModel> get products => _products;

  Products({required totalSize, required typeId,required offset,required products }){
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
  }

  Products.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductsModel>[];
      json['products'].forEach((v) {
        products!.add( ProductsModel.fromJson(v));
      });
    }
  }
}

class ProductsModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductsModel(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.stars,
        this.img,
        this.location,
        this.createdAt,
        this.updatedAt,
        this.typeId});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson(){
    return {
      "id": this.id,
      "name": this.name,
      "description" : this.description,
      "price": this.price,
      "stars": this.stars,
      "img": this.img,
      "location": this.location,
      "createdAt": this.createdAt,
      "updatedAt" : this.updatedAt,
      "typeId" : this.typeId,
    };
  }

}


