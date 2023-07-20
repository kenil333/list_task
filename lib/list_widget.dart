import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_provider.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) => ListItemWidget(id: index),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final int id;
  const ListItemWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final ListProvider provider =
        Provider.of<ListProvider>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(child: Container()),
          // The Selector widget allows us to rebuild only the specific part of the widget tree
          // when the selected value from the ListProvider changes.
          // In this case, we are listening to changes in the value associated with the 'id'
          // and updating the 'Text' widget accordingly without rebuilding the entire 'ListItemWidget'.
          Selector<ListProvider, int>(
            builder: (context, value, child) => Text(value.toString()),
            // The 'selector' parameter defines what value we want to listen for changes.
            // In this case, we are listening to the value 'listData' map in the ListProvider
            // and selecting the value for the specific 'id' provided to this widget.
            selector: (context, listProvider) => listProvider.listData[id] ?? 0,
          ),
          MaterialButton(
            onPressed: () {
              provider.incrementListData(id);
            },
            child: const Text("+"),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
