import 'package:flutter/material.dart';

import '../models/news.dart';
import '../view_model/news.dart';
import 'news_detail.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  static const String routeName = '/news';

  @override
  Widget build(BuildContext context) {
    final newsRepo = NewsViewModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<NewsModels>(
        future: newsRepo.getNews(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }

          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return const Center(child: Text('Data empty'));
            }

            final data = snapshot.data!;

            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.articles?.length ?? data.totalResults,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final article = data.articles![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NewsDetailView(article: article),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 100,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: article.urlToImage != null
                                ? Image.network(
                                    article.urlToImage!,
                                    fit: BoxFit.cover,
                                  )
                                : const Center(child: Text('No Image')),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                article.title ?? 'News Headline',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 5),
                              if (article.description != null)
                                Text(
                                  article.description!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 11),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}