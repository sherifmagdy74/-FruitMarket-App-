class CategorySellerModel  {
  final String image;
  final String title;

  const CategorySellerModel(  {
required this.image,
required this.title,
  });}

final List<CategorySellerModel> categorySellerList = [
  CategorySellerModel(
    image: "assets/categorySeller/fruits.png", title: 'Fruits',
  ),
  CategorySellerModel(
    image: "assets/categorySeller/iphone.png", title: 'Phone',
  ),
  CategorySellerModel(
    image: "assets/categorySeller/vegetables.png", title: 'Vegetables',
  ),
  CategorySellerModel(
    image: "assets/categorySeller/vets.png", title: 'Pets',
  ),

];