import 'package:car_booking_customer/practice/firebase_data.dart';
import 'package:car_booking_customer/practice/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductFormView extends StatefulWidget {
  ProductFormView({super.key});

  @override
  State<ProductFormView> createState() => _ProductFormViewState();
}

class _ProductFormViewState extends State<ProductFormView> {
  final _title = TextEditingController();
  final _price = TextEditingController();
  final _discountCode = TextEditingController();
  final _quantity = TextEditingController();
  final _discount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<FirebaseData>(context);
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextFormField(
            controller: _title,
            decoration: InputDecoration(hintText: "Enter Title"),
          ),
          TextFormField(
            controller: _price,
            decoration: InputDecoration(hintText: "Enter Price"),
          ),
          TextFormField(
            controller: _discountCode,
            decoration: InputDecoration(hintText: "Enter Discount code"),
          ),
          TextFormField(
            controller: _quantity,
            decoration: InputDecoration(hintText: "Enter Quantity"),
          ),
          TextFormField(
            controller: _discount,
            decoration: InputDecoration(hintText: "0.00"),
          ),
          SizedBox(height: 50),
          TextButton(onPressed: () {}, child: Text("Submit Form")),
          TextButton(
              onPressed: () => db.addNewProduct(generateData()),
              child: Text("Create Product")),
          SizedBox(
            height: 50,
          ),
          ...List.generate(db.getAllProducts.length, (i) {
            final product = db.getAllProducts[i];
            return ListTile(
              title: Text(product.title!),
              subtitle: Text(product.productId!),
            );
          })
        ],
      )),
    );
  }

  ProductModel generateData() {
    return ProductModel(
        title: _title.text, price: double.tryParse(_price.text) ?? 0.0);
  }
}
