import 'package:flutter/material.dart';

import '../models/articles.dart';

class NewsDetailView extends StatelessWidget {
  final Articles article;

  const NewsDetailView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              height: size.height / 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  article.urlToImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'By: ${article.author ?? 'Author'}',
                  style: const TextStyle(fontSize: 11),
                ),
                Text(
                  DateTime.parse(article.publishedAt!).toString().split(' ')[0],
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              article.title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              article.description!,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}