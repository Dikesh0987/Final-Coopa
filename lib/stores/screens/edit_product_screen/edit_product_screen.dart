import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../theme/style.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  // for add new products bottom shit
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // form
  late String _productName;
  late double _productPrice;
  late int _productQuantity;
  late double _productDiscountedPrice;
  late String _productDescription;

  // for image file
  String? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Primary0,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Primary0,
          elevation: 0,
          centerTitle: false,
          title: Text(
            "Edit",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  FontAwesomeIcons.xmark,
                  color: Colors.black,
                  size: 20,
                ))
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        GestureDetector(
                          onTap: _showBottomShit,
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add_a_photo,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                              floatingLabelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              fillColor: Colors.black,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Product Name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter product name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _productName = value!;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                              floatingLabelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              fillColor: Colors.black,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Product Price'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter product price';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _productPrice = double.parse(value!);
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                              floatingLabelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              fillColor: Colors.black,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Product Avalibel Quantity'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter product quantity';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _productQuantity = int.parse(value!);
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal),
                            floatingLabelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            fillColor: Colors.black,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Product Discounted Price (Optional)',
                          ),
                          onSaved: (value) {
                            if (value!.isNotEmpty) {
                              _productDiscountedPrice = double.parse(value);
                            } else {
                              // _productDiscountedPrice = null;
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                              floatingLabelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              fillColor: Colors.black,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Product Description'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter product description';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _productDescription = value!;
                          },
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topRight,
                          child: MaterialButton(
                            minWidth: 150,
                            height: 50,
                            child: Text(
                              'Save',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                // TODO: Implement saving product to database

                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                      ])))),
        ));
  }

  // Show Bottom Shit for uploding pic .
  void _showBottomShit() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) {
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 30, bottom: 60),
            children: [
              Text(
                "Pick Product Pictures ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        // Pick an image
                        final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery, imageQuality: 80);

                        if (image != null) {
                          print("Image Path : ${image.path}");
                          //update image
                          setState(() {
                            _image = image.path;
                          });

                          //for hide bottom sheet
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Colors.white,
                          fixedSize: Size(80, 80)),
                      child: Image.asset('assets/images/picture.png')),
                  ElevatedButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        // Pick an image
                        final XFile? image = await picker.pickImage(
                            source: ImageSource.camera, imageQuality: 80);

                        if (image != null) {
                          print("Image Path : ${image.path}");
                          //update image
                          setState(() {
                            _image = image.path;
                          });

                          //for hide bottom sheet
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Colors.white,
                          fixedSize: Size(80, 80)),
                      child: Image.asset('assets/images/camera.png')),
                ],
              )
            ],
          );
        });
  }
}
