import 'package:bismillahfinalproject/views/profile/information_profile_screen.dart';
import 'package:bismillahfinalproject/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../../view_models/login_view_model.dart';
import '../auth/login_screen.dart';
import '../cart/cart_screen.dart';
import '../wishlist/wishlist_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: const Text("Profile Page"),
          backgroundColor: const Color(0xFF607EAA),
          automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color(0xFF607EAA).withOpacity(.5),
                      width: 5.0),
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: ExactAssetImage('images/profile.png'),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ProfileWidget(
                titles: "My Account",
                icon: Icons.person,
                onPress: () {
                  Navigator.of(context).push(
                    NavigatorFadeTransitionHelper(
                      child: const InformationProfileScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileWidget(
                titles: "Wishlist",
                icon: Icons.favorite,
                onPress: () {
                  Navigator.of(context).push(
                    NavigatorFadeTransitionHelper(
                      child: const WishlistScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileWidget(
                titles: "Transaction", 
                icon: Icons.person,
                onPress: () {
                  Navigator.of(context).push(
                    NavigatorFadeTransitionHelper(
                      child: const CartScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<LoginViewModel>(
                builder: (context, login, _) => ProfileWidget(
                  titles: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textcolor: Colors.red,
                  endIcon: false,
                  onPress: () async {
                    await login.logout().then(
                          (_) => Fluttertoast.showToast(msg: "Berhasil Logout")
                              .then(
                            (_) => Navigator.of(context).pushAndRemoveUntil(
                                NavigatorFadeTransitionHelper(
                                    child: const LoginScreen()),
                                (route) => false),
                          ),
                        );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
