import 'package:flutter/material.dart';
import 'productlist.dart';
import 'addproduct.dart';
import 'staff.dart';
import 'addstaff.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Best Collections",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 10,
          backgroundColor: Colors.grey[700],
        ),
        body: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView(
                shrinkWrap: true,
                children: [
                  buildGridItem(Icons.production_quantity_limits,
                      "Product List", "images/productlist.png"),
                  buildGridItem(
                      Icons.add_card, "Add Product", "images/addproduct.png"),
                  buildGridItem(
                      Icons.people_rounded, "Staffs", "images/viewstaff.png"),
                  buildGridItem(
                      Icons.person_add, "Add Staff", "images/addstaff.png"),
                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 60,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGridItem(IconData icon, String text, String imagePath) {
    return InkWell(
      onTap: () {
        if (text == 'Product List') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductListPage()),
          );
        }
        if (text == 'Add Product') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductListPage()),
          );
        }
        if (text == 'Staffs') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ViewStaff()),
          );
        }
        if (text == 'Add Staff') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStaff()),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.grey[350],
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(0.7),
              spreadRadius: 0.5,
              blurRadius: 7,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
            ),
            Positioned(
              bottom: 8.0,
              left: 8.0,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
