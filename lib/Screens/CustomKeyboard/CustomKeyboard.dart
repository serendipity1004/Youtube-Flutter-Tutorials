import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'KeyboardKey.dart';

class CustomKeyboard extends StatefulWidget {
  @override
  _CustomKeyboardState createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  List<List<dynamic>> keys;
  String amount;

  @override
  void initState() {
    super.initState();

    keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['00', '0', Icon(Icons.keyboard_backspace)],
    ];

    amount = '';
  }

  onKeyTap(val) {
    if(val == '0' && amount.length == 0){
      return;
    }

    setState(() {
      amount = amount + val;
    });
  }

  onBackspacePress() {
    if (amount.length == 0) {
      return;
    }

    setState(() {
      amount = amount.substring(0, amount.length - 1);
    });
  }

  renderKeyboard() {
    return keys
        .map(
          (x) => Row(
            children: x.map(
              (y) {
                return Expanded(
                  child: KeyboardKey(
                    label: y,
                    value: y,
                    onTap: (val) {
                      if (val is Widget) {
                        onBackspacePress();
                      } else {
                        onKeyTap(val);
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
        )
        .toList();
  }

  renderAmount() {
    String display = '보낼금액';
    TextStyle style = TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    );

    if (this.amount.length > 0) {
      NumberFormat f = NumberFormat('#,###');

      display = f.format(int.parse(amount)) + '원';
      style = style.copyWith(
        color: Colors.black,
      );
    }

    return Expanded(
      child: Center(
        child: Text(
          display,
          style: style,
        ),
      ),
    );
  }

  renderConfirmButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              color: Colors.orange,
              disabledColor: Colors.grey[200],
              onPressed: amount.length > 0 ? (){

              } : null,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  '확인',
                  style: TextStyle(
                    color: amount.length > 0 ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            renderAmount(),
            ...renderKeyboard(),
            renderConfirmButton(),
          ],
        ),
      ),
    );
  }
}
