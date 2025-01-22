import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product/product.dart';

class HomeController extends GetxController{
  FirebaseFirestore firestore= FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameCtrl=TextEditingController();
  TextEditingController productDescriptionCrtl=TextEditingController();
  TextEditingController productImgCtrl=TextEditingController();
  TextEditingController productPriceCtrl=TextEditingController();

  String category='general';
  String brand='un branded';
  bool offer=false;

  List<Product> products=[];
 @override
  void onInit() async {
    // TODO: implement onInit
   productCollection=firestore.collection('products');
   await fetchProducts();
    super.onInit();
  }
  addProdect() {
   try {
    DocumentReference doc = productCollection.doc();
    Product product = Product(
        id: doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCrtl.text,
        price: double.tryParse(productPriceCtrl.text),
        brand: brand,
        image: productImgCtrl.text,
        offer: offer
    );
    final ProductJson = product.toJson();
    doc.set(ProductJson);
    Get.snackbar('Success', 'Product added successfully',colorText:Colors.green);
    setValuesDefault();
   } catch(e){
    Get.snackbar('Error',e.toString() ,colorText:Colors.green);
    print(e);
   }
  }

  fetchProducts()async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product>retrevedProducts = productSnapshot.docs.map((doc) =>
          Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      products.clear();
      products.assignAll(retrevedProducts);
      Get.snackbar('Success','product fatch successfully',colorText: Colors.green );
    }catch(e){
      Get.snackbar('Error',e.toString(),colorText: Colors.red );
      print(e);
    }finally{
        update();
    }
  }

  deleteProduct(String id)async{
   try{
     await productCollection.doc(id).delete();
     fetchProducts();
   }catch(e){
     Get.snackbar('Error', e.toString(),colorText: Colors.red );
     print(e);
   }

  }
  setValuesDefault(){
   productNameCtrl.clear();
   productDescriptionCrtl.clear();
   productImgCtrl.clear();
   productPriceCtrl.clear();

   category='general';
   brand='un branded';
   offer=false;
   update();


  }

}