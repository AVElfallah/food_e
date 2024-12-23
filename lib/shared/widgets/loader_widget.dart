import 'package:flutter/material.dart';

OverlayEntry? _overlayEntry;

// Show the loader
void showLoader(BuildContext context) {
  _overlayEntry = OverlayEntry(
    builder: (context) => Positioned.fill(
      child: Container(
        color: Colors.black38,
        height: double.infinity,
        width: double.infinity,
        child: const Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),
      ),
    ),
  );
  Overlay.of(context).insert(_overlayEntry!);
}

// Hide the loader
void hideLoader() {
  _overlayEntry?.remove();
}
