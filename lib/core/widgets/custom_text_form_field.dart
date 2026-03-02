import 'package:flutter/material.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/resources/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final int maxLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? initialValue;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onTap;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.prefix,
    this.suffix,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.initialValue,
    this.contentPadding,
    this.onTap,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late final TextEditingController _ctrl;
  late final FocusNode _focus;
  bool _ownCtrl = false;
  bool _ownFocus = false;
  bool _obscure = false;
  bool _hasFocus = false;
  String? _error;

  @override
  void initState() {
    super.initState();

    _ctrl =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    _ownCtrl = widget.controller == null;

    _focus = widget.focusNode ?? FocusNode();
    _ownFocus = widget.focusNode == null;

    _obscure = widget.isPassword;
    _focus.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    setState(() => _hasFocus = _focus.hasFocus);
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChanged);
    if (_ownCtrl) _ctrl.dispose();
    if (_ownFocus) _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.myColors;
    final Color borderColor = !widget.enabled
        ? c.divider
        : _error != null
        ? c.error
        : _hasFocus
        ? c.primary
        : c.divider;

    final Color labelColor = !widget.enabled
        ? c.textHint
        : _error != null
        ? c.error
        : _hasFocus
        ? c.primary
        : c.textSecondary;

    final Color iconColor = !widget.enabled
        ? c.textHint
        : _hasFocus
        ? c.primary
        : c.textHint;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTextStyles.semiBold13.copyWith(color: labelColor),
          ),
          SizedBox(height: AppSizes.h8),
        ],
        TextFormField(
          onTap: widget.onTap,
          controller: _ctrl,
          focusNode: _focus,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: _obscure,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          maxLength: widget.maxLength,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          initialValue: widget.controller == null ? null : widget.initialValue,
          onChanged: (v) {
            widget.onChanged?.call(v);
            if (_error != null) setState(() => _error = null);
          },
          onFieldSubmitted: widget.onSubmitted,
          validator: (v) {
            final err = widget.validator?.call(v);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) setState(() => _error = err);
            });
            return null; 
          },
          style: AppTextStyles.regular14.copyWith(
            color: widget.enabled ? c.textPrimary : c.textHint,
          ),
          cursorColor: c.primary,
          cursorHeight: 20,
          cursorWidth: 1.5,
          cursorRadius: const Radius.circular(1),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: AppTextStyles.regular14.copyWith(color: c.textHint),
            counterText: '',
            prefixIcon: widget.prefix != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.w14),
                    child: IconTheme(
                      data: IconThemeData(color: iconColor, size: AppSizes.w20),
                      child: widget.prefix!,
                    ),
                  )
                : null,
            prefixIconConstraints: widget.prefix != null
                ? const BoxConstraints(minWidth: 48, minHeight: 48)
                : null,
            suffixIcon: _buildSuffix(iconColor),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
            ),
    
            contentPadding:
                widget.contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: AppSizes.w16,
                  vertical: AppSizes.h14,
                ),
    
            filled: true,
            fillColor: widget.enabled ? c.surface : c.surface.withValues(alpha:0.6),
    
            enabledBorder: _border(borderColor, c),
            focusedBorder: _border(borderColor, c),
            errorBorder: _border(c.error, c),
            focusedErrorBorder: _border(c.error, c),
            disabledBorder: _border(c.divider, c),
            errorText: null, // manual below
            errorStyle: const TextStyle(fontSize: 0, height: 0),
          ),
        ),
    
        if (_error != null)
          Padding(
            padding: EdgeInsets.only(top: AppSizes.h6, left: AppSizes.w4),
            child: Row(
              children: [
                Icon(Icons.error_outline_rounded, size: 13, color: c.error),
                SizedBox(width: AppSizes.w4),
                Flexible(
                  child: Text(
                    _error!,
                    style: AppTextStyles.regular12.copyWith(color: c.error),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget? _buildSuffix(Color iconColor) {
    if (widget.isPassword) {
      return GestureDetector(
        onTap: () => setState(() => _obscure = !_obscure),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.w14),
          child: Icon(
            _obscure
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: AppSizes.w20,
            color: iconColor,
          ),
        ),
      );
    }

    if (widget.suffix != null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w14),
        child: IconTheme(
          data: IconThemeData(color: iconColor, size: AppSizes.w20),
          child: widget.suffix!,
        ),
      );
    }

    return null;
  }

  OutlineInputBorder _border(Color color, dynamic c) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: _hasFocus ? 1.5 : 1.0),
    borderRadius: BorderRadius.circular(AppSizes.r12),
  );
}
