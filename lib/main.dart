import 'dart:convert';
import 'dart:io';

import 'package:figma_to_json_convertor/handler/config_resolver/ui_data_donfig_resolver.dart';
import 'package:figma_to_json_convertor/handler/network/api_calling.dart';

void main() async {
  final String FILE_KEY = 'lyTwGYU6qBbzkNGL7OT737';
  final String nodeIds = '2-931';
  //'2469-5183';

  // Make a GET request
  Map? data = await ApiCallsHelper.getFigmaUiNodes(
    FILE_KEY: FILE_KEY,
    nodeIds: nodeIds,
  );

  await File('figma.json').writeAsString(jsonEncode(data));

  if (data == null) {
    print('No data came in main.dart');
    return;
  }

  final configResolver = UiDataConfigResolver(data: data);
  Map? finalJsonForDigia = await configResolver.getFinalJsonForDigia();
  await File('final_digia.json').writeAsString(json.encode(finalJsonForDigia));
}
