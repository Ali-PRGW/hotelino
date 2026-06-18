import 'package:flutter/material.dart';

void unFocusedEditors(BuildContext context){

  FocusManager.instance.primaryFocus?.unfocus();
  FocusScope.of(context).unfocus();
  
}