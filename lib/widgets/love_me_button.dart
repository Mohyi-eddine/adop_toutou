
import 'package:adopttoutou/models/toutou_model.dart';
import 'package:adopttoutou/providers/loved_toutou_provider.dart';
import 'package:adopttoutou/theme/app_colors.dart';
import 'package:adopttoutou/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoveMeButton extends StatelessWidget {
  final Toutou toutou;

  const LoveMeButton({Key? key, required this.toutou}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LovedToutouProvider>(
      builder: (context, lovedToutouProvider, child) {
        final bool isLoved = lovedToutouProvider.lovedToutous.contains(toutou);
        return ElevatedButton.icon(
          onPressed: () {
            if (isLoved) {
              lovedToutouProvider.removeToutou(toutou);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Text('💔🐾', style: TextStyle(fontSize: 24)),
                      const SizedBox(width: 10),
                      Text(
                        'You unloved ${toutou.name}!',
                        style: AppTextStyles.bodyText.copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                  backgroundColor: AppColors.friendlyViolet,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(10),
                  duration: const Duration(seconds: 2),
                ),
              );
            } else {
              lovedToutouProvider.addToutou(toutou);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Text('💖🐾', style: TextStyle(fontSize: 24)),
                      const SizedBox(width: 10),
                      Text(
                        'You loved ${toutou.name}!',
                        style: AppTextStyles.bodyText.copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                  backgroundColor: AppColors.friendlyViolet,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(10),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          },
          icon: const Icon(Icons.pets),
          label: Text(isLoved ? 'Already Loved' : 'Love me'),
          style: isLoved
              ? ElevatedButton.styleFrom(
                  backgroundColor: AppColors.friendlyViolet,
                  foregroundColor: AppColors.white,
                )
              : null, // Use default theme style
        );
      },
    );
  }
}
