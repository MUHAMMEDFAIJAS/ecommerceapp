class ProductModel {
  String? prodname;
  String? prodescription;
  String? productid;
  String? proimage;
  int? proprice;
  String? category;

  ProductModel({
    this.prodname,
    this.prodescription,
    this.productid,
    this.proimage,
    this.proprice,
    this.category,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    prodname = json['prodname'];
    prodescription = json['prodescription'];
    productid = json['productid'];
    proimage = json['proimage'];
    proprice = json['price'];
    category = json['category'];
  }

  Map<String, dynamic> tojson() {
    return {
      'prodname': prodname,
      'prodescription': prodescription,
      'productid': productid,
      'proimage': proimage,
      'price': proprice,
      'category':category,
    };
  }
}
