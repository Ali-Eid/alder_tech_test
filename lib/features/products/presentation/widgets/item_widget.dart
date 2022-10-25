import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_alder_tech/features/products/domain/entity/products_entity.dart';

import '../../../../core/constants.dart';

class ItemWidget extends StatelessWidget {
  final ProductsEntity product;
  const ItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(urlImage + product.image_url),
              width: 100.w,
              height: 75.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              product.name,
              style: TextStyle(color: Colors.orange, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
