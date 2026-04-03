import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ==================== COLORES ====================
const Color PRIMARY_COLOR = Color(0xFF5B3BA0);
const Color SECONDARY_COLOR = Color(0xFF3B5BA0);
const Color ACCENT_COLOR = Color(0xFF00A8CC);
const Color SUCCESS_COLOR = Color(0xFF2ECC71);
const Color WARNING_COLOR = Color(0xFFF39C12);
const Color DANGER_COLOR = Color(0xFFE74C3C);
const Color TEXT_PRIMARY = Color(0xFF2C3E50);
const Color TEXT_SECONDARY = Color(0xFF7F8C8D);
const Color BORDER_COLOR = Color(0xFFBDC3C7);
const Color SURFACE = Color(0xFFFFFFFF);
const Color BACKGROUND = Color(0xFFF8F9FA);

/// Widget: Botón personalizado
class CustomButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isOutlined;
  final IconData? icon;
  final double? width;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.icon,
    this.width,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.isLoading) ...[
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                widget.isOutlined ? PRIMARY_COLOR : SURFACE,
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
        if (widget.icon != null && !widget.isLoading) ...[
          Icon(widget.icon),
          const SizedBox(width: 8),
        ],
        Text(widget.label),
      ],
    );

    if (widget.isOutlined) {
      return OutlinedButton(
        onPressed: widget.isLoading ? null : widget.onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: Size(widget.width ?? 150, 48),
        ),
        child: buttonContent,
      );
    }

    return ElevatedButton(
      onPressed: widget.isLoading ? null : widget.onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(widget.width ?? 150, 48),
      ),
      child: buttonContent,
    );
  }
}

/// Widget: Campo de entrada con validación
class CustomInputField extends StatefulWidget {
  final String label;
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isRequired;
  final String? tooltipText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int maxLines;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomInputField({
    Key? key,
    required this.label,
    this.hintText,
    this.errorText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isRequired = false,
    this.tooltipText,
    this.onChanged,
    this.validator,
    this.maxLines = 1,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: TEXT_PRIMARY,
              ),
            ),
            if (widget.isRequired) ...[
              const SizedBox(width: 4),
              const Text('*', style: TextStyle(color: DANGER_COLOR)),
            ],
            if (widget.tooltipText != null) ...[
              const SizedBox(width: 8),
              Tooltip(
                message: widget.tooltipText!,
                child: const Icon(
                  Icons.info_outline,
                  size: 16,
                  color: TEXT_SECONDARY,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        Focus(
          onFocusChange: (focused) {
            setState(() => _isFocused = focused);
          },
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            onChanged: widget.onChanged,
            validator: widget.validator,
            maxLines: widget.maxLines,
            style: GoogleFonts.inter(fontSize: 14, color: TEXT_PRIMARY),
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              filled: true,
              fillColor: SURFACE,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: BORDER_COLOR),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: PRIMARY_COLOR, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: DANGER_COLOR),
              ),
              errorText: widget.errorText,
            ),
          ),
        ),
      ],
    );
  }
}

/// Widget: Tarjeta de operación
class OperationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String date;
  final String type;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const OperationCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
    required this.type,
    required this.onTap,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: InkWell(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icono
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: PRIMARY_COLOR.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.home_outlined,
                  color: PRIMARY_COLOR,
                ),
              ),
              const SizedBox(width: 12),

              // Contenido
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: TEXT_PRIMARY,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: ACCENT_COLOR.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            type,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ACCENT_COLOR,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: TEXT_SECONDARY,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          amount,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: SUCCESS_COLOR,
                          ),
                        ),
                        Text(
                          date,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: TEXT_SECONDARY,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Menu
              if (onDelete != null) ...[
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  color: DANGER_COLOR,
                  onPressed: onDelete,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget: Tarjeta de resultado
class ResultCard extends StatelessWidget {
  final String title;
  final String value;
  final String description;
  final Color? color;
  final IconData? icon;

  const ResultCard({
    Key? key,
    required this.title,
    required this.value,
    required this.description,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            if (icon != null) ...[
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: (color ?? PRIMARY_COLOR).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: color ?? PRIMARY_COLOR,
                ),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: TEXT_SECONDARY,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: color ?? PRIMARY_COLOR,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: TEXT_SECONDARY,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget: Divisor decorativo
class DecorativeDivider extends StatelessWidget {
  final String? label;
  final EdgeInsets padding;

  const DecorativeDivider({
    Key? key,
    this.label,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (label == null) {
      return Padding(
        padding: padding,
        child: const Divider(color: BORDER_COLOR),
      );
    }

    return Padding(
      padding: padding,
      child: Row(
        children: [
          const Expanded(child: Divider(color: BORDER_COLOR)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              label!,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: TEXT_SECONDARY,
              ),
            ),
          ),
          const Expanded(child: Divider(color: BORDER_COLOR)),
        ],
      ),
    );
  }
}

/// Widget: Mensaje vacío
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? buttonLabel;
  final VoidCallback? onButtonPressed;

  const EmptyState({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.buttonLabel,
    this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: TEXT_SECONDARY.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: TEXT_PRIMARY,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: TEXT_SECONDARY,
            ),
            textAlign: TextAlign.center,
          ),
          if (buttonLabel != null) ...[
            const SizedBox(height: 24),
            CustomButton(
              label: buttonLabel!,
              onPressed: onButtonPressed ?? () {},
            ),
          ],
        ],
      ),
    );
  }
}

/// Widget: Encabezado de sección
class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onAction;
  final String? actionLabel;

  const SectionHeader({
    Key? key,
    required this.title,
    this.subtitle,
    this.onAction,
    this.actionLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: TEXT_PRIMARY,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: TEXT_SECONDARY,
                  ),
                ),
              ],
            ],
          ),
          if (onAction != null)
            TextButton(
              onPressed: onAction,
              child: Text(
                actionLabel ?? 'Ver más',
                style: GoogleFonts.inter(
                  color: ACCENT_COLOR,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
