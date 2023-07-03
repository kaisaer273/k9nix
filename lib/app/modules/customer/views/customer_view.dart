import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:k9nix/app/core/values/strings.dart';

import '../controllers/customer_controller.dart';

class CustomerView extends GetView<CustomerController> {
  const CustomerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.customers.length,
          itemBuilder: (context, index) => Card(
            color: Theme.of(context).colorScheme.secondary,
            child: ListTile(
              title: Text(controller.customers[index].name),
              subtitle: Text(controller.customers[index].phone ?? ""),
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Text(
                  controller.customers[index].name.substring(0, 1).capitalize!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                onPressed: () {
                  displayDeleteDialog(controller.customers[index].id!);
                },
              ),
              onTap: () {
                controller.nameController.text =
                    controller.customers[index].name;
                controller.phoneController.text =
                    controller.customers[index].phone!;
                controller.addressController.text =
                    controller.customers[index].address!;
                _buildAddEditCustomerView(context,
                    text: 'Cập nhật',
                    addEditFlag: 2,
                    docId: controller.customers[index].id!);
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _buildAddEditCustomerView(context,
              text: 'Thêm', addEditFlag: 1, docId: '');
        },
        label: const Text('Thêm khách hàng'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  _buildAddEditCustomerView(BuildContext context,
      {String? text, int? addEditFlag, String? docId}) {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          color: Color(0xff1E2746),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('$text khách hàng',
                        style: Theme.of(context).textTheme.headlineMedium),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    cursorColor: Theme.of(context).colorScheme.tertiary,
                    decoration: InputDecoration(
                      hintStyle: Theme.of(context).textTheme.headlineSmall,
                      labelStyle: Theme.of(context).textTheme.headlineSmall,
                      labelText: 'Tên khách hàng',
                      border: const OutlineInputBorder(),
                    ),
                    controller: controller.nameController,
                    validator: (value) {
                      return controller.validateName(value!);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Theme.of(context).colorScheme.tertiary,
                    decoration: InputDecoration(
                      hintStyle: Theme.of(context).textTheme.headlineSmall,
                      labelStyle: Theme.of(context).textTheme.headlineSmall,
                      labelText: 'Số điện thoại',
                      border: const OutlineInputBorder(),
                    ),
                    controller: controller.phoneController,
                    validator: (value) {
                      return controller.validatePhone(value!);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    cursorColor: Theme.of(context).colorScheme.tertiary,
                    decoration: InputDecoration(
                      hintStyle: Theme.of(context).textTheme.headlineSmall,
                      labelStyle: Theme.of(context).textTheme.headlineSmall,
                      labelText: 'Địa chỉ',
                      border: const OutlineInputBorder(),
                    ),
                    controller: controller.addressController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: Get.context!.width, height: 45),
                    child: ElevatedButton(
                      child: Text(
                        text!,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onPressed: () {
                        controller.saveUpdateCustomer(
                            controller.nameController.text,
                            controller.phoneController.text,
                            controller.addressController.text,
                            docId!,
                            addEditFlag!);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  displayDeleteDialog(String docId) {
    Get.defaultDialog(
      title: "Delete Customer",
      titleStyle: const TextStyle(fontSize: 20),
      middleText: 'Are you sure to delete customer ?',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.grey[350],
      onCancel: () {},
      onConfirm: () {
        controller.deleteData(docId);
      },
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 30,
          )),
      title: Text(
        phonebook,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
