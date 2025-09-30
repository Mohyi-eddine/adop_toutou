import 'package:adopttoutou/models/toutou_model.dart';
import 'package:adopttoutou/theme/app_colors.dart';
import 'package:adopttoutou/theme/app_text_styles.dart';
import 'package:adopttoutou/widgets/love_me_button.dart';
import 'package:flutter/material.dart';

class ToutouWidget extends StatelessWidget {
  final Toutou toutou;

  const ToutouWidget({Key? key, required this.toutou}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            top: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  toutou.name,
                  style: AppTextStyles.cardTitle,
                ),
                Text(
                  '${toutou.age} years old',
                  style: AppTextStyles.bodyText.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: LoveMeButton(toutou: toutou),
          ),
        ],
      ),
    );
  }
}
