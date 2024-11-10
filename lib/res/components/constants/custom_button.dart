import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.btnText,
    this.onPressed,
    this.isloading = false,
  });
  final String btnText;
  final void Function()? onPressed;
  final bool isloading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
      ),
      onPressed: onPressed,
      child: isloading
          ? CircularProgressIndicator(
              color: theme.colorScheme.onPrimary,
            )
          : Text(
              btnText,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
    );
  }
}
