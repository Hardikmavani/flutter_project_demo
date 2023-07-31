import 'package:flutter/material.dart';
import 'package:flutter_project_demo/widgets/themes.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catalog App',
          style: TextStyle(
              color: MyTheme.darkBluishColor,
              fontWeight: FontWeight.bold,
              fontSize: 40),
        ),
        const Text(
          'Treading products',
          style: TextStyle(fontSize: 22),
        ),
      ],
    );
  }
}
