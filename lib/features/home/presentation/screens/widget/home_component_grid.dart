import 'package:flutter/material.dart';
import 'package:tukaatuexpress/features/home/presentation/screens/widget/home_component.dart';

class HomeComponentGrid extends StatelessWidget {
  const HomeComponentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: const [
        HomeComponent(title: '', value: '', icon: Icons.add_ic_call_rounded),
        HomeComponent(title: '', value: '', icon: Icons.add_ic_call_rounded),
        HomeComponent(title: '', value: '', icon: Icons.add_ic_call_rounded),
        HomeComponent(title: '', value: '', icon: Icons.add_ic_call_rounded),
      ],
    );
  }
}
