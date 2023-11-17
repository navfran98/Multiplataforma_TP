import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/application/controllers/news_list_controller.dart';
import 'package:multi_tp/presentation/design_system/cells/cards/news_card.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';

class NewsScreen extends ConsumerWidget {
  static const route = "/home/news";
  static const routeName = "news";

  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsListControllerProvider);
    return news.when(
      data: (news) {
            news.sort((a,b) => a.date.compareTo(b.date));
            return Container(
              color: ColorPalette.secondary10,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 32, bottom: 8),
                      itemCount: news.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: NewsCard(news: news[index]),
                          minVerticalPadding: 0,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          subtitle: const SizedBox(height: 24),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          error: (error, stackTrace) => const Center(
            child: Text("Error"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
    );
  }

}