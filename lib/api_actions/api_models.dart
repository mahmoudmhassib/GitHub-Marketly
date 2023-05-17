class Products {

  //TODO:fields

  String? id;
  String? title;
  int? price;
  int? oldPrice;
  String? store;
  String? menuType;
  String? details;
  List<String>? images;

  //TODO:constructor

  Products(
      {this.id,
        this.title,
        this.price,
        this.oldPrice,
        this.store,
        this.menuType,
        this.details,
        this.images,});


  //TODO:convert to json

 factory Products.fromJson(Map<String, dynamic> json) {
  return Products(
      id : json['_id'],
      title : json['title'],
      price : json['price'],
  oldPrice :json['oldPrice'],
  store : json['store'],
  menuType : json['menuType'],
  details : json['details'],
  images : json['images'].cast<String>(),
  );
  }

}