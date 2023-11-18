import 'package:fl_structure/bussiness_logic/blocs/login_bloc/login_bloc.dart';
import 'package:fl_structure/bussiness_logic/blocs/toggle_blocs/auth_screen_toggle_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProvider extends StatelessWidget {
  final Widget child;
  final bool lazy;

  const AppBlocProvider({
    Key? key,
    required this.child,
    this.lazy = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: lazy, create: (_) => LoginBloc()),
        BlocProvider(lazy: lazy, create: (_) => AnimatedContainerToggleBloc()),
        BlocProvider(lazy: lazy, create: (_) => AnimatedOpacityToggleBloc()),

],
      child: child,
    );
  }
}
