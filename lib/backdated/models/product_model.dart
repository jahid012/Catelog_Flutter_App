class ProductModel {
  String productName;
  String productImage;
  String productPrice;
  ProductModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  ProductModel.getProduct(Map m)
      : productName = m["productname"].toString(),
        productImage = m["productimage"].toString(),
        productPrice = m["productprice"].toString();
}
