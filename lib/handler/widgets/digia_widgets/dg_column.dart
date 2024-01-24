import 'package:figma_to_json_convertor/handler/config_resolver/mapper.dart';
import 'package:figma_to_json_convertor/handler/models/ui_object_base_class.dart';

class DgColumnWidgetResolver extends UiObjectModelBase {
  DgColumnWidgetResolver({required Map props, required Map resultJson})
      : super(figmaProps: props, finalDigiaWidgetGlobalJson: resultJson);

  @override
  String getDigiaWidgetJson() {
    Map columnWidgetJson = {};

    // StringUtils.prettyPrint(figmaProps);
    //
    columnWidgetJson["type"] =
        'digia/${WidgetsMapper.getWidgetName(figmaProps["name"])}';
    columnWidgetJson["id"] = figmaProps["id"];
    columnWidgetJson["children"] = _getChildren();
    columnWidgetJson["propdata"] = addPropsData();
    columnWidgetJson["defaultPropData"] = addDefaultPropsData();
    columnWidgetJson["dataRef"] = {"datum": "[]", "kind": "json"};

    finalDigiaWidgetGlobalJson["${figmaProps["id"]}"] = columnWidgetJson;

    //

    return figmaProps["id"].toString();
  }

  List<String> _getChildren() {
    List children = figmaProps["children"];
    List<String> result = [];

    children.sort((c1, c2) {
      num y1 = c1["absoluteRenderBounds"]["y"];
      num y2 = c2["absoluteRenderBounds"]["y"];

      return y1.compareTo(y2);
    });

    for (Map child in children) {
      UiObjectModelBase? childClass = WidgetsMapper.getWidgetClass(
          data: child, resultJson: finalDigiaWidgetGlobalJson);
      if (childClass == null) continue;

      childClass.getDigiaWidgetJson();

      result.add("${child["id"]}");
    }

    return result;
  }

  @override
  Map addPropsData() {
    Map propsData = {
      "type": "object",
    };

    Map data = {};

    data["mainAxisAlignment"] = _getMainAxisAlignment();
    data["crossAxisAlignment"] = _getCrossAxisAlignment();

    propsData["data"] = data;

    return propsData;
  }

  @override
  Map? addDefaultPropsData() {
    Map? defaultPropsData = {};

    //

    defaultPropsData = {
      "type": "object",
      "data": {
        "visibility": {"type": "bool", "data": true},
        "align": {"type": "string", "data": "none"},
        "style": {
          "type": "object",
          "data": {
            "padding": {"type": "string", "data": "12,0,12,0"}
          }
        },
        "onClick": {"type": "action", "data": null}
      }
    };

    //
    return defaultPropsData;
  }

  Map _getMainAxisAlignment() {
    Map al = {
      "TOP": "start",
      "BOTTOM": "end",
      "CENTER": "center",
      "TOP_BOTTOM": "space_between",
      "SCALE": "stretch",
    };

    String fVerticalContraint = figmaProps["constraints"]["vertical"];

    String mainAxisAl = al[fVerticalContraint];

    return {
      "type": "string",
      "data": mainAxisAl,
    };
  }

  Map _getCrossAxisAlignment() {
    Map al = {
      "LEFT": "start",
      "RIGHT": "end",
      "LEFT_RIGHT": "stretch",
      "SCALE": "stretch",
    };

    String fHorizontalContraint = figmaProps["constraints"]["horizontal"];

    String crossAxisAl = al[fHorizontalContraint];

    return {
      "type": "string",
      "data": crossAxisAl,
    };
  }
}

final dgcol = {
  "type": "digia/column",
  "id": "agwb55kgRV",
  "parent": null,
  "propData": {
    "type": "object",
    "data": {
      "mainAxisAlignment": {"type": "object", "data": null},
      "crossAxisAlignment": {"type": "string", "data": "start"}
    }
  },
  "defaultPropData": {
    "type": "object",
    "data": {
      "visibility": {"type": "bool", "data": true},
      "align": {"type": "string", "data": "none"},
      "style": {
        "type": "object",
        "data": {
          "padding": {"type": "string", "data": "12,0,12,0"}
        }
      },
      "onClick": {"type": "action", "data": null}
    }
  },
  "children": [
    "lXZqS8n1te",
    "HFkfP7EwJi",
    "ipEtbk7rRe",
    "QlFXqaMMoM",
    "DO4qfRmM7U"
  ],
  "dataRef": {"datum": "[]", "kind": "json"}
};

final fg = {
  "id": "2:931",
  "name": "(column)Frame 1",
  "type": "FRAME",
  "scrollBehavior": "SCROLLS",
  "blendMode": "NORMAL",
  "children": [],
  "absoluteBoundingBox": {
    "x": -205.0,
    "y": -228.0,
    "width": 410.0,
    "height": 621.0
  },
  "absoluteRenderBounds": {
    "x": -205.0,
    "y": -228.0,
    "width": 410.0,
    "height": 621.0
  },
  "constraints": {"vertical": "TOP", "horizontal": "LEFT"},
  "clipsContent": false,
  "background": [
    {
      "blendMode": "NORMAL",
      "type": "SOLID",
      "color": {"r": 1.0, "g": 1.0, "b": 1.0, "a": 1.0}
    }
  ],
  "fills": [
    {
      "blendMode": "NORMAL",
      "type": "SOLID",
      "color": {"r": 1.0, "g": 1.0, "b": 1.0, "a": 1.0}
    }
  ],
  "strokes": [],
  "strokeWeight": 1.0,
  "strokeAlign": "INSIDE",
  "backgroundColor": {"r": 1.0, "g": 1.0, "b": 1.0, "a": 1.0},
  "overflowDirection": "VERTICAL_SCROLLING",
  "effects": []
};
