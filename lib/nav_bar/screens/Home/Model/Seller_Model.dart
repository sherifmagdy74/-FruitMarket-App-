class SellerModel  {
  final String sellerName;
  final double rating;
  final String deliveryCharge;
  final String image;
  final String status;
  final String category;
  final String distance;

  const SellerModel( {
    required this.image,
    required this.sellerName,
    required this.rating,
    required this.deliveryCharge,

    required this.status,
    required this.category,
    required this.distance,
  });}







final List<SellerModel> sellerList = [
  SellerModel(
    sellerName: "Seller One",
    rating: 4.5,
    deliveryCharge: "0.5 KD",
    image: "assets/items/logoSeller.png",
    status: "Open",
    category: "Beverages",
    distance: "2.5",
  ),
  SellerModel(
    sellerName: "Seller Two",
    rating: 4.2,
    deliveryCharge: "0.5 KD",
    image: "assets/items/logoSeller.png",
    status: "Close",
    category: "Pizza",
    distance: "2.5",
  ),
  SellerModel(
    sellerName: "Seller Three",
    rating: 4.8,
    deliveryCharge: "Free",
    image: "assets/items/logoSeller.png",
    status: "Open",
    category: "Fried Chicken",
    distance: "2.5",
  ),
];

