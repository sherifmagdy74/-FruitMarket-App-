class ProductCardModel  {
  final String productName;
  final String? newPrice;
  final String? oldPrice;
  final String? discount;
  final bool isSelectable;
  final String image;
   late int quantity;

   ProductCardModel({

    required this.productName,
    this.newPrice,
    this.oldPrice,
    this.discount,
    required this.image,
    this.isSelectable = false,
    this.quantity = 1,
  });}


List<ProductCardModel> productCards = [
  ProductCardModel(
    productName: "Apple",
    discount: "20% Off",
    isSelectable: true, image: 'assets/categorySeller/product.png',
  ),
  ProductCardModel(
    productName: "chocolate",
    newPrice: "8.00", image: 'assets/categorySeller/product.png',
  ),
  ProductCardModel(
    productName: "Pepsi",
    newPrice: "12.00",
    oldPrice: "14.00",
    discount: "10% Off", image: 'assets/categorySeller/product.png',
  )

];
