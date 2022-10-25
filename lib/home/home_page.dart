import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_alder_tech/features/pages_demo/demo1._page.dart';
import 'package:test_alder_tech/features/pages_demo/demo2_page.dart';
import 'package:test_alder_tech/features/pages_demo/location_page.dart';
import 'package:test_alder_tech/features/pages_demo/setting_page.dart';
import 'package:test_alder_tech/features/products/presentation/bloc/prodcuts/products_bloc.dart';
import 'package:test_alder_tech/features/products/presentation/pages/products_page.dart';

import '../core/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const ProductsPage(),
    const SettingPage(),
    const LocationPage(),
    const Demo1Page(),
    const Demo2Page()
  ];
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5f9ef),
      body: pages[current_index],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.orange,
        child: Container(
          height: 45.h,
          margin: EdgeInsets.only(left: 12.0.w, right: 12.0.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    current_index = 4;
                  });
                },
                iconSize: 27.0.w,
                icon: Icon(
                  Icons.apps_rounded,
                  color: current_index == 4 ? Colors.grey : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    current_index = 3;
                  });
                },
                iconSize: 27.0.w,
                icon: Icon(
                  Icons.line_weight_sharp,
                  color: current_index == 3 ? Colors.grey : Colors.white,
                ),
              ),
              SizedBox(
                width: 50.0.w,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    current_index = 2;
                  });
                },
                iconSize: 27.0.w,
                icon: Icon(
                  Icons.location_on_outlined,
                  color: current_index == 2 ? Colors.grey : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    BlocProvider.of<ProductsBloc>(context)
                        .add(const GetoffsetProductsEvent(2));
                    current_index = 1;
                  });
                },
                iconSize: 27.0.w,
                icon: Icon(
                  Icons.settings,
                  color: current_index == 1 ? Colors.grey : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          current_index == 0
              ? controller.animateTo(
                  controller.position.minScrollExtent,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                )
              : null;
          setState(() {
            current_index = 0;
          });
        },
        backgroundColor: current_index == 0 ? Colors.white : Colors.orange,
        child: Icon(
          Icons.home,
          color: current_index == 0 ? Colors.orange : Colors.white,
        ),
      ),
    );
  }
}
