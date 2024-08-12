import 'package:flutter/material.dart';

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: const Text('زمانێک یان زیاتر هەڵبژێرە',
              style: TextStyle(fontFamily: 'kurdish', color: Colors.black87))),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(
                      item,
                      style: TextStyle(
                          fontFamily: 'kurdish', color: Colors.black87),
                    ),
                    checkColor: Colors.white,
                    activeColor: Colors.black87,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text(
            'پاشگەزبوونەوە',
            style: TextStyle(color: Colors.black87, fontFamily: 'kurdish'),
          ),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text(
            'پەسەندکردن',
            style: TextStyle(fontFamily: 'kurdish'),
          ),
          style: ElevatedButton.styleFrom(primary: Colors.black87),
        ),
      ],
    );
  }
}

class MultiSelect2 extends StatefulWidget {
  final List<String> items;
  const MultiSelect2({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState2();
}

class _MultiSelectState2 extends State<MultiSelect2> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: const Text('ڕۆژێک یان زیاتر هەڵبژێرە',
              style: TextStyle(fontFamily: 'kurdish', color: Colors.black87))),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(
                      item,
                      style: TextStyle(
                          fontFamily: 'kurdish', color: Colors.black87),
                    ),
                    checkColor: Colors.white,
                    activeColor: Colors.black87,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text(
            'پاشگەزبوونەوە',
            style: TextStyle(color: Colors.black87, fontFamily: 'kurdish'),
          ),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text(
            'پەسەندکردن',
            style: TextStyle(fontFamily: 'kurdish'),
          ),
          style: ElevatedButton.styleFrom(primary: Colors.black87),
        ),
      ],
    );
  }
}
