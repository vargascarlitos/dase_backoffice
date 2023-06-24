import 'package:dase_backoffice/core/dependency_injection/dependency_injection_config.dart';
import 'package:dase_backoffice/features/home/presentation/bloc/home_screen_bloc.dart';
import 'package:dase_backoffice/features/home/presentation/screen/create_costumer.dart';
import 'package:dase_backoffice/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const path = '/home';
  static const name = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenBloc>(
      create: (_) => getIt<HomeScreenBloc>(),
      child: BlocListener<HomeScreenBloc, HomeScreenState>(
        listener: (context, state) {

        },
        child: const HomeView(),
      ),
    );
  }
}
