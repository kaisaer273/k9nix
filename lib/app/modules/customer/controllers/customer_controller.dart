import 'package:get/get.dart';
import 'package:k9nix/app/data/models/customer.dart';

class CustomerController extends GetxController {
  var customers = <Customer>[].obs;

  void addCustomer(Customer customer) {
    customers.add(customer);
  }
}
