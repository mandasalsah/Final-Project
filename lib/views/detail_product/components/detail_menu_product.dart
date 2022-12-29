import 'package:bismillahfinalproject/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/detail_product_view_model.dart';

class DetailMenuProduct extends StatelessWidget {
  final ProductDetailModel product;
  const DetailMenuProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProductViewModel>(
      builder: (context, detail, _) => Row(
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => detail.changeIndex(0),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: detail.index == 0
                        ? BorderSide(color: Colors.grey.shade700, width: 2)
                        : BorderSide(color: Colors.grey.shade700, width: 1),
                  ),
                ),
                child: Text(
                  "Details",
                  style: detail.index == 0
                      ? const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)
                      : const TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => detail.changeIndex(1),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: detail.index == 1
                        ? BorderSide(color: Colors.grey.shade700, width: 2)
                        : BorderSide(color: Colors.grey.shade700, width: 1),
                  ),
                ),
                child: Text(
                  "Review",
                  style: detail.index == 1
                      ? const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)
                      : const TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
