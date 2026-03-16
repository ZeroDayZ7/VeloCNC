import 'dart:convert';
import 'dart:io';

void main() async {
  final file = File('assets/data/t.json');
  final String content = await file.readAsString();
  final Map<String, dynamic> data = json.decode(content);

  data.forEach((key, value) {
    if (value is List) {
      for (int i = 1; i < value.length; i++) {
        // Ustawia MIN obecnego elementu na MAX poprzedniego
        value[i]['min'] = value[i - 1]['max'];
      }
    }
  });

  await file.writeAsString(JsonEncoder.withIndent('  ').convert(data));
  print('Gotowe!');
}
