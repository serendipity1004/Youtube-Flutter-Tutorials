import 'package:flutter/material.dart';
import 'package:codefactory_youtube_flutter_tutorial/Layouts/index.dart';

class RowAndColumnScreen extends StatefulWidget {
  @override
  _RowAndColumnScreenState createState() => _RowAndColumnScreenState();
}

class _RowAndColumnScreenState extends State<RowAndColumnScreen> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;
  VerticalDirection _verticalDirection = VerticalDirection.down;
  TextDirection _textDirection = TextDirection.ltr;
  TextBaseline _textBaseline = TextBaseline.alphabetic;
  MainAxisSize _mainAxisSize = MainAxisSize.max;

  _renderFlutterLogo({
    @required Color color,
  }) {
    return Container(
      color: color,
      child: FlutterLogo(
        size: 40,
      ),
    );
  }

  List<Widget> _renderTextSamples() {
    return [
      Text(
        'Code Factory',
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.green,
          decoration: TextDecoration.underline,
          textBaseline: _textBaseline,
        ),
      ),
      Text(
        'Code Factory',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          decoration: TextDecoration.underline,
          textBaseline: _textBaseline,
        ),
      ),
    ];
  }

  List<Widget> _renderLogoSamples() {
    return [
      _renderFlutterLogo(
        color: Colors.red,
      ),
      _renderFlutterLogo(
        color: Colors.yellow,
      ),
      _renderFlutterLogo(
        color: Colors.green,
      ),
      _renderFlutterLogo(
        color: Colors.blue,
      ),
      _renderFlutterLogo(
        color: Colors.purple,
      ),
    ];
  }

  _renderTitle({
    @required String title,
  }) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  _renderContents() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            /*
            * ROW!!!
            * */
            Padding(
              padding: EdgeInsets.all(8.0),
              child: _renderTitle(title: 'ROW'),
            ),
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Row(
                verticalDirection: _verticalDirection,
                textDirection: _textDirection,
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                textBaseline: _textBaseline,
                mainAxisSize: _mainAxisSize,
                children: _renderLogoSamples(),
              ),
            ),
            Container(
              height: 60.0,
            ),
            /*
            * COLUMN!!!
            * */
            Padding(
              padding: EdgeInsets.all(8.0),
              child: _renderTitle(title: 'COLUMN'),
            ),
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Column(
                verticalDirection: _verticalDirection,
                textDirection: _textDirection,
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                textBaseline: _textBaseline,
                mainAxisSize: _mainAxisSize,
                children: _renderLogoSamples(),
              ),
            ),
            Container(
              height: 60.0,
            ),
            /*
            * ROW TEXT!!!
            * */
            Padding(
              padding: EdgeInsets.all(8.0),
              child: _renderTitle(title: 'ROW TEXT'),
            ),
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Row(
                verticalDirection: _verticalDirection,
                textDirection: _textDirection,
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                textBaseline: _textBaseline,
                mainAxisSize: _mainAxisSize,
                children: _renderTextSamples(),
              ),
            ),
            Container(
              height: 60.0,
            ),
            /*
            * COLUMN TEXT!!!
            * */
            Padding(
              padding: EdgeInsets.all(8.0),
              child: _renderTitle(title: 'COLUMN TEXT'),
            ),
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Column(
                verticalDirection: _verticalDirection,
                textDirection: _textDirection,
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                textBaseline: _textBaseline,
                mainAxisSize: _mainAxisSize,
                children: _renderTextSamples(),
              ),
            ),
            Container(
              height: 60.0,
            ),
            /*
            * ROW CENTER!!!
            * */
            Padding(
              padding: EdgeInsets.all(8.0),
              child: _renderTitle(title: 'ROW CENTER'),
            ),
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Center(
                child: Container(
                  color: Colors.grey,
                  child: Row(
                    verticalDirection: _verticalDirection,
                    textDirection: _textDirection,
                    mainAxisAlignment: _mainAxisAlignment,
                    crossAxisAlignment: _crossAxisAlignment,
                    textBaseline: _textBaseline,
                    mainAxisSize: _mainAxisSize,
                    children: _renderLogoSamples(),
                  ),
                ),
              ),
            ),
            Container(
              height: 60.0,
            ),
            /*
            * ROW CENTER!!!
            * */
            Padding(
              padding: EdgeInsets.all(8.0),
              child: _renderTitle(title: 'COLUMN CENTER'),
            ),
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Center(
                child: Container(
                  color: Colors.grey,
                  child: Column(
                    verticalDirection: _verticalDirection,
                    textDirection: _textDirection,
                    mainAxisAlignment: _mainAxisAlignment,
                    crossAxisAlignment: _crossAxisAlignment,
                    textBaseline: _textBaseline,
                    mainAxisSize: _mainAxisSize,
                    children: _renderLogoSamples(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _renderRadios({
    @required List enumOptions,
    @required Function onChanged,
    @required dynamic groupValue,
  }) {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: enumOptions
            .map(
              (x) => Row(
                children: [
                  Radio(
                    value: x,
                    onChanged: onChanged,
                    groupValue: groupValue,
                  ),
                  Text(
                    x.toString().split('.')[1],
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  _renderRadioTitle({
    @required String title,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  _renderBottomOptions() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      color: Colors.grey[200],
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _renderRadioTitle(
                title: 'MainAxisAlignment',
              ),
              _renderRadios(
                enumOptions: MainAxisAlignment.values,
                onChanged: (value) {
                  setState(() {
                    _mainAxisAlignment = value;
                  });
                },
                groupValue: _mainAxisAlignment,
              ),
              _renderRadioTitle(
                title: 'CrossAxisAlignment',
              ),
              _renderRadios(
                enumOptions: CrossAxisAlignment.values,
                onChanged: (value) {
                  setState(() {
                    _crossAxisAlignment = value;
                  });
                },
                groupValue: _crossAxisAlignment,
              ),
              _renderRadioTitle(
                title: 'VerticalDirection',
              ),
              _renderRadios(
                enumOptions: VerticalDirection.values,
                onChanged: (value) {
                  setState(() {
                    _verticalDirection = value;
                  });
                },
                groupValue: _verticalDirection,
              ),
              _renderRadioTitle(
                title: 'TextDirection',
              ),
              _renderRadios(
                enumOptions: TextDirection.values,
                onChanged: (value) {
                  setState(() {
                    _textDirection = value;
                  });
                },
                groupValue: _textDirection,
              ),
              _renderRadioTitle(
                title: 'MainAxisSize',
              ),
              _renderRadios(
                enumOptions: MainAxisSize.values,
                onChanged: (value) {
                  setState(() {
                    _mainAxisSize = value;
                  });
                },
                groupValue: _mainAxisSize,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAppbarLayout(
      title: 'Row & Column',
      child: Column(
        children: [
          _renderContents(),
          _renderBottomOptions(),
        ],
      ),
    );
  }
}
