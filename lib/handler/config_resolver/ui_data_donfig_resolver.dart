import 'package:figma_to_json_convertor/handler/config_resolver/mapper.dart';

class UiDataConfigResolver {
  final Map data;
  Map _finalDigiaJson = {};
  UiDataConfigResolver({required this.data});

  /// Here the final Json Will be returned for Digia-Dashboard to use
  Future<Map> getFinalJsonForDigia() async {
    _handleData();
    return {..._finalDigiaJson};
  }

  void _handleData() async {
    final nodes = data["nodes"];
    for (var nodeId in nodes.keys) {
      _handleNode(nodes[nodeId]);
    }
  }

  void _handleNode(Map<String, dynamic> node) {
    final document = node["document"];
    Map finalResultJson = {};

    final widgetClass = WidgetsMapper.getWidgetClass(
      data: document,
      resultJson: finalResultJson,
    );
    if (widgetClass == null) {
      return null;
    }

    final String id = widgetClass.getDigiaWidgetJson();
    _finalDigiaJson["nodes"] = {
      id: finalResultJson,
    };
    // _finalDigiaJson[id] = finalResultJson;
  }
}
