import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:k9nix/app/core/theme/app_color.dart';
import 'package:k9nix/app/core/values/strings.dart';
import 'package:k9nix/app/global_widgets/gid_nav_item.dart';
import 'package:k9nix/app/global_widgets/info_widget.dart';

import '../../../core/theme/theme_services.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appname,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: LightThemeColor.accent),
            ),
            Text(
              "Thông tin >",
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                ThemeServices().switchTheme();
              },
              child: const Icon(
                Icons.qr_code_scanner_outlined,
                color: LightThemeColor.accent,
                size: 30,
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          _infoBar(context),
          _gridNavigationBar(),
        ],
      )),
    );
  }

  Expanded _gridNavigationBar() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 4, // Số lượng cột trong lưới
                mainAxisSpacing:
                    16, // Khoảng cách giữa các phần tử theo trục chính (vertical)
                crossAxisSpacing:
                    16, // Khoảng cách giữa các phần tử theo trục chéo (horizontal)
                childAspectRatio: 1, // Tỷ lệ khung hình của mỗi phần tử
                children: [
                  GridNavItem(
                      icon: Icons.warehouse_outlined,
                      text: storage,
                      onTap: () {
                        Get.toNamed('/storage');
                      }),
                  GridNavItem(
                      icon: Icons.list_alt_outlined,
                      text: product,
                      onTap: () {
                        Get.toNamed('/product');
                      }),
                  GridNavItem(
                      icon: Icons.post_add_rounded,
                      text: neworder,
                      onTap: () {
                        Get.toNamed('/product-order');
                      }),
                  GridNavItem(
                    icon: Icons.article_outlined,
                    text: order,
                    onTap: () {},
                  ),
                  GridNavItem(
                      icon: Icons.people_alt_outlined,
                      text: phonebook,
                      onTap: () {
                        Get.toNamed("/customer");
                      }),
                  GridNavItem(
                      icon: Icons.event_busy_outlined,
                      text: paybook,
                      onTap: () {}),
                  GridNavItem(
                      icon: Icons.bar_chart_outlined,
                      text: reports,
                      onTap: () {}),
                  GridNavItem(
                      icon: Icons.more_horiz_outlined,
                      text: others,
                      onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _infoBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 80,
        left: 16,
        right: 16,
      ),
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(today, style: Theme.of(context).textTheme.displaySmall),
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              child: Row(children: [
                const Expanded(
                  child: InfoWidget(
                    title: income,
                    icon: Icons.bar_chart_outlined,
                  ),
                ),
                Container(
                    height: 120,
                    decoration: const BoxDecoration(
                        border: Border(
                            right: BorderSide(
                      width: 2,
                      color: Colors.white60,
                    )))),
                const Expanded(
                    child: InfoWidget(
                  title: numorder,
                  icon: Icons.article_outlined,
                )),
                Container(
                    height: 120,
                    decoration: const BoxDecoration(
                        border: Border(
                            right: BorderSide(
                      width: 2,
                      color: Colors.white60,
                    )))),
                const Expanded(
                  child: InfoWidget(
                    title: profit,
                    icon: Icons.monetization_on_outlined,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
