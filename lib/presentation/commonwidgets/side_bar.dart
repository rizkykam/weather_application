import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_application/application/provider.dart';

class Sidebar extends ConsumerWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeRef = ref.watch(themeProvider);
    final thempRef = ref.watch(themperatureProvider);
    final theme = Theme.of(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 42.h, left: 12.w, right: 12.w, bottom: 20.h),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Menu', style: theme.textTheme.titleLarge,),
              const SizedBox(height: 4, child: Divider(color: Color(0xff9E9E9E), thickness: 1,),),
              ItemMenu(
                title: 'Home',
                onClick: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              ItemMenu(
                title: 'Favorites',
                onClick: () {
                  Navigator.pushNamed(context, '/favorites');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Settings', style: theme.textTheme.titleLarge,),
              ),
              const SizedBox(height: 4, child: Divider(color: Color(0xff9E9E9E), thickness: 1,),),
              ListTile(
                title: const Text('Theme'),
                leading: Switch(
                  value: themeRef == ThemeMode.light,
                  onChanged: (value) {
                    ThemeMode mode = value ? ThemeMode.light : ThemeMode.dark;
                    ref.read(themeProvider.notifier).state = mode;
                  },
                ),
              ),
              ListTile(
                title: const Text('Themperature'),
                leading: Switch(
                  value: thempRef == ThemperatureData.celsius,
                  onChanged: (value) {
                    ref.read(themperatureProvider.notifier).state = value ? ThemperatureData.celsius : ThemperatureData.fahrenheit;
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ItemMenu extends ConsumerWidget {
  final void Function() onClick;
  final String title;

  const ItemMenu({super.key, required this.onClick, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onClick,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(vertical: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white.withOpacity(0.37),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        child: Text(title, style: theme.textTheme.bodyLarge,),
      ),
    );
  }

}