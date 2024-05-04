import 'package:flutter/material.dart';
import 'package:learning_flutter/constants/routes.dart';
import 'package:learning_flutter/utils/common.dart';

const limeGreen = 'FFA1D254';
const midnightBlack = 'FF18212D';

enum MenuAction { logout }

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          height: 70,
          color: Colors.white,
          alignment: Alignment.centerLeft,
        ),
        titleTextStyle: TextStyle(
          color: limeGreen.toColor(),
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
        backgroundColor: midnightBlack.toColor(),
        iconTheme: IconThemeData(color: limeGreen.toColor()),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: midnightBlack.toColor(),
              ),
              child: const Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              title: Text('Item 1'),
              onTap: null,
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () async {
                final shouldLogout = await showLogoutDialog(context);
                if (shouldLogout) {
                  // ignore: use_build_context_synchronously
                  replaceScreen(context, loginRoute);
                }
              },
            ),
          ],
        ),
      ),
      body: const Center(child: Text('This is dashboard')),
    );
  }
}

Future<bool> showLogoutDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign out'),
        content: const Text('You sure you wanna sign out?'),
        actions: [
          TextButton(
            onPressed: () => goBack(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => goBack(context, true),
            child: const Text('Log out'),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
