import 'package:flutter/material.dart';

class CheckBoxList extends StatefulWidget {
  @override
  _CheckBoxListState createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  List<Item> items = [
    Item(id: 1, name: 'Item 1'),
    Item(id: 2, name: 'Item 2'),
    Item(id: 3, name: 'Item 3'),
  ];
  List<Item> checkedItems = [];

  void deleteCheckedItems() {
    setState(() {
      items.removeWhere((item) => checkedItems.contains(item));
      checkedItems.clear();
    });
  }

  void navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckedItemsPage(checkedItems: checkedItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return CheckboxListTile(
            title: Text(item.name),
            value: checkedItems.contains(item),
            onChanged: (bool? value) {
              setState(() {
                if (value!) {
                  checkedItems.add(item);
                } else {
                  checkedItems.remove(item);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: checkedItems.isEmpty ? null : deleteCheckedItems,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: Text('Show Checked Items'),
            onPressed: checkedItems.isEmpty ? null : navigateToNextPage,
          ),
        ),
      ),
    );
  }
}

class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});
}

class CheckedItemsPage extends StatelessWidget {
  final List<Item> checkedItems;

  CheckedItemsPage({required this.checkedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checked Items'),
      ),
      body: ListView.builder(
        itemCount: checkedItems.length,
        itemBuilder: (context, index) {
          final item = checkedItems[index];
          return ListTile(
            title: Text(item.name),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CheckBoxList(),
  ));
}
