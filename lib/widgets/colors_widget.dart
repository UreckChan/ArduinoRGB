import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

class ColorsWidget extends StatefulWidget {
  final Function(String) sendData;
  ColorsWidget({required this.sendData});
  @override
  _ColorsWidgetState createState() => _ColorsWidgetState();
}

class _ColorsWidgetState extends State<ColorsWidget> {
  Color _currentColor = Colors.green;
  bool _switchValue = false;
  final _controller = CircleColorPickerController(
    initialColor: Colors.green,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircleColorPicker(
              controller: _controller,
              onChanged: (color) {
                setState(() => _currentColor = color);
                widget.sendData("R${color.red}G${color.green}B${color.blue}");
              },
            ),
          ),
          const SizedBox(height: 25),
          Column(
            children: [
              Slider(
                value: _currentColor.red.toDouble(),
                min: 0,
                max: 255,
                thumbColor: Colors.red,
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    _controller.color = Color.fromRGBO(value.toInt(),
                        _currentColor.green, _currentColor.blue, 1);
                  });
                  widget.sendData("R${value.toInt()}");
                },
              ),
              Slider(
                value: _currentColor.green.toDouble(),
                min: 0,
                max: 255,
                thumbColor: Colors.green,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    _controller.color = Color.fromRGBO(_currentColor.red,
                        value.toInt(), _currentColor.blue, 1);
                  });
                  widget.sendData("G${value.toInt()}");
                },
              ),
              Slider(
                value: _currentColor.blue.toDouble(),
                min: 0,
                max: 255,
                thumbColor: Colors.blue,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _controller.color = Color.fromRGBO(_currentColor.red,
                        _currentColor.green, value.toInt(), 1);
                  });
                  widget.sendData("B${value.toInt()}");
                },
              ),
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
