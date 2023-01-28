class SushiCart {
  String imageUrl;
  String title;
  String description;
  String price;

  SushiCart({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });
}

List<SushiCart> topSushi = [
  SushiCart(
    imageUrl: "assets/images/images-removebg-preview.png",
    title: "Sushi Octopus",
    description: "Rice + Octopus",
    price: "\$6.50",
  ),
  SushiCart(
      imageUrl:
          "assets/images/ahtziri-lagarde-yQK3t9uQlX0-unsplash__1_-removebg-preview.png",
      title: "Sushi Salmon",
      description: "Rice + Salmon",
      price: "\$8.50")
];
