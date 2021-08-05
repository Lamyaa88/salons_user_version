import 'package:almezyn/utils/file_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class EntryField extends StatelessWidget {
  final String hint;
  final IconData prefixIcon;
  final Color color;
  final TextEditingController controller;
  final String initialValue;
  final bool readOnly;
  final TextAlign textAlign;
  final IconData suffixIcon;
  final TextInputType textInputType;
  final String label;
  final int maxLines;
  final Function onTap;
  final IconData suffix;
  final Function(String) onChanged;
  final Function(String) validation;
  final Function(String) onSaved;

  EntryField({
    this.hint,
    this.prefixIcon,
    this.color,
    this.controller,
    this.initialValue,
    this.readOnly,
    this.textAlign,
    this.suffixIcon,
    this.textInputType,
    this.label,
    this.maxLines,
    this.onTap,
    this.suffix,
    this.onChanged,
    this.validation,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        label != null
            ? Text('\n' + label + '\n',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Theme.of(context).disabledColor))
            : SizedBox.shrink(),
        Row(mainAxisAlignment : MainAxisAlignment.center,
          children: [
            Neumorphic(
              style:  NeumorphicStyle(
    shape: NeumorphicShape.flat,
    boxShape: NeumorphicBoxShape.roundRect(
    BorderRadius.circular(8)),
    depth: 1 ,
    lightSource: LightSource.topRight,
    shadowLightColor: Colors.white,
//                        shadowDarkColor: Colors.grey ,
    color: backGroundColor),

              child: Container(width: width(context)*.9,
                child: TextFormField(
                  controller: controller,
                  onChanged: onChanged,
                  initialValue: initialValue,
                  readOnly: readOnly ?? false,
                  maxLines: maxLines ?? 1,
                  validator: validation,
                  onSaved: onSaved,
                  textAlign: textAlign ?? TextAlign.left,
                  keyboardType: textInputType,
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(prefixIcon, color: Theme.of(context).primaryColor),
                    suffixIcon: Icon(suffixIcon),
                    hintText:  (translator.translate(hint)),
                    filled: true,
                    fillColor: color ?? Theme.of(context).backgroundColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onTap: onTap,
                ),
              ),
            ),
            if (suffix != null)
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: 8),
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    suffix,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
          ],
        ),
      ],
    );
  }
}
