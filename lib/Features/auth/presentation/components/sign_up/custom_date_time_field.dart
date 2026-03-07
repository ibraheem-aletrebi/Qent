import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';

class CustomDatePickerField extends StatefulWidget {
  final String hintText;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? Function(String?)? validator;
  final Function(DateTime)? onDateSelected;

  const CustomDatePickerField({
    super.key,
    required this.hintText,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.validator,
    this.onDateSelected,
  });

  @override
  State<CustomDatePickerField> createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  DateTime? _selectedDate;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      _selectedDate = widget.initialDate;
      _controller.text = _formatDate(widget.initialDate!);
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  Future<void> _pickDate(FormFieldState<DateTime> field) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _controller.text = _formatDate(picked);
      });

      field.didChange(picked);
      widget.onDateSelected?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: _controller,
              readOnly: true,
              hint: widget.hintText,
              suffix: const Icon(Icons.calendar_month_rounded),
              validator: widget.validator,
              onTap: () => _pickDate(field),
            ),
          ],
        );
      },
    );
  }
}
