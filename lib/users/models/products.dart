// For demo

class Product {
  final String title, image;
  final double price;

  Product({required this.title, required this.image, required this.price});
}

class ProductCategory {
  final String category;
  final List<Product> items;

  ProductCategory({required this.category, required this.items});
}

final List<ProductCategory> productsCategory = [
  ProductCategory(
    category: "Most Popular",
    items: [
      Product(
        price: 7.4,
        image: "assets/images/f_0.png",
        title: "Cookie Sandwich1",
      ),
      Product(
        price: 9.0,
        image: "assets/images/f_1.png",
        title: "Chow Fun",
      ),
      Product(
        price: 8.5,
        image: "assets/images/f_2.png",
        title: "Dim SUm",
      ),
      Product(
        price: 12.4,
        image: "assets/images/f_3.png",
        title: "Cookie Sandwich",
      ),
    ],
  ),
  ProductCategory(
    category: "Beef & Lamb",
    items: [
      Product(
        price: 7.4,
        image: "assets/images/f_4.png",
        title: "Combo Burger",
      ),
      Product(
        price: 9.0,
        image: "assets/images/f_5.png",
        title: "Combo Sandwich",
      ),
      Product(
        price: 8.5,
        image: "assets/images/f_2.png",
        title: "Dim SUm",
      ),
      Product(
        price: 12.4,
        image: "assets/images/f_3.png",
        title: "Oyster Dish",
      ),
    ],
  ),
  ProductCategory(
    category: "Seafood",
    items: [
      Product(
        price: 7.4,
        image: "assets/images/f_6.png",
        title: "Oyster Dish",
      ),
      Product(
        price: 9.0,
        image: "assets/images/f_7.png",
        title: "Oyster On Ice",
      ),
      Product(
        price: 8.5,
        image: "assets/images/f_8.png",
        title: "Fried Rice on Pot",
      ),
    ],
  ),
  ProductCategory(
    category: "Appetizers",
    items: [
      Product(
        price: 8.5,
        image: "assets/images/f_2.png",
        title: "Dim SUm",
      ),
      Product(
        price: 7.4,
        image: "assets/images/f_0.png",
        title: "Cookie Sandwich",
      ),
      Product(
        price: 9.0,
        image: "assets/images/f_5.png",
        title: "Combo Sandwich",
      ),
      Product(
        price: 12.4,
        image: "assets/images/f_3.png",
        title: "Cookie Sandwich",
      ),
      Product(
        price: 9.0,
        image: "assets/images/f_1.png",
        title: "Chow Fun",
      ),
    ],
  ),
  ProductCategory(
    category: "Dim Sum",
    items: [
      Product(
        price: 9.0,
        image: "assets/images/f_5.png",
        title: "Combo Sandwich",
      ),
      Product(
        price: 12.4,
        image: "assets/images/f_3.png",
        title: "Cookie Sandwich",
      ),
      Product(
        price: 8.5,
        image: "assets/images/f_2.png",
        title: "Dim SUm",
      ),
      Product(
        price: 7.4,
        image: "assets/images/f_6.png",
        title: "Oyster Dish",
      ),
      Product(
        price: 9.0,
        image: "assets/images/f_7.png",
        title: "Oyster On Ice",
      ),
      Product(
        price: 8.5,
        image: "assets/images/f_8.png",
        title: "Fried Rice on Pot",
      ),
    ],
  ),
];
