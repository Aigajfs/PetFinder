import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class FilterDropdown extends StatelessWidget {
  final List<String> filters = ['All', 'Dog', 'Cat', 'Bird', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return DropdownButton<String>(
          value: provider.selectedFilter,
          onChanged: (String? newValue) {
            if (newValue != null) {
              provider.setFilter(newValue);
            }
          },
          items: filters.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          underline: Container(),
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
          isExpanded: true,
        );
      },
    );
  }
}