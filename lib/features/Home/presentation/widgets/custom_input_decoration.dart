import 'package:flutter/material.dart';

InputDecoration CustomInputDecoration(
    {required String hintText, Color? color, TextStyle? hintStyle}) {
  return InputDecoration(
      hintStyle: hintStyle,
      hintText: hintText,
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent)),
      disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent)),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent)),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent)),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent)),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent)),
      filled: true,
      fillColor: color ?? Colors.transparent);
}
