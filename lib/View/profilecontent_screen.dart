

// Profile Content Screen (for the profile tab)
import 'package:flutter/material.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/View/Auth/edit_profile_screen.dart';
import 'package:gamerconnect/providers/auth_pro.dart';
import 'package:provider/provider.dart';

class ProfileContentScreen extends StatelessWidget {
  const ProfileContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthPro>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back , color: Colors.white,)),
            title:Text(
                    provider.userData?.name ?? 'User Name',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true
                  ,
            automaticallyImplyLeading: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // User Avatar
                  Center(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            provider.userData != null &&
                                    provider.userData!.profile != null &&
                                    provider.userData!.profile!.isNotEmpty
                                ? provider.userData!.profile!
                                : 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // User Name
                  
                  const SizedBox(height: 8),
                  // User Email
                  Text(
                    provider.userData?.email ?? 'user@email.com',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Profile Options
                  _buildProfileOption(
                    icon: Icons.person,
                    title: 'Edit Profile',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildProfileOption(
                    icon: Icons.shopping_cart, // Added cart option
                    title: 'My Cart',
                    onTap: () {
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildProfileOption(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {
                      // Navigate to settings screen
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildProfileOption(
                    icon: Icons.help,
                    title: 'Help & Support',
                    onTap: () {
                      // Navigate to help screen
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Show cart dialog (you can replace this with actual cart screen)
  
  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.btnColor.withOpacity(.2),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(icon, size: 30, color: AppColor.btnColor),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}