import 'package:figma_to_json_convertor/handler/config_resolver/mapper.dart';
import 'package:figma_to_json_convertor/handler/models/ui_object_base_class.dart';
import 'package:figma_to_json_convertor/utils/string_utils.dart';

class DgRichTextWidgetResolver extends UiObjectModelBase {
  DgRichTextWidgetResolver({required Map props, required Map resultJson})
      : super(figmaProps: props, finalDigiaWidgetGlobalJson: resultJson);

  @override
  String getDigiaWidgetJson() {
    Map localJson = {};

    //
    localJson["type"] =
        'digia/${WidgetsMapper.getWidgetName(figmaProps["name"])}';
    localJson["id"] = figmaProps["id"];
    localJson["propData"] = addPropsData();
    localJson["defaultPropData"] = addDefaultPropsData();
    localJson["children"] = [];
    localJson["dataRef"] = null;
    //
    finalDigiaWidgetGlobalJson["${figmaProps["id"]}"] = localJson;
    //

    return figmaProps["id"].toString();
  }

  @override
  Map addPropsData() {
    Map propsData = {
      "type": "object",
    };

    Map data = {};

    Map textspans = {
      "type": "array",
    };
    List<Map> textSpans = [];

    String textCharacters = figmaProps["characters"];
    print('$textCharacters, len: ${textCharacters.length}\n\n');
    List<List<int>> characterStyleOverrides =
        _splitList(List<int>.from((figmaProps["characterStyleOverrides"])));

    for (List<int> overrides in characterStyleOverrides) {
      int firstindex = overrides[0];
      int lastindex = overrides[overrides.length - 1];
      int ovval = overrides[1];
      String text = textCharacters.substring(firstindex, lastindex).toString();
      // print('text: ${text}');
      Map textSpan = {
        "type": "object",
        "data": {
          "text": {
            "type": "string",
            "data": text,
          },
          "spanStyle": _getSpanStyle(ovval),
        },
      };
      textSpans.add(textSpan);
    }

    textspans["data"] = textSpans;
    data["textSpans"] = textspans;
    data["textStyle"] = _getTextStyle();
    propsData["data"] = data;

    return propsData;
  }

  @override
  Map? addDefaultPropsData() {
    Map? defaultPropData = {};
    defaultPropData = {
      "type": "object",
      "data": {
        "visibility": {"type": "bool", "data": true},
        "align": {"type": "string", "data": "none"},
        "style": {
          "type": "object",
          "data": {
            "margin": {"type": "string", "data": "0,12,0,12"}
          }
        },
        "onClick": {"type": "action", "data": null}
      }
    };
    return defaultPropData;
  }

  List<List<int>> _splitList(List<int> inputList) {
    List<List<int>> result = [];

    if (inputList.isEmpty) {
      return result;
    }

    List<int> currentSublist = [0, inputList[0]];

    for (int i = 1; i < inputList.length; i++) {
      if (inputList[i] == inputList[i - 1]) {
        currentSublist.add(inputList[i]);
      } else {
        currentSublist.add(i);
        result.add(List.from(currentSublist));
        currentSublist = [i, inputList[i]];
      }
    }

    // Add the last sublist
    result.add(List.from(currentSublist));
    List<int> u = result[result.length - 1];
    u.add(inputList.length);
    // print(result);
    return result;
  }

  Map _getSpanStyle(int overrideNumber) {
    Map spanstyle = {
      "type": "object",
    };

    Map data = {};

    Map<String, dynamic> figmaOverride =
        figmaProps["styleOverrideTable"][overrideNumber.toString()];

    // StringUtils.prettyPrint(figmaOverride["fills"]![0]);

    if (figmaOverride["fills"] != null) {
      data["textColor"] = {
        "type": "string",
        "data": StringUtils.rgbaToHex(figmaOverride["fills"][0]),
      };

      data["textDecorationStyle"] = {
        "type": "string",
        "data": (figmaOverride["fills"][0]["type"] as String).toLowerCase(),
      };
      spanstyle["data"] = data;
    } else {
      data = _getTextStyle();
      spanstyle = data;
    }

    return spanstyle;
  }

