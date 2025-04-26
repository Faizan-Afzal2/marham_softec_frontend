import 'package:flutter/material.dart';

IconData getCategoryIcon(String category) {
  switch (category) {
    case 'Work':
      return Icons.work_outline;
    case 'Personal':
      return Icons.home_outlined;
    case 'Health':
      return Icons.fitness_center_outlined;
    default:
      return Icons.label_outline;
  }
}
