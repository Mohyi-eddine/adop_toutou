
import 'package:adopttoutou/models/toutou_model.dart';
import 'package:adopttoutou/theme/app_colors.dart';
import 'package:adopttoutou/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class FeaturedToutouScreen extends StatelessWidget {
  const FeaturedToutouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hard-coded Toutou data for the featured page
    final Toutou featuredToutou = Toutou(
      id: '53',
      name: 'RIO',
      age: 52,
      imageUrl: 'https://i.imgur.com/ggxoEEw.jpeg',
      description: 'chien blanc en plein soufferance dans ',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meet our Star!'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  featuredToutou.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Text(
                featuredToutou.name,
                style: AppTextStyles.header.copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 8),
              Text(
                '${featuredToutou.age} years old',
                style: AppTextStyles.bodyText.copyWith(color: Colors.black54, fontSize: 18),
              ),
              const SizedBox(height: 16),
              Text(
                featuredToutou.description ?? '',
                style: AppTextStyles.bodyText.copyWith(color: Colors.black87),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('🐾 Out of Stock!'),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
