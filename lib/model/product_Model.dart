


class ProductModel {
  String product;
  int cardBackground;
  String image;


  ProductModel(this.product, this.cardBackground, this.image);
}

List<ProductModel> cards = [
  new ProductModel("Avoskin", 0xFFfffffff, "assets/product1.png"),
  new ProductModel("Skintific", 0xFFfffffff,"assets/product2.png"),
  new ProductModel("Somethinc", 0xFFfffffff,"assets/product3.png"),
  new ProductModel("Npure",0xFFfffffff, "assets/product2.png"),
  new ProductModel("Avoskin",0xFFfffffff,"assets/product1.png" ),

];