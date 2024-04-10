import 'package:flutter/material.dart';

class AddProductListPage extends StatefulWidget {
  const AddProductListPage({Key? key}) : super(key: key);

  @override
  _AddProductListPageState createState() => _AddProductListPageState();
}

class _AddProductListPageState extends State<AddProductListPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  String? _selectedCategory;
  List<String> _categories = ['', 'Kid', 'Men'];
  Map<String, bool> _categoryItems = {
    'T-shirt': false,
    'Shirt': false,
    'Pant': false,
    'Shorts': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _productNameController,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter quantity';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  labelText: 'Category',
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                items:
                    _categories.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              if (_selectedCategory != null && _selectedCategory != '') ...[
                SizedBox(height: 20),
                Text(
                  'Items:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                ..._categoryItems.keys.map((itemName) {
                  return CheckboxListTile(
                    title: Text(itemName),
                    value: _categoryItems[itemName]!,
                    onChanged: (bool? value) {
                      setState(() {
                        _categoryItems[itemName] = value!;
                      });
                    },
                  );
                }).toList(),
              ],
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String productName = _productNameController.text;
                    int quantity = int.parse(_quantityController.text);
                    double price = double.parse(_priceController.text);

                    print('Product Name: $productName');
                    print('Quantity: $quantity');
                    print('Price: $price');
                    print('Category: $_selectedCategory');
                    print('Selected items: $_categoryItems');
                    setState(() {
                      _selectedCategory = null;
                    });
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
