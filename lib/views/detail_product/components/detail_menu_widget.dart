import 'package:bismillahfinalproject/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../view_models/detail_product_view_model.dart';
import '../../../view_models/review_view_model.dart';

class DetailMenuWidget extends StatefulWidget {
  final ProductDetailModel product;
  const DetailMenuWidget({super.key, required this.product});

  @override
  State<DetailMenuWidget> createState() => _DetailMenuWidgetState();
}

class _DetailMenuWidgetState extends State<DetailMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Consumer<DetailProductViewModel>(
        builder: (context, detail, _) {
          if (detail.index == 0) {
            return _detailProduct();
          }
          return _listReview();
        },
      ),
    );
  }

  Widget _listReview() {
    return Consumer<ReviewViewModel>(
      builder: (context, review, _) => ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final data = review.reviews[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        NetworkImage("https://i.ibb.co/PGv8ZzG/me.jpg"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.user.name,
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      RatingBarIndicator(
                        itemSize: 14,
                        rating: review.reviews.isEmpty
                            ? 0.0
                            : double.parse(data.star.toStringAsPrecision(2)),
                        itemBuilder: (context, _) =>
                            Icon(Icons.star, color: Colors.yellow.shade700),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        data.review,
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: review.reviews.length),
    );
  }

  Widget _detailProduct() {
    return Consumer<DetailProductViewModel>(
      builder: (context, detail, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.product.deskripsi),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Color :",
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 40.0,
                  child: ListView.builder(
                    itemCount: detail.selectColor.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var itemColor = detail.selectColor[index];
                      return Container(
                        width: 66.0,
                        height: 36,
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(right: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          border: Border.all(
                            width: 1.0,
                            color: const Color(0xffC0C8C7),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "$itemColor",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
