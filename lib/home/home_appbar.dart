import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeAppBar extends StatelessWidget {
  final String title;
  final int notificationCount;
  final VoidCallback? onMenuTap;
  final VoidCallback? onNotificationTap;

  const HomeAppBar({
    super.key,
    this.title = 'ShopMart',
    this.notificationCount = 0,
    this.onMenuTap,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(Icons.menu, color: AppColors.textDark, size: 26),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          Text(title, style: AppTextStyles.title),
          _NotificationBell(count: notificationCount, onTap: onNotificationTap),
        ],
      ),
    );
  }
}

class _NotificationBell extends StatelessWidget {
  final int count;
  final VoidCallback? onTap;

  const _NotificationBell({required this.count, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.textDark,
            size: 26,
          ),
          if (count > 0)
            Positioned(
              right: -4,
              top: -4,
              child: Container(
                padding: const EdgeInsets.all(4),
                constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                decoration: const BoxDecoration(
                  color: AppColors.badgeRed,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$count',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
