import 'package:flutter/material.dart';
import 'package:nakanoto_coin_web/config/styles.dart';
import 'package:nakanoto_coin_web/models/news.dart';
import 'package:nakanoto_coin_web/components/thumbnail_image.dart';

class NewsListTile extends StatelessWidget {
  NewsListTile(this.news, {Key? key}) : super(key: key);
  News news;

  @override
  Widget build(BuildContext context) {
    Future<void> goToDetailPage() async {
      await Navigator.of(context).pushNamed('/news_detail', arguments: news.id);
    }

    final Size size = MediaQuery.of(context).size;
    double shortestSide = size.shortestSide;

    return InkWell(
      onTap: goToDetailPage,
      child: Padding(
        padding: EdgeInsets.only(top: shortestSide / 28),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              color: Colors.white,
              height: shortestSide / 3.2,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ThumbnailImage(
                      shortestSide / 3.2 * 1.63, shortestSide / 3.2, news.path),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '【${news.title}】',
                        style: TextStyle(
                            fontSize: shortestSide / 22,
                            color: Styles.commonTextColor),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        news.name,
                        style: TextStyle(
                            fontSize: shortestSide / 22,
                            color: Styles.commonTextColor),
                        textAlign: TextAlign.center,
                      ),
                      const Text(''),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                news.date,
                style: TextStyle(
                    fontSize: shortestSide / 33, color: Styles.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
