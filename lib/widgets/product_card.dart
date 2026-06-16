import 'package:ecommerce_app/home/model/productModel/product_card_data.dart';
import 'package:ecommerce_app/widgets/api_images.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  final ProductCardData product;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppRadius.card),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with optional discount badge
            Stack(
              children: [
                ApiImage(
                  url: product.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                if (product.discountBadge != null)
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.badgeRed,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        product.discountBadge!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand + Favorite
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.brand.toUpperCase(),
                          style: AppTextStyles.brand,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: onFavoriteToggle,
                        child: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 20,
                          color: product.isFavorite
                              ? AppColors.badgeRed
                              : AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Product name
                  Text(
                    product.name,
                    style: AppTextStyles.productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Price row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.displayPrice,
                            style: AppTextStyles.price,
                          ),
                          if (product.originalPrice != null)
                            Text(
                              product.originalPrice!,
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.textGrey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),
                      // Rating (only show if ratingCount > 0)
                      if (product.ratingCount > 0)
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: AppColors.star,
                              size: 16,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              product.rating.toStringAsFixed(1),
                              style: AppTextStyles.rating,
                            ),
                            Text(
                              ' (${product.ratingCount})',
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.textGrey,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCardList extends StatelessWidget {
  final List<ProductCardData> products;
  final void Function(ProductCardData)? onProductTap;
  final void Function(ProductCardData)? onFavoriteToggle;

  const ProductCardList({
    super.key,
    required this.products,
    this.onProductTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          for (int i = 0; i < products.length; i++) ...[
            if (i != 0) const SizedBox(height: 14),
            ProductCard(
              product: products[i],
              onTap: () => onProductTap?.call(products[i]),
              onFavoriteToggle: () => onFavoriteToggle?.call(products[i]),
            ),
          ],
        ],
      ),
    );
  }
}
