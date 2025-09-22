import 'package:Hotelino/core/theme/theme_provider.dart';
import 'package:Hotelino/features/home/presentation/provider/profileProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  Consumer<Profileprovider>(
                    builder: (context, profileProvider, child) {
                      return profileProvider.profile?.notifications != null &&
                              profileProvider.profile!.notifications > 0
                          ? Positioned(
                            right: 13,
                            top: 14,
                            child: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              radius: 4,
                            ),
                          )
                          : SizedBox();
                    },
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  themeProvider.togleBrightness();
                },
                icon:
                    themeProvider.brightness == Brightness.light
                        ? Icon(Icons.dark_mode)
                        : Icon(Icons.light_mode),
                color: Colors.grey,
              ),
            ],
          ),

          Consumer<Profileprovider>(
            builder: (context, profileprovider, child) {
              return Row(
                children: [
                  Text(
                    profileprovider.profile?.name ?? 'کاربر',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      profileprovider.profile?.avatarUrl ??
                          'https://www.w3schools.com/howto/img_avatar.png',
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
