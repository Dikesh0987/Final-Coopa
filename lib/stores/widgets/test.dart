import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InventoryWidget extends StatefulWidget {
  final String uid;

  const InventoryWidget({super.key, required this.uid});

  @override
  _InventoryWidgetState createState() => _InventoryWidgetState();
}

class _InventoryWidgetState extends State<InventoryWidget> {
  late CollectionReference _productsRef;

  @override
  void initState() {
    super.initState();
    _productsRef = FirebaseFirestore.instance
        .collection('inventory')
        .doc(widget.uid)
        .collection('products');
  }

  Future<void> _printProductTitles() async {
    QuerySnapshot querySnapshot = await _productsRef.get();
    for (var doc in querySnapshot.docs) {
      print(doc.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _printProductTitles,
          child: Text('Print Product Titles'),
        ),
      ),
    );
  }
}
