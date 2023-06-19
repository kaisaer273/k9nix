import 'package:get/get.dart';
import 'package:k9nix/app/data/models/product.dart';

class ProductController extends GetxController {
  final List<Product> _data = [
    Product(
        name: "Product 1",
        ingredient: "Ingredient 1",
        unit: "Unit 1",
        imgUrl: "imgUrl1",
        skuCode: "skuCode1",
        barCode: "barCode1",
        purchasePrice: 100,
        salePrice: 150,
        isAvaiable: true),
    Product(
        name: "Product 2",
        ingredient: "Ingredient 2",
        unit: "Unit 2",
        imgUrl: "imgUrl2",
        skuCode: "skuCode2",
        barCode: "barCode2",
        purchasePrice: 200,
        salePrice: 250,
        isAvaiable: false),
    Product(
        name: "Product 3",
        ingredient: "Ingredient 3",
        unit: "Unit 3",
        imgUrl: "imgUrl3",
        skuCode: "skuCode3",
        barCode: "barCode3",
        purchasePrice: 300,
        salePrice: 350,
        isAvaiable: true),
    Product(
        name: "Product 4",
        ingredient: "Ingredient 4",
        unit: "Unit 4",
        imgUrl: "imgUrl4",
        skuCode: "skuCode4",
        barCode: "barCode4",
        purchasePrice: 400,
        salePrice: 450,
        isAvaiable: false),
    Product(
        name: "Product 5",
        ingredient: "Ingredient 5",
        unit: "Unit 5",
        imgUrl: "imgUrl5",
        skuCode: "skuCode5",
        barCode: "barCode5",
        purchasePrice: 500,
        salePrice: 550,
        isAvaiable: true),
    Product(
        name: "Product 6",
        ingredient: "Ingredient 6",
        unit: "Unit 6",
        imgUrl: "imgUrl6",
        skuCode: "skuCode6",
        barCode: "barCode6",
        purchasePrice: 600,
        salePrice: 650,
        isAvaiable: false),
    Product(
        name: "Product 7",
        ingredient: "Ingredient 7",
        unit: "Unit 7",
        imgUrl: "imgUrl7",
        skuCode: "skuCode7",
        barCode: "barCode7",
        purchasePrice: 700,
        salePrice: 750,
        isAvaiable: true),
    Product(
        name: "Product 8",
        ingredient: "Ingredient 8",
        unit: "Unit 8",
        imgUrl: "imgUrl8",
        skuCode: "skuCode8",
        barCode: "barCode8",
        purchasePrice: 800,
        salePrice: 850,
        isAvaiable: false),
    Product(
        name: "Product 9",
        ingredient: "Ingredient 9",
        unit: "Unit 9",
        imgUrl: "imgUrl9",
        skuCode: "skuCode9",
        barCode: "barCode9",
        purchasePrice: 900,
        salePrice: 950,
        isAvaiable: true),
    Product(
        name: "Product 10",
        ingredient: "Ingredient 10",
        unit: "Unit 10",
        imgUrl: "imgUrl10",
        skuCode: "skuCode10",
        barCode: "barCode10",
        purchasePrice: 1000,
        salePrice: 1050,
        isAvaiable: false),
    Product(
        name: "Product 11",
        ingredient: "Ingredient 11",
        unit: "Unit 11",
        imgUrl: "imgUrl11",
        skuCode: "skuCode11",
        barCode: "barCode11",
        purchasePrice: 1100,
        salePrice: 1150,
        isAvaiable: true),
    Product(
        name: "Product 12",
        ingredient: "Ingredient 12",
        unit: "Unit 12",
        imgUrl: "imgUrl12",
        skuCode: "skuCode12",
        barCode: "barCode12",
        purchasePrice: 1200,
        salePrice: 1250,
        isAvaiable: false),
    Product(
        name: "Product 13",
        ingredient: "Ingredient 13",
        unit: "Unit 13",
        imgUrl: "imgUrl13",
        skuCode: "skuCode13",
        barCode: "barCode13",
        purchasePrice: 1300,
        salePrice: 1350,
        isAvaiable: true),
    Product(
        name: "Product 14",
        ingredient: "Ingredient 14",
        unit: "Unit 14",
        imgUrl: "imgUrl14",
        skuCode: "skuCode14",
        barCode: "barCode14",
        purchasePrice: 1400,
        salePrice: 1450,
        isAvaiable: false),
    Product(
        name: "Product 15",
        ingredient: "Ingredient 15",
        unit: "Unit 15",
        imgUrl: "imgUrl15",
        skuCode: "skuCode15",
        barCode: "barCode15",
        purchasePrice: 1500,
        salePrice: 1550,
        isAvaiable: true),
    Product(
        name: "Product 16",
        ingredient: "Ingredient 16",
        unit: "Unit 16",
        imgUrl: "imgUrl16",
        skuCode: "skuCode16",
        barCode: "barCode16",
        purchasePrice: 1600,
        salePrice: 1650,
        isAvaiable: false),
    Product(
        name: "Product 17",
        ingredient: "Ingredient 17",
        unit: "Unit 17",
        imgUrl: "imgUrl17",
        skuCode: "skuCode17",
        barCode: "barCode17",
        purchasePrice: 1700,
        salePrice: 1750,
        isAvaiable: true),
    Product(
        name: "Product 18",
        ingredient: "Ingredient 18",
        unit: "Unit 18",
        imgUrl: "imgUrl18",
        skuCode: "skuCode18",
        barCode: "barCode18",
        purchasePrice: 1800,
        salePrice: 1850,
        isAvaiable: false),
    Product(
        name: "Product 19",
        ingredient: "Ingredient 19",
        unit: "Unit 19",
        imgUrl: "imgUrl19",
        skuCode: "skuCode19",
        barCode: "barCode19",
        purchasePrice: 1900,
        salePrice: 1950,
        isAvaiable: true),
    Product(
        name: "Product 20",
        ingredient: "Ingredient 20",
        unit: "Unit 20",
        imgUrl: "imgUrl20",
        skuCode: "skuCode20",
        barCode: "barCode20",
        purchasePrice: 2000,
        salePrice: 2050,
        isAvaiable: false),
  ];
  RxList<Product> filteredProductList = RxList([]); // Danh sách đã lọc
  var isShowSearchBar = false.obs;

  @override
  void onInit() {
    super.onInit();
    initFlilterList(); // Bắt đầu bằng việc hiển thị toàn bộ danh sách
  }

  void initFlilterList() {
    filteredProductList.value = _data;
  }

  void filterproduct(String query) {
    // Lọc danh sách dựa trên query
    filteredProductList.value = _data.where((item) {
      return item.name!.toLowerCase().contains(query.toLowerCase()) ||
          item.ingredient!.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  List<Product> get productList => _data;
}
