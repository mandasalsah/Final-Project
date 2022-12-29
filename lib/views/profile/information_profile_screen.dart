import 'package:bismillahfinalproject/view_models/user_view_model.dart';
import 'package:bismillahfinalproject/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformationProfileScreen extends StatefulWidget {
  const InformationProfileScreen({super.key});

  @override
  State<InformationProfileScreen> createState() =>
      _InformationProfileScreenState();
}

class _InformationProfileScreenState extends State<InformationProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<UserViewModel>(context, listen: false).addUserDetail());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Account"),
        backgroundColor: const Color(0xFF607EAA),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Consumer<UserViewModel>(
            builder: (context, user, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.withOpacity(.5),
                      width: 5.0,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: ExactAssetImage('images/profile.png'),
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    TextField(
                      controller: TextEditingController(text: user.user.name),
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                        label: const Text("Full Name"),
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: TextEditingController(text: user.user.email),
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                        label: const Text("Email"),
                        prefixIcon: const Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: TextEditingController(text: user.user.phone),
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                        label: const Text("No.Handpone"),
                        prefixIcon: const Icon(Icons.phone_android),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