  Map _getTextStyle() {
    Map textstyle = {
      "type": "object",
    };

    Map data = {};
    //? [TODO] : IN LATER DETAILING
    // textstyle["data"]["fontToken"] = _getFontToken()

    data["textColor"] = {
      "type": "string",
      "data": StringUtils.rgbaToHex(figmaProps["fills"][0]),
    };

    data["textDecorationStyle"] = {
      "type": "string",
      "data": (figmaProps["fills"][0]["type"] as String).toLowerCase(),
    };

    textstyle["data"] = data;

    return textstyle;
  }
}

final dgj = {
  "type": "digia/richText",
  "id": "lXZqS8n1te",
  "parent": "agwb55kgRV",
  "propData": {
    "type": "object",
    "data": {
      "textSpans": {
        "type": "array",
        "data": [
          {
            "type": "object",
            "data": {
              "text": {"type": "string", "data": "Hey! "},
              "spanStyle": {
                "type": "object",
                "data": {
                  "fontToken": {"type": "string", "data": "displayLarge"},
                  "textColor": {"type": "string", "data": "#101213"}
                }
              }
            }
          },
          {
            "type": "object",
            "data": {
              "text": {"type": "string", "data": "Welcome To Digia"},
              "spanStyle": {
                "type": "object",
                "data": {
                  "fontToken": {"type": "string", "data": "displayLarge"},
                  "textColor": {"type": "string", "data": "#4945FF"},
                }
              }
            }
          }
        ]
      },
      "maxLines": {"type": "number", "data": null},
      "overflow": {"type": "string", "data": "clip"},
      "alignment": {"type": "string", "data": "start"},
      "textStyle": {
        "type": "object",
        "data": {
          "fontToken": {"type": "string", "data": "titleLarge"}
        }
      }
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
          "margin": {"type": "string", "data": "0,12,0,12"}
        }
      },
      "onClick": {"type": "action", "data": null}
    }
  },
  "children": [],
  "dataRef": null
};

