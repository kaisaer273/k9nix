import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:k9nix/app/core/values/strings.dart';
import 'package:k9nix/app/modules/home/views/widgets/gid_nav_item.dart';
import 'package:k9nix/app/modules/home/views/widgets/info_widget.dart';

import '../../../core/theme/color_theme.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Container(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: const CircleAvatar(
              radius: 100,
              backgroundColor: bgColor,
              child: Icon(
                Icons.person_outline,
                size: 30,
                color: secondaryColor,
              )),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appname,
              style: TextStyle(
                  color: secondaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Thông tin >",
              style: TextStyle(
                color: primaryGrey,
                fontSize: 16,
              ),
            )
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.qr_code_scanner_outlined,
              color: secondaryColor,
              size: 30,
            ),
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          _infoBar(),
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
                    15, // Khoảng cách giữa các phần tử theo trục chính (vertical)
                crossAxisSpacing:
                    15, // Khoảng cách giữa các phần tử theo trục chéo (horizontal)
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
                      onTap: () {}),
                  GridNavItem(
                    icon: Icons.article_outlined,
                    text: order,
                    onTap: () {},
                  ),
                  GridNavItem(
                      icon: Icons.people_alt_outlined,
                      text: phonebook,
                      onTap: () {}),
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

  Container _infoBar() {
    return Container(
      margin: const EdgeInsets.only(
        top: 80,
        left: 16,
        right: 16,
      ),
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bg2Color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    today,
                    style: TextStyle(
                      fontFamily: 'sans_semibold',
                      fontSize: 18,
                      color: primary2Color,
                    ),
                  ),
                  Text(
                    viewProfitLoss,
                    style: TextStyle(
                      fontFamily: 'sans_regular',
                      fontSize: 20,
                      color: secondaryColor,
                    ),
                  )
                ]),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: primary2Color,
                borderRadius: BorderRadius.only(
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
                      width: 1,
                      color: bg2Color,
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
                      width: 1,
                      color: bg2Color,
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
