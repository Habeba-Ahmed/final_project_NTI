import 'package:flutter/material.dart';

class FilterSortPanel extends StatefulWidget {
  final dynamic selectedSort;
  final int count;

  const FilterSortPanel({
    super.key,
    required this.count,
    this.selectedSort ,
  });

  @override
  State<FilterSortPanel> createState() => _FilterSortPanelState();
}

class _FilterSortPanelState extends State<FilterSortPanel> {
  late String currentSort;

  final List<String> sortOptions = [
    'Newest',
    'Price (low to high)',
    'Price (high to low)',
    'Name A-Z',
    'Name Z-A',
  ];

  @override
  void initState() {
    super.initState();
    currentSort = widget.selectedSort;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height : MediaQuery.of(context).size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter & Sort (${widget.count} products)',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height : 10),
          const Text('Sort by:', style: TextStyle(fontSize: 16)),

          ...sortOptions.map(
            (option) => RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: currentSort,
              onChanged: (value) {
                setState(() {
                  currentSort = value!;
                });
              },
            ),
          ),

          const Divider(),
          
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, currentSort);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}
