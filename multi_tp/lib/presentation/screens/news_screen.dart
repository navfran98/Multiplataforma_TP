import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/presentation/design_system/cells/cards/news_card.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';

class NewsScreen extends ConsumerWidget {
  static const route = "/home/news";
  static const routeName = "news";

  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        color: ColorPalette.secondary10,
        child: false
            ? Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //TODO: aca iria el id de la news
            children: [NewsCard(id: "id")],
          ),
        )
            : Container(
          color: ColorPalette.secondary10,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 32, bottom: 8),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const ListTile(
                      //TODO: aca iria el id de la news
                      title: NewsCard(id: "id"),
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      subtitle: SizedBox(height: 24),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

}