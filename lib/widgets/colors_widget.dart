import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

class ColorsWidget extends StatefulWidget {
  final Function(String) sendData;
  ColorsWidget({required this.sendData});
  @override
  _ColorsWidgetState createState() => _ColorsWidgetState();
}

class _ColorsWidgetState extends State<ColorsWidget> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
          ),
          const SizedBox(height: 25),
          Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _switchValue ? 'Apagar' : 'Encender',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Switch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                        widget.sendData(value ? "T" : "T");
                      });
                      widget.sendData(value ? "F" : "F");
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
