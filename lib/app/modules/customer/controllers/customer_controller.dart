// Tạo controller CustomerController kế thừa từ GetxController
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9nix/app/data/models/customer.dart';
import 'package:k9nix/app/modules/customer/views/widgets/custom_snack_bar.dart';

import 'package:k9nix/app/modules/customer/views/widgets/customer_full_screen_dialog.dart';

class CustomerController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController, phoneController, addressController;

  // Firestore operation
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  RxList<Customer> customers = RxList<Customer>([]);

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    collectionReference = firebaseFirestore.collection("customers");
    customers.bindStream(getAllCustomers());
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Vui lòng nhập tên khách hàng";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.isNotEmpty && (!RegExp(r'^[0-9]{10,12}$').hasMatch(value))) {
      return "hãy nhập đúng số điện thoại";
    }
    return null;
  }

  void saveUpdateCustomer(String name, String phone, String address,
      String docId, int addEditFlag) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    if (addEditFlag == 1) {
      CustomFullScreenDialog.showDialog();

      collectionReference
          .add(Customer(name: name, phone: phone, address: address).toMap())
          .whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Customer Added",
            message: "Customer added successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.green);
      });
    } else if (addEditFlag == 2) {
      //update
      CustomFullScreenDialog.showDialog();
      collectionReference.doc(docId).update(
          {'name': name, phone: 'phone', 'address': address}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Customer Updated",
            message: "Customer updated successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.red);
      });
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneController.dispose();
    nameController.dispose();
    addressController.dispose();
  }

  void clearEditingControllers() {
    phoneController.clear();
    nameController.clear();
    addressController.clear();
  }

  Stream<List<Customer>> getAllCustomers() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => Customer.fromDocument(item)).toList());

  void deleteData(String docId) {
    CustomFullScreenDialog.showDialog();
    collectionReference.doc(docId).delete().whenComplete(() {
      CustomFullScreenDialog.cancelDialog();
      Get.back();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Customer Deleted",
          message: "Customer deleted successfully",
          backgroundColor: Colors.green);
    }).catchError((error) {
      CustomFullScreenDialog.cancelDialog();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Something went wrong",
          backgroundColor: Colors.red);
    });
  }
}
