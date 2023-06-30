import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:k9nix/app/core/values/strings.dart';
import 'package:k9nix/app/data/models/customer.dart';

import '../controllers/customer_controller.dart';
import 'widgets/bottom_dialog_form.dart';

class CustomerView extends GetView<CustomerController> {
  const CustomerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: Obx(() => ListView.separated(
            itemCount: controller.customers.length,
            itemBuilder: (context, index) {
              var customer = controller.customers[index];
              return ListTile(
                title: Text(customer.name),
                subtitle: Text('${customer.phone}\n${customer.address}'),
              );
            },
            separatorBuilder: (_, __) =>
                // const Padding(padding: EdgeInsets.all(10)),
                const Divider(),
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var result = await Get.bottomSheet(BottomDialogForm());
          if (result != null && result is Customer) {
            controller.addCustomer(result);
          }
        },
        label: const Text('Thêm khách hàng'),
        icon: const Icon(Icons.add),
      ),
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
