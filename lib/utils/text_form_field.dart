import 'package:flutter/material.dart';
import 'package:learning_flutter/utils/common.dart';

class InputFieldWidget extends StatefulWidget {
  final BuildContext context;
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final bool isPassword;
  final bool enableSuggestions;
  final bool autocorrect;

  const InputFieldWidget({
    super.key,
    required this.context,
    required this.controller,
    required this.label,
    this.validator,
    this.isPassword = false,
    this.enableSuggestions = false,
    this.autocorrect = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _InputFieldWidgetState createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  late final OutlineInputBorder _borderObject;
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = widget.isPassword;
    _borderObject = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      borderSide: BorderSide(color: 'FF8E97A4'.toColor()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: TextFormField(
        controller: widget.controller,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 0.8,
        ),
        validator: widget.validator,
        obscureText: _passwordVisible,
        enableSuggestions: widget.enableSuggestions,
        autocorrect: widget.autocorrect,
        decoration: InputDecoration(
          focusColor: Colors.black,
          label: Text(
            widget.label,
            textAlign: TextAlign.left,
            style: TextStyle(color: 'FF8E97A4'.toColor(), fontSize: 14),
          ),
          border: _borderObject,
          focusedBorder: _borderObject,
          enabledBorder: _borderObject,
          suffixIcon: !widget.isPassword
              ? null
              : IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(widget.context).primaryColorDark,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
        ),
      ),
    );
  }
}
