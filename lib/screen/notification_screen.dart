import 'package:flutter/material.dart';

import '../main.dart';

class NotificationItemData {
  final IconData icon;
  final String title;
  final String description;
  final String time;
  final bool highlighted;

  const NotificationItemData({
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    this.highlighted = false,
  });
}

class NotificationSection {
  final String label;
  final List<NotificationItemData> items;

  const NotificationSection({required this.label, required this.items});
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static const List<NotificationSection> sections = [
    NotificationSection(
      label: 'Today',
      items: [
        NotificationItemData(
          icon: Icons.calendar_today_rounded,
          title: 'Scheduled Appointment',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          time: '2 M',
        ),
        NotificationItemData(
          icon: Icons.event_repeat_rounded,
          title: 'Scheduled Change',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          time: '2 H',
          highlighted: true,
        ),
        NotificationItemData(
          icon: Icons.description_rounded,
          title: 'Medical Notes',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          time: '3 H',
        ),
      ],
    ),
    NotificationSection(
      label: 'Yesterday',
      items: [
        NotificationItemData(
          icon: Icons.calendar_today_rounded,
          title: 'Scheduled Appointment',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          time: '1 D',
        ),
      ],
    ),
    NotificationSection(
      label: '15 April',
      items: [
        NotificationItemData(
          icon: Icons.chat_bubble_outline_rounded,
          title: 'Medical History Update',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          time: '5 D',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 8),
          _buildTodayMarkAllRow(),
          const SizedBox(height: 16),
          for (final section in sections) ...[
            _buildSectionLabel(section.label),
            const SizedBox(height: 12),
            for (final item in section.items) ...[
              _buildNotificationTile(item),
              const SizedBox(height: 14),
            ],
            const SizedBox(height: 6),
          ],
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded,
            color: AppColors.dark, size: 20),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: const Text(
        'Notification',
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'News',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                SizedBox(width: 6),
                Icon(Icons.circle, color: AppColors.white, size: 6),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTodayMarkAllRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPill('Today'),
        const Text(
          'Mark all',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionLabel(String label) => _buildPill(label);

  Widget _buildPill(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildNotificationTile(NotificationItemData item) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: item.highlighted ? AppColors.primaryLight : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: AppColors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: AppColors.dark,
                        ),
                      ),
                    ),
                    Text(
                      item.time,
                      style:
                          const TextStyle(color: AppColors.grey, fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 12.5,
                    height: 1.4,
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
