import 'package:ecommerce_app/home/model/list_of_models.dart';
import 'package:ecommerce_app/widgets/api_images.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A single category chip. If [imageUrl] is provided (from your API),
/// it's shown as a circular network image; otherwise [icon] is used
/// (used for the static "All" chip).
class CategoryItem extends StatelessWidget {
  final String label;
  final String? imageUrl;
  final IconData? icon;
  final Color backgroundColor;
  final Color iconColor;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryItem({
    super.key,
    required this.label,
    this.imageUrl,
    this.icon,
    this.backgroundColor = AppColors.catAllBg,
    this.iconColor = AppColors.primary,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(color: AppColors.primary, width: 2)
                  : null,
            ),
            alignment: Alignment.center,
            child: hasImage
                ? ClipOval(
                    child: ApiImage(
                      url: imageUrl!,
                      width: 56,
                      height: 56,
                      borderRadius: BorderRadius.circular(28),
                    ),
                  )
                : Icon(
                    icon ?? Icons.category_rounded,
                    color: iconColor,
                    size: 24,
                  ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 64,
            child: Text(
              label,
              style: AppTextStyles.categoryLabel,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

/// Horizontal category row. Always prepends a static "All" chip
/// (index 0), followed by the API categories (index 1..n).
class CategoryList extends StatelessWidget {
  final List<Category> categories;
  final int selectedIndex;
  final ValueChanged<int>? onCategorySelected;

  const CategoryList({
    super.key,
    required this.categories,
    this.selectedIndex = 0,
    this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final itemCount = categories.length + 1;

    return SizedBox(
      height: 92,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(width: 18),
        itemBuilder: (context, index) {
          if (index == 0) {
            return CategoryItem(
              label: 'All',
              icon: Icons.apps_rounded,
              backgroundColor: AppColors.catAllBg,
              iconColor: AppColors.primary,
              isSelected: selectedIndex == 0,
              onTap: () => onCategorySelected?.call(0),
            );
          }
          final cat = categories[index - 1];
          return CategoryItem(
            label: cat.name,
            imageUrl: cat.imageUrl,
            backgroundColor: AppColors.catMenBg,
            isSelected: selectedIndex == index,
            onTap: () => onCategorySelected?.call(index),
          );
        },
      ),
    );
  }
}
