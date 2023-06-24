import 'package:dase_backoffice/core/utils/dase_theme.dart';
import 'package:dase_backoffice/features/home/presentation/bloc/home_screen_bloc.dart';
import 'package:dase_backoffice/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: _HomeDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Crear Nuevo Cliente'),
            )
          ],
        ),
      ),
    );
  }
}

class _HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return Drawer(
          backgroundColor: Theme.of(context).primaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                    color: DaseTheme.primaryColor),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                iconColor: Colors.grey,
                title: const Text('Cerrar sesión'),
                onTap: () {
                  context.read<HomeScreenBloc>().add(HomeScreenSignOut());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