final fgj = {
  "id": "1:685",
  "name":
      "(richtext)By Sign In, you agree to Digia's Terms of Use. Read our Privacy Policy.",
  "type": "TEXT",
  "scrollBehavior": "SCROLLS",
  "blendMode": "PASS_THROUGH",
  "absoluteBoundingBox": {
    "x": -205.0,
    "y": 377.0,
    "width": 359.0,
    "height": 16.0
  },
  "absoluteRenderBounds": {
    "x": -203.95599365234375,
    "y": 380.3479919433594,
    "width": 356.984619140625,
    "height": 10.920013427734375
  },
  "constraints": {"vertical": "TOP", "horizontal": "LEFT"},
  "fills": [
    {
      "blendMode": "NORMAL",
      "type": "SOLID",
      "color": {
        "r": 0.43921568989753723,
        "g": 0.4941176474094391,
        "b": 0.6823529601097107,
        "a": 1.0
      }
    }
  ],
  "strokes": [],
  "strokeWeight": 1.0,
  "strokeAlign": "OUTSIDE",
  "styles": {"fill": "1:665"},
  "effects": [],
  "characters":
      "By Sign In, you agree to Digia's Terms of Use. Read our Privacy Policy.",
  "style": {
    "fontFamily": "DM Sans",
    "fontPostScriptName": "DMSans-Bold",
    "fontWeight": 700,
    "textAutoResize": "WIDTH_AND_HEIGHT",
    "fontSize": 14.0,
    "textAlignHorizontal": "LEFT",
    "textAlignVertical": "TOP",
    "letterSpacing": -0.28,
    "lineHeightPx": 26.0,
    "lineHeightPercent": 142.6376953125,
    "lineHeightPercentFontSize": 185.7142791748047,
    "lineHeightUnit": "PIXELS"
  },
  "layoutVersion": 4,
  "characterStyleOverrides": [
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    43,
    47,
    47,
    47,
    47,
    47,
    47,
    47,
    47,
    47,
    47,
    47,
    47,
    49,
    40,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    44,
    40,
    47,
    47,
    47,
    47,
    47,
    47,
    47,
    47,
    47,
    47,
    47,
    47,
    47,
    47,
    46
  ],
  "styleOverrideTable": {
    "49": {
      "fontFamily": "Nunito",
      "fontPostScriptName": "Nunito-Bold",
      "fontWeight": 700,
      "fontSize": 12.0,
      "letterSpacing": -0.30000001192092896,
      "fills": [
        {
          "blendMode": "NORMAL",
          "type": "SOLID",
          "color": {
            "r": 0.33725491166114807,
            "g": 0.3176470696926117,
            "b": 0.9647058844566345,
            "a": 1.0
          }
        }
      ],
      "lineHeightPx": 16.368000030517578,
      "lineHeightPercent": 100.0,
      "lineHeightUnit": "INTRINSIC_%"
    },
    "47": {
      "fontFamily": "Nunito",
      "fontPostScriptName": "Nunito-Bold",
      "fontWeight": 700,
      "hyperlink": {},
      "fontSize": 12.0,
      "letterSpacing": -0.30000001192092896,
      "fills": [
        {
          "blendMode": "NORMAL",
          "type": "SOLID",
          "color": {
            "r": 0.33725491166114807,
            "g": 0.3176470696926117,
            "b": 0.9647058844566345,
            "a": 1.0
          }
        }
      ],
      "lineHeightPx": 16.368000030517578,
      "lineHeightPercent": 100.0,
      "lineHeightUnit": "INTRINSIC_%"
    },
    "46": {
      "fontFamily": "Nunito",
      "fontPostScriptName": "Nunito-Bold",
      "fontWeight": 700,
      "fontSize": 12.0,
      "letterSpacing": -0.30000001192092896,
      "fills": [
        {
          "blendMode": "NORMAL",
          "type": "SOLID",
          "color": {
            "r": 0.12941177189350128,
            "g": 0.12941177189350128,
            "b": 0.12941177189350128,
            "a": 1.0
          }
        }
      ],
      "lineHeightPx": 16.368000030517578,
      "lineHeightPercent": 100.0,
      "lineHeightUnit": "INTRINSIC_%",
      "inheritFillStyleId": "1:666"
    },
    "44": {
      "fontFamily": "Nunito",
      "fontPostScriptName": "Nunito-Regular",
      "fontWeight": 400,
      "textAutoResize": "WIDTH_AND_HEIGHT",
      "fontSize": 12.0,
      "letterSpacing": -0.30000001192092896,
      "fills": [
        {
          "blendMode": "NORMAL",
          "type": "SOLID",
          "color": {
            "r": 0.33725491166114807,
            "g": 0.3176470696926117,
            "b": 0.9647058844566345,
            "a": 1.0
          }
        }
      ],
      "lineHeightPx": 16.368000030517578,
      "lineHeightPercent": 100.0,
      "lineHeightUnit": "INTRINSIC_%",
      "inheritTextStyleId": "1:667"
    },
    "43": {
      "fontFamily": "Nunito",
      "fontPostScriptName": "Nunito-Regular",
      "fontWeight": 400,
      "textAutoResize": "WIDTH_AND_HEIGHT",
      "fontSize": 12.0,
      "letterSpacing": -0.30000001192092896,
      "fills": [
        {
          "blendMode": "NORMAL",
          "type": "SOLID",
          "color": {
            "r": 0.6392157077789307,
            "g": 0.6823529601097107,
            "b": 0.8156862854957581,
            "a": 1.0
          }
        }
      ],
      "lineHeightPx": 16.368000030517578,
      "lineHeightPercent": 100.0,
      "lineHeightUnit": "INTRINSIC_%",
      "inheritTextStyleId": "1:667"
    },
    "40": {
      "fontFamily": "Nunito",
      "fontPostScriptName": "Nunito-Regular",
      "fontWeight": 400,
      "textAutoResize": "WIDTH_AND_HEIGHT",
      "fontSize": 12.0,
      "letterSpacing": -0.30000001192092896,
      "fills": [
        {
          "blendMode": "NORMAL",
          "type": "SOLID",
          "color": {
            "r": 0.12941177189350128,
            "g": 0.12941177189350128,
            "b": 0.12941177189350128,
            "a": 1.0
          }
        }
      ],
      "lineHeightPx": 16.368000030517578,
      "lineHeightPercent": 100.0,
      "lineHeightUnit": "INTRINSIC_%",
      "inheritFillStyleId": "1:666",
      "inheritTextStyleId": "1:667"
    }
  },
  "lineTypes": ["NONE"],
  "lineIndentations": [0]
};
