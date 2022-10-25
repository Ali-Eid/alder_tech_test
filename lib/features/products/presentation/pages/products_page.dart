import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:test_alder_tech/features/products/presentation/widgets/item_widget.dart';
import '../../../../core/constants.dart';
import '../bloc/prodcuts/products_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int page = 1;
  @override
  void initState() {
    controller.addListener(pagination);
    super.initState();
  }

  void pagination() {
    if ((controller.position.pixels == controller.position.maxScrollExtent)) {
      setState(() {
        page += 1;
        BlocProvider.of<ProductsBloc>(context)
            .add(GetoffsetProductsEvent(page));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 40.h,
        ),
        Center(
          child: Text(
            'Aswaaq',
            style: TextStyle(color: Colors.orange, fontSize: 20.sp),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is LoadedProductsState) {
              return Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: GridView.builder(
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20.h,
                        crossAxisSpacing: 20.w,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return ItemWidget(product: state.products[index]);
                    },
                  ),
                ),
              );
            } else if (state is LoadingProductsState) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
