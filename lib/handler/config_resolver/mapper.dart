import 'package:figma_to_json_convertor/constants/widgets_name.dart';
import 'package:figma_to_json_convertor/handler/widgets/digia_widgets/dg_button.dart';
import 'package:figma_to_json_convertor/handler/widgets/digia_widgets/dg_column.dart';
import 'package:figma_to_json_convertor/handler/widgets/digia_widgets/dg_divider.dart';
import 'package:figma_to_json_convertor/handler/widgets/digia_widgets/dg_richtext.dart';
import 'package:figma_to_json_convertor/handler/widgets/digia_widgets/dg_row.dart';
import 'package:figma_to_json_convertor/handler/widgets/digia_widgets/dg_text.dart';
import 'package:figma_to_json_convertor/handler/widgets/digia_widgets/dg_textfield.dart';
import 'package:figma_to_json_convertor/handler/widgets/figma_widgets/fg_frame.dart';
import 'package:figma_to_json_convertor/handler/widgets/figma_widgets/fg_group.dart';
import 'package:figma_to_json_convertor/handler/models/ui_object_base_class.dart';

class WidgetsMapper {
  static UiObjectModelBase? getWidgetClass({
    required Map data,
    required Map resultJson,
  }) {
    String type = data['type'];
    String? fieldResolvedName = getWidgetName(data['name']);
    String name =
        fieldResolvedName != null ? fieldResolvedName.toUpperCase() : '';

    // FIRST TRY TO MAP WITH DG-WIDGETS
    switch (name) {
      case COLUMN:
        return DgColumnWidgetResolver(props: data, resultJson: resultJson);
      case ROW:
        return DgRowWidgetResolver(props: data, resultJson: resultJson);
      case TEXTFIELD:
        return DgTextFieldWidgetResolver(props: data, resultJson: resultJson);
      case DIVIDER:
        return DgDividerWidgetResolver(props: data, resultJson: resultJson);
      case BUTTON:
        return DgButtonWidgetResolver(props: data, resultJson: resultJson);
      case RICHTEXT:
        return DgRichTextWidgetResolver(props: data, resultJson: resultJson);
      case TEXT:
        return DgTextWidgetResolver(props: data, resultJson: resultJson);
      default:
        {
          print('Cannot map name: ${name} in WidgetsMapper');

          /// TRY MAPPING FOR TYPES
          switch (type) {
            case GROUP:
              return FgGroupWidgetResolver(props: data, resultJson: resultJson);
            case FRAME:
              return FgFrameWidgetResolver(props: data, resultJson: resultJson);
            default:
              {
                print('Cannot map type: ${type} in WidgetsMapper');
              }

              return null;
          }
        }
    }
  }

  static String? getWidgetName(String input) {
    RegExp regExp = RegExp(r'\[(.*?)\]|\((.*?)\)|\{(.*?)\}|\<(.*?)\>');
    // This regular expression matches text inside square brackets, parentheses, curly braces, or angle brackets.

    RegExpMatch? match = regExp.firstMatch(input);

    if (match != null) {
      // Find the non-null capturing group
      String? result =
          match.group(1) ?? match.group(2) ?? match.group(3) ?? match.group(4);
      print('Resolved name: ${result}');
      return result;
    } else {
      print("No match found. for ${input} name");
      return null;
    }
  }
}
