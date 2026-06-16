import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFFF4F3FB);
  static const cardBackground = Colors.white;
  static const primary = Color(0xFF6C5CE7);
  static const textDark = Color(0xFF1A1A2E);
  static const textGrey = Color(0xFF8B8B9A);
  static const star = Color(0xFFF6B93B);
  static const badgeRed = Color(0xFFE74C3C);
  static const divider = Color(0xFFE9E9F2);

  static const catAllBg = Color(0xFFE6E1FB);
  static const catMenBg = Color(0xFFE3EAFC);
  static const catWomenBg = Color(0xFFFCE4EC);
  static const catShoesBg = Color(0xFFE0F5EC);
  static const catBagsBg = Color(0xFFFCEADB);
  static const catBeautyBg = Color(0xFFE6E1FB);

  static const featureShippingBg = Color(0xFFE6E1FB);
  static const featurePaymentBg = Color(0xFFDFF5E8);
  static const featureSupportBg = Color(0xFFFCEADB);
}

class AppRadius {
  static const card = 16.0;
  static const banner = 20.0;
  static const small = 12.0;
  static const pill = 30.0;
}

class AppTextStyles {
  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const sectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const viewAll = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static const brand = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.8,
    color: AppColors.textGrey,
  );

  static const productName = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const price = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const rating = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const categoryLabel = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static const featureTitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const featureSubtitle = TextStyle(
    fontSize: 11,
    color: AppColors.textGrey,
  );
}
