import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';
import '../../../view_models/review_view_model.dart';

class DetailInfoProduct extends StatelessWidget {
  final ProductDetailModel product;
  const DetailInfoProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style:
                GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _ratingBarProduct(),
              const Spacer(),
              Text("Rp.${product.harga}",
                  style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 19,
                      fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        ],
      ),
    );
  }

  Widget _ratingBarProduct() {
    return Consumer<ReviewViewModel>(
      builder: (context, review, _) {
        return Row(
          children: [
            RatingBarIndicator(
              itemSize: 16,
              rating: review.reviews.isEmpty
                  ? 0.0
                  : double.parse(
                      review.averageSumRating.toStringAsPrecision(2)),
              itemBuilder: (context, _) =>
                  Icon(Icons.star, color: Colors.yellow.shade700),
            ),
            const SizedBox(width: 8),
            Text(
              review.reviews.isEmpty
                  ? '0.0'
                  : review.averageSumRating.toStringAsPrecision(2),
              style: TextStyle(fontSize: 14, color: Colors.yellow.shade700),
            ),
          ],
        );
      },
    );
  }
}
