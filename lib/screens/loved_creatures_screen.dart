
import 'package:adopttoutou/providers/loved_toutou_provider.dart';
import 'package:adopttoutou/theme/app_colors.dart';
import 'package:adopttoutou/theme/app_text_styles.dart';
import 'package:adopttoutou/widgets/toutou_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LovedCreaturesScreen extends StatelessWidget {
  const LovedCreaturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loved Creatures'),
      ),
      body: Consumer<LovedToutouProvider>(
        builder: (context, lovedToutouProvider, child) {
          if (lovedToutouProvider.lovedToutous.isEmpty) {
            return Center(
              child: Text(
                'No loved creatures yet! 😢',
                selectionColor: Colors.grey,
              ),
            );
          }
          return ListView.builder(
            itemCount: lovedToutouProvider.lovedToutous.length,
            itemBuilder: (context, index) {
              final toutou = lovedToutouProvider.lovedToutous[index];
              return SizedBox(
                height: 200,
                child: ToutouWidget(
                  toutou: toutou,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
