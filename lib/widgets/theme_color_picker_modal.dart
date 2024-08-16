import 'package:flutter/material.dart';

class ThemeColorPickerModal extends StatelessWidget {
  final List<Color> colorOptions;
  final Function(Color) onSelectColor;

  const ThemeColorPickerModal({super.key, required this.colorOptions, required this.onSelectColor});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Seleccionar Color de Tema',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: Wrap(
        alignment: WrapAlignment.center,
        children: colorOptions.map((color) {
          return GestureDetector(
            onTap: () {
              onSelectColor(color); // Llama a la función de selección de color al hacer clic en un color
              Navigator.of(context).pop();
            },
            child: Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}