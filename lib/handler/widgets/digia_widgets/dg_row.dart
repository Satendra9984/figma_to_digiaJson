import 'package:figma_to_json_convertor/handler/config_resolver/mapper.dart';
import 'package:figma_to_json_convertor/handler/models/ui_object_base_class.dart';

class DgRowWidgetResolver extends UiObjectModelBase {
  DgRowWidgetResolver({required Map props, required Map resultJson})
      : super(figmaProps: props, finalDigiaWidgetGlobalJson: resultJson);

  @override
  String getDigiaWidgetJson() {
    Map rowWidgetJson = {};

    // StringUtils.prettyPrint(figmaProps);
    //
    rowWidgetJson["type"] =
        'digia/${WidgetsMapper.getWidgetName(figmaProps["name"])}';
    rowWidgetJson["id"] = figmaProps["id"];
    rowWidgetJson["children"] = _getChildren();
    rowWidgetJson["propdata"] = addPropsData();
    rowWidgetJson["defaultPropData"] = addDefaultPropsData();
    rowWidgetJson["dataRef"] = {"datum": "[]", "kind": "json"};

    finalDigiaWidgetGlobalJson["${figmaProps["id"]}"] = rowWidgetJson;

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
      "LEFT": "start",
      "RIGHT": "end",
      "LEFT_RIGHT": "stretch",
      "SCALE": "stretch",
    };

    String fHorizontalContraint = figmaProps["constraints"]["horizontal"];

    String mainAxisAl = al[fHorizontalContraint];

    return {
      "type": "string",
      "data": mainAxisAl,
    };
  }

  Map _getCrossAxisAlignment() {
    Map al = {
      "TOP": "start",
      "BOTTOM": "end",
      "CENTER": "center",
      "TOP_BOTTOM": "space_between",
      "SCALE": "stretch",
    };

    String fVerticalContraint = figmaProps["constraints"]["vertical"];

    String crossAxisAl = al[fVerticalContraint];

    return {
      "type": "string",
      "data": crossAxisAl,
    };
  }
}
