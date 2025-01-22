import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_admin/controller/home_controller.dart';
import 'package:shoping_admin/widgets/dropdown_btn.dart';


class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      // assignId: true,
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Add Product"),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Add New Products', style: TextStyle(fontSize: 30,
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  TextField(
                    controller: ctrl.productNameCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: Text('Product Name'),
                        hintText: 'Enter Your Product Name'
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: ctrl.productDescriptionCrtl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: Text('Product Descriptions'),
                        hintText: 'Enter Your Product Descriptions'
                    ),
                    maxLines: 5,
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: ctrl.productImgCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: Text('Product Image URL'),
                        hintText: 'Enter Your Product URL'
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: ctrl.productPriceCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: Text('Product Price'),
                        hintText: 'Enter Your Product Price'
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(

                    children: [
                      Flexible(
                          child: DropdownBtn(
                            item: ['Cate1', 'Cate2', 'Cate3',],
                            selectedItemText: ctrl.category,
                            onSelected: (selectedValue) {
                             ctrl.category = selectedValue ??'general';
                             ctrl.update();
                            },
                          )),
                      Flexible(
                          child: DropdownBtn(
                            item: ['Brand1', 'Brand2', 'Brand3'],
                            selectedItemText: ctrl.brand,
                            onSelected: (selectedValue) {
                              ctrl.brand = selectedValue ??'un branded';
                              ctrl.update();
                            },
                          )),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text('Offer Product ?'),
                  SizedBox(height: 15,),
                  DropdownBtn(
                    item: ['true', 'false'],
                    selectedItemText: ctrl.offer.toString(),
                    onSelected: (selectedValue) {
                     ctrl.offer=bool.tryParse(selectedValue ?? 'false')?? false;
                     ctrl.update();
                    },
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          foregroundColor: Colors.white
                      ),
                      onPressed: () {
                        ctrl.addProdect();
                      },
                      child: Text('Add Product')
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
