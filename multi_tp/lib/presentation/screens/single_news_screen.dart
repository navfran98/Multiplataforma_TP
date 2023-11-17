import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:multi_tp/application/controllers/single_news_controller.dart';
import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/news_dto.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/utils/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class SingleNewsScreen extends ConsumerStatefulWidget {
  static const route = "/home/news/:id";
  static const routeName = "single_news";

  static String routeFromId(String id) => '/home/news/$id';

  const SingleNewsScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      SingleNewsScreenState();
}

class SingleNewsScreenState extends ConsumerState<SingleNewsScreen> {
  bool isLoading = false;

  Future<List<int>> _getBytesFromUrl(String url) async {
    final response = await get(Uri.parse(url));
    return response.bodyBytes;
  }

  Future<void> _handleShare(News news) async {
    setState(() {
      isLoading = true;
    });
    // Descargar la imagen desde la URL
    final bytes = await _getBytesFromUrl(news.imageUrl);

    // Guardar la imagen en un archivo temporal
    final tempDir = await getTemporaryDirectory();
    final file =
        await File('${tempDir.path}/temp_image.png').writeAsBytes(bytes);

    // Crear un XFile con el archivo temporal
    final xFile = XFile(file.path);

    // Compartir la imagen
    await Share.shareXFiles([xFile], text: news.subtitle);
    setState(() {
      isLoading = false;
    });

    ref.read(analyticsRepositoryProvider).sendEvent(type: "News share",data: {"newsId": news.id});
  }

  Widget renderNews(News news) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.reportNumber,
                style: const CustomFont.overline(ColorPalette.neutral75),
              ),
              Text(
                news.title,
                style: const CustomFont.headline02(ColorPalette.neutral100),
              ),
              const SizedBox(
                height: 16,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: SizedBox(
                    width: double.infinity,
                    height: 160,
                    child: Image.network(
                      news.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(
                height: 16,
              ),
              Text(
                news.subtitle,
                style: const CustomFont.subtitle01(ColorPalette.secondary200),
                softWrap: true,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                news.body,
                style: const CustomFont.body01(ColorPalette.neutral100),
                softWrap: true,
              ),
              const SizedBox(
                height: 16,
              ),
              const Center(
                child: Text(
                  "Comparte esta nota",
                  style: CustomFont.headline02(ColorPalette.neutral100),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator(color: ColorPalette.primary100))
                  : CtaButton(
                      isTransparent: false,
                      isDisabled: false,
                      text: "Compartir",
                      onPressedFunction: () => _handleShare(news))
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final news = ref.watch(singleNewsControllerProvider(widget.id));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.secondary90,
          centerTitle: true,
          leading: const BackButton(
            color: ColorPalette.neutral0,
          ),
          title: const Text("Novedades",
              style: CustomFont.subtitle01(ColorPalette.neutral0)),
        ),
        body: news.when(
          data: (news) {
            logger.w("news: $news");
            if (news != null) {
              return renderNews(news);
            }
            return const Center(child: Text("No existe esta noticia"));
          },
          error: (error, stackTrace) => const Center(
            child: Text("Error"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
