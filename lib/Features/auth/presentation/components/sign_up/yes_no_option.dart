import 'package:flutter/material.dart';
import 'package:quent/generated/l10n.dart';

class YesNoOption extends StatefulWidget {
  final bool? value;
  final ValueChanged<bool> onChanged;
  final String? label;
  const YesNoOption({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });

  @override
  State<YesNoOption> createState() => _YesNoOptionState();
}

class _YesNoOptionState extends State<YesNoOption> {
  late bool? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  void select() {
    setState(() {
      selectedValue = !selectedValue!;
    });
    widget.onChanged(selectedValue!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.label!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildOption(
              text: S.of(context).yes,
              selected: selectedValue! == true,
              color: Colors.green,
              onTap: () => select(),
            ),
            const SizedBox(width: 16),
            _buildOption(
              text: S.of(context).no,
              selected: selectedValue! == false,
              color: Colors.red,
              onTap: () => select(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOption({
    required String text,
    required bool selected,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color: selected ? color.withValues(alpha: .1) : Colors.transparent,
            border: Border.all(
              color: selected ? color : Colors.grey[300]!,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: color.withValues(alpha: .3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              color: selected ? color : Colors.grey[700],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            child: Text(text, style: TextTheme.of(context).titleMedium),
          ),
        ),
      ),
    );
  }
}
