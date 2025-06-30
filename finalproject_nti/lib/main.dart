import 'package:bloc/bloc.dart';
import 'package:finalproject_nti/core/bloc_observer.dart';
import 'package:finalproject_nti/myapp.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

