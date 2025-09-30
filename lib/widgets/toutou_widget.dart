import 'package:adopttoutou/models/toutou_model.dart';
import 'package:adopttoutou/theme/app_colors.dart';
import 'package:adopttoutou/theme/app_text_styles.dart';
import 'package:adopttoutou/widgets/love_me_button.dart';
import 'package:flutter/material.dart';

import 'package:adopttoutou/widgets/cloud_painter.dart';

class ToutouWidget extends StatelessWidget {
  final Toutou toutou;

  const ToutouWidget({Key? key, required this.toutou}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(10),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.network(
                    toutou.imageUrl,
                    fit: BoxFit.contain,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        width: double.infinity,
        height: 200,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.26),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(toutou.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: -30,
              left: -30,
              child: SizedBox(
                width: 190,
                height: 150,
                child: CustomPaint(
                  painter: CloudPainter(color: AppColors.playfulOrange.withOpacity(0.9)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          toutou.name,
                          style: AppTextStyles.cardTitle.copyWith(color: AppColors.white),
                        ),
                        Text(
                          '${toutou.age} years old',
                          style: AppTextStyles.bodyText.copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: LoveMeButton(toutou: toutou),
            ),
          ],
        ),
      ),
    );
  }
}
