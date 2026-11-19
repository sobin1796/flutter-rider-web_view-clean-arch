import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tukaatuexpress/features/{{name.snakeCase()}}/presentation/cubit/{{name.snakeCase()}}_cubit.dart';
import 'package:tukaatuexpress/features/{{name.snakeCase()}}/presentation/cubit/{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Screen extends {{#isStateless}}StatelessWidget{{/isStateless}}{{^isStateless}}StatefulWidget{{/isStateless}} {
  const {{name.pascalCase()}}Screen({super.key});
  {{^isStateless}}
  @override
  State<{{name.pascalCase()}}Screen> createState() =>
      _{{name.pascalCase()}}ScreenState();
}

class _{{name.pascalCase()}}ScreenState extends State<{{name.pascalCase()}}Screen> {
  {{/isStateless}}
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('{{name.pascalCase()}}')),
        body: Center(child: Text('State: ${state.theStates.name}')),
      ),
    );
  }
}
