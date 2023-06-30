class Product {
  String? name;
  String? ingredient;
  String? unit;
  String? imgUrl;
  String? skuCode;
  String? barCode;
  int? purchasePrice;
  int? salePrice;
  bool? isAvaiable;
  int? numInStorage;
  int? numSold;

  Product(
      {required this.name,
      required this.ingredient,
      required this.unit,
      this.imgUrl,
      required this.skuCode,
      this.barCode,
      required this.purchasePrice,
      required this.salePrice,
      this.isAvaiable,
      this.numInStorage = 0,
      this.numSold = 0});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    ingredient = json['ingredient'];
    unit = json['unit'];
    imgUrl = json['imgUrl'];
    skuCode = json['skuCode'];
    barCode = json['barCode'];
    purchasePrice = json['purchasePrice'];
    salePrice = json['salePrice'];
    isAvaiable = json['isAvaiable'];
    numInStorage = json['numInStorage'];
    numSold = json['numSold'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['ingredient'] = ingredient;
    data['unit'] = unit;
    data['imgUrl'] = imgUrl;
    data['skuCode'] = skuCode;
    data['barCode'] = barCode;
    data['purchasePrice'] = purchasePrice;
    data['salePrice'] = salePrice;
    data['isAvaiable'] = isAvaiable;
    data['numInStorage'] = numInStorage;
    data['numSold'] = numSold;
    return data;
  }
}
