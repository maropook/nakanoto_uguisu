import 'package:flutter/material.dart';
import 'package:nakanoto_coin_web/models/help.dart';
import 'package:pdfx/pdfx.dart';

class HelpDetail extends StatelessWidget {
  HelpDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;

    final Size size = MediaQuery.of(context).size;
    double shortestSide = size.shortestSide;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "【" + helpList[index].title + "】" + helpList[index].name,
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: PdfView(
        controller: helpList[index].pdfPath,
      ),

      //  SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Text(
      //         '【${newsList[index].title}】',
      //         style: TextStyle(
      //             fontSize: shortestSide / 22, color: Styles.commonTextColor),
      //         textAlign: TextAlign.left,
      //       ),
      //       ThumbnailImage(
      //           shortestSide, shortestSide / 1.63, newsList[index].path),
      //       Text(
      //         newsList[index].description,
      //         style: TextStyle(
      //             fontSize: shortestSide / 22, color: Styles.commonTextColor),
      //         textAlign: TextAlign.center,
      //       ),
      //       Text(
      //         newsList[index].address,
      //         style: TextStyle(
      //             fontSize: shortestSide / 22, color: Styles.commonTextColor),
      //         textAlign: TextAlign.center,
      //       )
      //     ],
      //   ),
      // )
    );
  }
}
