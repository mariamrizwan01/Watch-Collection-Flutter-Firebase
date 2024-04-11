import 'package:flutter/material.dart';

class MyAdminPanelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      theme: ThemeData(
        primaryColor: Colors.red,
        hintColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
        ),
      ),
      home: AdminPanel(),
    );
  }
}

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  List<Product> products = [
    Product(
      name: 'Classic Analog Leather Watch',
      price: 10000,
      image: 'assets/images/product1.jpg',
      details: 'This timeless watch features a sleek black leather band and a minimalist dial with traditional hour and minute hands. ',
    ),
    Product(
      name: 'Sports Dive Watch',
      price: 1200,
      image: 'assets/images/product2.jpg',
      details: 'Designed for adventure seekers and water enthusiasts, this rugged dive watch boasts a durable stainless steel case and a bold, easy-to-read dial with luminous markers. ',
    ),
    Product(
      name: 'Smart Fitness Tracker Watch',
      price: 30000,
      image: 'assets/images/product3.jpeg',
      details: 'With built-in GPS and customizable workout modes its the perfect companion for achieving fitness goals Plus, receive notifications for calls texts and app alerts all while staying stylish and on trend.',
    ),
      Product(
      name: 'Classic Analog Leather Watch',
      price: 13000,
      image: 'assets/images/product4.jpeg',
      details: 'This timeless watch features a sleek black leather band and a minimalist dial with traditional hour and minute hands. ',
    ),
    Product(
      name: 'Sports Watch',
      price: 8000,
      image: 'assets/images/product5.jpeg',
      details: 'Designed for adventure seekers and water enthusiasts, this rugged dive watch boasts a durable stainless steel case and a bold, easy-to-read dial with luminous markers. ',
    ),
        Product(
      name: 'Leather Watch',
      price: 3000,
      image: 'assets/images/product6.jpeg',
      details: 'This timeless watch features a sleek black leather band and a minimalist dial with traditional hour and minute hands. ',
    ),
  ];

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  void addProduct() {
    setState(() {
      products.add(
        Product(
          name: nameController.text,
          price: double.parse(priceController.text),
          image: 'assets/product_default.jpg',
          details: detailsController.text,
        ),
      );
      nameController.clear();
      priceController.clear();
      detailsController.clear();
    });
  }

  void deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  void editProduct(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: products[index].name),
                onChanged: (value) {
                  products[index].name = value;
                },
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller:
                    TextEditingController(text: products[index].price.toString()),
                onChanged: (value) {
                  products[index].price = double.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Price'),
              ),
              TextField(
                controller:
                    TextEditingController(text: products[index].details),
                onChanged: (value) {
                  products[index].details = value;
                },
                decoration: InputDecoration(labelText: 'Details'),
              ),
              Image.asset(products[index].image),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch Hub'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Admin Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Manage Products'),
              onTap: () {
                // Navigate to manage products page
              },
            ),
            ListTile(
              title: Text('Manage Orders'),
              onTap: () {
                // Navigate to manage orders page
              },
            ),
            ListTile(
              title: Text('Manage Users'),
              onTap: () {
                // Navigate to manage users page
              },
            ),
            ListTile(
              title: Text('Manage Sales'),
              onTap: () {
                // Navigate to manage sales page
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Logout functionality
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(products[index].image),
                  ),
                ),
              ),
              title: Text(
                products[index].name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${products[index].price.toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Details: ${products[index].details}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.lightBlue),
                    onPressed: () {
                      editProduct(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      deleteProduct(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.image, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Text('Add Product'),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Price'),
                    ),
                    TextField(
                      controller: detailsController,
                      decoration: InputDecoration(labelText: 'Details'),
                    ),
                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      addProduct();
                      Navigator.of(context).pop();
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Product {
  String name;
  double price;
  String image;
  String details;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.details,
  });
}