import 'package:ecommerce_app/core/router/app_router.dart';
import 'package:ecommerce_app/home/home_appbar.dart';
import 'package:ecommerce_app/home/model/home_model.dart';
import 'package:ecommerce_app/home/model/productModel/product_card_data.dart';
import 'package:ecommerce_app/home/provider/category_notfier.dart';
import 'package:ecommerce_app/home/provider/home_provider.dart';
import 'package:ecommerce_app/widgets/bottom_nav_bar.dart';
import 'package:ecommerce_app/widgets/carousel_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_theme.dart';
import '../widgets/category_item.dart';
import '../widgets/feature_card.dart';

import '../widgets/product_card.dart';

import '../widgets/search_bar_widget.dart';
import '../widgets/section_header.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomePage> {
  int _selectedCategory = 0;
  int _selectedNavIndex = 0;
  final Set<String> _favoriteIds = {};

  void _toggleFavorite(String id) {
    setState(() {
      _favoriteIds.contains(id)
          ? _favoriteIds.remove(id)
          : _favoriteIds.add(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeAsync = ref.watch(homeDataProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: homeAsync.when(
          data: (home) => _buildContent(home),
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
          error: (error, stack) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.badgeRed,
                    size: 40,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Failed to load\n$error',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.textGrey),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.invalidate(homeDataProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomNavBar(
        items: const [
          BottomNavItemData(icon: Icons.home_rounded, label: 'Home'),
          BottomNavItemData(icon: Icons.grid_view_rounded, label: 'Categories'),
          BottomNavItemData(
            icon: Icons.shopping_cart_outlined,
            label: 'Cart',
            badgeCount: 2,
          ),
          BottomNavItemData(
            icon: Icons.person_outline_rounded,
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedNavIndex,
        onTap: (i) => setState(() => _selectedNavIndex = i),
      ),
    );
  }

  Widget _buildContent(HomeModel home) {
    final featured = home.feature
        .map((e) => ProductCardData.fromFeatured(e))
        .map((p) => p.copyWith(isFavorite: _favoriteIds.contains(p.id)))
        .toList();

    final deals = home.deals
        .map((e) => ProductCardData.fromDeal(e))
        .map((p) => p.copyWith(isFavorite: _favoriteIds.contains(p.id)))
        .toList();

    final newArrivals = home.newArrivals
        .map((e) => ProductCardData.fromFeatured(e))
        .map((p) => p.copyWith(isFavorite: _favoriteIds.contains(p.id)))
        .toList();

    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () => ref.refresh(homeDataProvider.future),
      child: ListView(
        padding: const EdgeInsets.only(bottom: 8),
        children: [
          HomeAppBar(
            notificationCount: 3,
            onMenuTap: () {},
            onNotificationTap: () {},
          ),
          const SizedBox(height: 8),
          SearchBarWidget(onChanged: (_) {}, onScanTap: () {}),
          const SizedBox(height: 20),

          // ── Banner Carousel ───────────────────────────────────────
          PromoBannerCarousel(
            banners: home.banners,
            onButtonTap: (banner) {
              // Use banner.linkvalue to navigate
              // placement: "hero" | "featured" | "deals"
              // linkValue: "/deals" | "fruits-vegetables" | "black-tea-200-g"
            },
          ),
          const SizedBox(height: 24),

          // ── Categories ────────────────────────────────────────────
          // CategoryList(
          //   categories: home.categories,
          //   selectedIndex: _selectedCategory,
          //   onCategorySelected: (i) => setState(() => _selectedCategory = i),
          // ),
          ref
              .watch(categoryNotifierProvider)
              .maybeWhen(
                orElse: () => Container(),
                data: (data) => ListView.builder(
                  itemBuilder: (context, index) =>
                      ActionChip(label: Text(data[index].categoryName)),
                ),
              ),

          const SizedBox(height: 20),

          // ── Trust Badges ──────────────────────────────────────────
          FeatureCardRow(
            cards: const [
              FeatureCard(
                icon: Icons.local_shipping_outlined,
                iconColor: AppColors.primary,
                iconBackgroundColor: AppColors.featureShippingBg,
                title: 'Free Delivery',
                subtitle: 'On orders over Rs. 500',
              ),
              FeatureCard(
                icon: Icons.verified_user_outlined,
                iconColor: Color(0xFF2EAE6D),
                iconBackgroundColor: AppColors.featurePaymentBg,
                title: 'Secure Pay',
                subtitle: '100% protected',
              ),
              FeatureCard(
                icon: Icons.headset_mic_outlined,
                iconColor: Color(0xFFE08A3C),
                iconBackgroundColor: AppColors.featureSupportBg,
                title: '24/7 Support',
                subtitle: "We're here",
              ),
            ],
          ),
          const SizedBox(height: 24),

          // ── Featured ──────────────────────────────────────────────
          if (featured.isNotEmpty) ...[
            SectionHeader(title: 'Featured', onActionTap: () {}),
            const SizedBox(height: 14),
            ProductCardList(
              products: featured,
              onProductTap: (p) => ProductDetailRoute(id: p.id).push(context),
              onFavoriteToggle: (p) => _toggleFavorite(p.id),
            ),
            const SizedBox(height: 24),
          ],

          // ── Today's Deals ─────────────────────────────────────────
          if (deals.isNotEmpty) ...[
            SectionHeader(title: "Today's Deals", onActionTap: () {}),
            const SizedBox(height: 14),
            ProductCardList(
              products: deals,
              onProductTap: (p) {},
              onFavoriteToggle: (p) => _toggleFavorite(p.id),
            ),
            const SizedBox(height: 24),
          ],

          // ── New Arrivals ───────────────────────────────────────────
          if (newArrivals.isNotEmpty) ...[
            SectionHeader(title: 'New Arrivals', onActionTap: () {}),
            const SizedBox(height: 14),
            ProductCardList(
              products: newArrivals,
              onProductTap: (p) {},
              onFavoriteToggle: (p) => _toggleFavorite(p.id),
            ),
          ],

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
