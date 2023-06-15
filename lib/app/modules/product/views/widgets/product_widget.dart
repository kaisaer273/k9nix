import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9nix/app/modules/product/controllers/product_controller.dart';

class ProductWidget extends StatelessWidget {
  final productController = Get.put(ProductController());

  ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            cursorColor: const Color.fromRGBO(77, 171, 150, 1),
            onChanged: (value) {
              productController.filterMedicine(value);
            },
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
          ),
        ),
        Expanded(
          child: Obx(() {
            final filteredMedicineList = productController.filteredMedicineList;
            return ListView.builder(
                itemCount: filteredMedicineList.length,
                itemBuilder: (BuildContext context, int index) {
                  return MedicineCard(
                    index: index,
                    productController: productController,
                    filteredMedicineList: filteredMedicineList,
                  );
                });
          }),
        ),
      ]),
    );
  }
}

class MedicineCard extends StatelessWidget {
  final int index;
  final ProductController productController;
  final List<dynamic> filteredMedicineList;
  const MedicineCard(
      {super.key,
      required this.index,
      required this.productController,
      required this.filteredMedicineList});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.medication),
        title: Text(
          filteredMedicineList[index].genericName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              filteredMedicineList[index].activeIngredientName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Row(
              children: [
                Text("${filteredMedicineList[index].priceOut3} VND"),
                const Text("/"),
                Text(filteredMedicineList[index].volume3.toString())
              ],
            ),
          ],
        ),
        trailing: Obx(() => GestureDetector(
              onTap: () {
                productController.addMedicine(filteredMedicineList[index]);
              },
              child: (productController.medicinesInCart
                      .containsKey(filteredMedicineList[index]))
                  ? const Icon(
                      Icons.assignment_add,
                      color: Color.fromRGBO(77, 171, 150, 1),
                    )
                  : const Icon(Icons.assignment_add),
            )),
      ),
    );
  }
}
