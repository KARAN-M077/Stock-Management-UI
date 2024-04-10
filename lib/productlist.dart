import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> productList = [
    {
      "category": "Kids",
      "type": "T-shirt",
      "size": "S",
      "count": "50",
      "image": "images/kids.png"
    },
    {
      "category": "Kids",
      "type": "Pant",
      "size": "S",
      "count": "50",
      "image": "images/kids.png"
    },
    {
      "category": "Kids",
      "type": "Shirt",
      "size": "S",
      "count": "50",
      "image": "images/kids.png"
    },
    {
      "category": "Kids",
      "type": "Shorts",
      "size": "S",
      "count": "50",
      "image": "images/kids.png"
    },
    {
      "category": "Men",
      "type": " Formal Shirt",
      "size": "M",
      "count": "27",
      "image": "images/men.png"
    },
    {
      "category": "Men",
      "type": " Formal Pants",
      "size": "M",
      "count": "27",
      "image": "images/men.png"
    },
    {
      "category": "Men",
      "type": " Casual Shirt",
      "size": "M",
      "count": "65",
      "image": "images/men.png"
    },
    {
      "category": "Men",
      "type": "Shorts",
      "size": "M",
      "count": "45",
      "image": "images/men.png"
    },
  ];

  List<String> get categories {
    return [
      'Kids',
      'Men',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final filteredProducts = productList
              .where((product) => product['category'] == category)
              .toList();
          return ListTile(
            title: Text(
              category,
              style: TextStyle(
                fontSize: 18, // Example of applying style
                fontWeight: FontWeight.bold, // Example of applying style
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryDetailPage(
                    category: category,
                    products: filteredProducts,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CategoryDetailPage extends StatelessWidget {
  final String category;
  final List<Map<String, dynamic>> products;

  const CategoryDetailPage({
    Key? key,
    required this.category,
    required this.products,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            width: 50,
            height: 100,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey, // Optional: Adds rounded corners
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                  vertical: 20, horizontal: 50), // Adjust padding for size
              leading: Image.asset(
                product['image'],
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
              title: Text(product['type']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      category: category,
                      image: product['image'],
                      count: product['count'],
                      type: product['type'],
                      size: product['size'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final String category;
  final String image;
  final String count;
  final String type;
  final String size;

  const ProductDetailPage({
    Key? key,
    required this.category,
    required this.image,
    required this.count,
    required this.type,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text('Type: $type'),
                  Text('Size: $size'),
                  Text('Stock: $count'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProductListPage(),
  ));
}
