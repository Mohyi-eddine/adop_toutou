
import 'package:adopttoutou/data/toutou_data.dart';
import 'package:adopttoutou/screens/loved_creatures_screen.dart';
import 'package:adopttoutou/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../widgets/toutou_widget.dart';

class ListToutouScreen extends StatelessWidget {
  const ListToutouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adopt a Toutou', style: AppTextStyles.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LovedCreaturesScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: toutous.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 200,
            child: ToutouWidget(
              toutou: toutous[index],
            ),
          );
        },
      ),
    );
  }
}
