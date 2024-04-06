import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseTextFormField extends StatefulWidget {
  const BaseTextFormField({
    super.key,
    ValueKey? textFieldKey,
    required String labelText,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool isObscureText = false,
    required TextInputType keyboardType,
    required TextInputAction textInputAction,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    required TextEditingController controller,
    BoxConstraints? constraints,
    TextStyle? textStyle,
    FloatingLabelBehavior? floatingLabelBehavior,
    bool? isDense,
    String? initialValue,
    EdgeInsetsGeometry? contentPadding,
    bool autofocus = false,
    bool autocorrect = true,
    Function(String?)? onFieldSubmitted,
    bool? filled,
    Color? fillColor,
    InputBorder? focusedBorder,
    InputBorder? enabledBorder,
    String obscuringCharacter = '•',
    TextAlign textAlign = TextAlign.start,
    TextCapitalization textCapitalization = TextCapitalization.none,
    FocusNode? focusNode,
    void Function()? onEditingComplete,
    void Function()? onTap,
    bool readOnly = false,
    int? minLines,
    int? maxLines,
    bool isEnabled = true,
    String? errorText,
    double? borderRadius,
  })  : _textFieldKey = textFieldKey,
        _labelText = labelText,
        _hintText = hintText,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _validator = validator,
        _isObscureText = isObscureText,
        _controller = controller,
        _onChanged = onChanged,
        _keyboardType = keyboardType,
        _textInputAction = textInputAction,
        _inputFormatters = inputFormatters,
        _constraints = constraints,
        _textStyle = textStyle,
        _floatingLabelBehavior = floatingLabelBehavior,
        _isDense = isDense,
        _initialValue = initialValue,
        _contentPadding = contentPadding,
        _autofocus = autofocus,
        _onFieldSubmitted = onFieldSubmitted,
        _autocorrect = autocorrect,
        _filled = filled,
        _fillColor = fillColor,
        _focusedBorder = focusedBorder,
        _enabledBorder = enabledBorder,
        _obscuringCharacter = obscuringCharacter,
        _textAlign = textAlign,
        _textCapitalization = textCapitalization,
        _focusNode = focusNode,
        _onEditingComplete = onEditingComplete,
        _onTap = onTap,
        _readOnly = readOnly,
        _minLines = minLines,
        _maxLines = minLines,
        _isEnabled = isEnabled,
        _errorText = errorText,
        _borderRadius = borderRadius;

  final ValueKey? _textFieldKey;
  final TextEditingController _controller;
  final String _labelText;
  final String? _hintText;
  final Widget? _prefixIcon;
  final Widget? _suffixIcon;
  final bool _isObscureText;
  final TextInputType _keyboardType;
  final TextInputAction _textInputAction;
  final List<TextInputFormatter>? _inputFormatters;
  final String? Function(String?)? _validator;
  final Function(String)? _onChanged;
  final BoxConstraints? _constraints;
  final TextStyle? _textStyle;
  final FloatingLabelBehavior? _floatingLabelBehavior;
  final bool? _isDense;
  final String? _initialValue;
  final EdgeInsetsGeometry? _contentPadding;
  final bool _autofocus;
  final bool _autocorrect;
  final Function(String?)? _onFieldSubmitted;
  final bool? _filled;
  final Color? _fillColor;
  final InputBorder? _focusedBorder;
  final InputBorder? _enabledBorder;
  final String _obscuringCharacter;
  final TextAlign _textAlign;
  final TextCapitalization _textCapitalization;
  final FocusNode? _focusNode;
  final void Function()? _onEditingComplete;
  final void Function()? _onTap;
  final bool _readOnly;
  final int? _minLines;
  final int? _maxLines;
  final bool _isEnabled;
  final String? _errorText;
  final double? _borderRadius;

  @override
  State<BaseTextFormField> createState() => _BaseTextFormFieldState();
}

class _BaseTextFormFieldState extends State<BaseTextFormField> {
  String _value = "";

  @override
  void initState() {
    super.initState();
    widget._controller.addListener(() => setTextValue());
  }

  @override
  void dispose() {
    widget._controller.removeListener(() => setTextValue());
    super.dispose();
  }

  void setTextValue() {
    if (!mounted) return;
    setState(() {
      _value = widget._controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget._textFieldKey,
      initialValue: widget._initialValue,
      controller: widget._controller,
      obscureText: widget._isObscureText,
      obscuringCharacter: widget._obscuringCharacter,
      keyboardType: widget._keyboardType,
      textInputAction: widget._textInputAction,
      autofocus: widget._autofocus,
      autocorrect: widget._autocorrect,
      textAlign: widget._textAlign,
      textCapitalization: widget._textCapitalization,
      focusNode: widget._focusNode,
      readOnly: widget._readOnly,
      minLines: widget._minLines ?? 1,
      maxLines: widget._maxLines ?? 1,
      decoration: InputDecoration(
        labelText: widget._labelText,
        labelStyle: widget._textStyle,
        hintText: widget._hintText,
        errorText: widget._errorText,
        isDense: widget._isDense,
        filled: widget._filled,
        fillColor: widget._fillColor,
        floatingLabelBehavior:
            widget._floatingLabelBehavior ?? FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget._borderRadius ?? 8.0,
          ),
        ),
        focusedBorder: widget._focusedBorder,
        enabledBorder: widget._enabledBorder,
        prefixIcon: widget._prefixIcon,
        suffixIcon: Padding(
          padding: EdgeInsets.only(
            right: 8.w,
          ),
          child: widget._suffixIcon,
        ),
        constraints: widget._constraints,
        contentPadding: widget._contentPadding,
      ),
      style: widget._textStyle,
      inputFormatters: widget._inputFormatters,
      validator: widget._validator,
      onChanged: widget._onChanged,
      onFieldSubmitted: widget._onFieldSubmitted,
      onEditingComplete: widget._onEditingComplete,
      onTap: widget._onTap,
      enabled: widget._isEnabled,
    );
  }
}
