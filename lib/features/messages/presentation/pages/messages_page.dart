import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_scaffold.dart';
import '../../../../core/widgets/responsive_body.dart';
import '../../../../core/widgets/rounded_sheet.dart';
import '../../../../core/widgets/shimmer.dart';
import '../../domain/entities/message_thread.dart';
import '../controllers/messages_controller.dart';

class MessagesPage extends ConsumerWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final threads = ref.watch(messageThreadsProvider);
    return GlassScaffold(
      showAppBar: false,
      child: Column(
        children: [
          const _TopHeader(title: 'الرسائل'),
          Expanded(
            child: RoundedSheet(
              child: ResponsiveBody(
                child: threads.when(
                  loading: () => const _MessagesLoading(),
                  error: (_, _) => const _MessagesEmpty(),
                  data: (data) => _MessagesContent(threads: data),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopHeader extends StatelessWidget {
  const _TopHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _CircleIcon(icon: Icons.menu),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textOnDark,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          _CircleIcon(icon: Icons.notifications_none),
        ],
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  const _CircleIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.surface.withAlpha(220),
        border: Border.all(color: AppColors.border),
      ),
      child: Icon(icon, color: AppColors.textOnDark, size: 20),
    );
  }
}

class _MessagesLoading extends StatelessWidget {
  const _MessagesLoading();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SizedBox(height: 12),
        ShimmerBox(height: 44),
        SizedBox(height: 16),
        ShimmerBox(height: 86),
        SizedBox(height: 12),
        ShimmerBox(height: 86),
      ],
    );
  }
}

class _MessagesEmpty extends StatelessWidget {
  const _MessagesEmpty();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SizedBox(height: 12),
        _SearchField(),
        SizedBox(height: 16),
        Text('لا توجد رسائل حالياً.'),
      ],
    );
  }
}

class _MessagesContent extends StatelessWidget {
  const _MessagesContent({required this.threads});

  final List<MessageThread> threads;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 12),
        const _SearchField(),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            _FilterChip(label: 'الكل', selected: true),
            _FilterChip(label: 'مقروء', selected: false),
            _FilterChip(label: 'غير مقروء', selected: false),
          ],
        ),
        const SizedBox(height: 16),
        if (threads.isEmpty)
          const Text('لا توجد رسائل حالياً.')
        else
          ...threads.map((thread) => _ThreadCard(thread: thread)),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _ThreadCard extends StatelessWidget {
  const _ThreadCard({required this.thread});

  final MessageThread thread;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.gold.withAlpha(51),
            child: const Icon(Icons.person, color: AppColors.navyAlt),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  thread.title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  thread.lastMessage,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(DateFormat('HH:mm').format(thread.lastMessageAt)),
              if (thread.unreadCount > 0)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${thread.unreadCount}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navyAlt,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.selected});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) {},
    );
  }
}

class _SearchField extends StatefulWidget {
  const _SearchField();

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.fieldFill,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search, color: AppColors.gold),
          hintText: 'ابحث عن رسالة...',
        ),
      ),
    );
  }
}
