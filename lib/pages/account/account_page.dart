import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/base/custom_loader.dart';
import 'package:hc_e_commerce_food_delivery/controller/auth_controller.dart';
import 'package:hc_e_commerce_food_delivery/controller/cart_controller.dart';
import 'package:hc_e_commerce_food_delivery/controller/user_controller.dart';
import 'package:hc_e_commerce_food_delivery/routes/routes_helper.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';
import 'package:hc_e_commerce_food_delivery/widgets/account_widget.dart';
import 'package:hc_e_commerce_food_delivery/widgets/app_icons.dart';
import 'package:hc_e_commerce_food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    //check user logged
    bool userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      // print("user has logged in");
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: "Profile",
            color: Colors.white,
          ),
          centerTitle: true,
        ),
        body: GetBuilder<UserController>(builder: (userController) {
          return userLoggedIn
              ? (userController.isLoading
                  ? Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimension.height20),
                      child: Column(
                        children: [
                          //profile icon
                          AppIcon(
                            icon: Icons.person,
                            backgroundcolor: AppColors.mainColor,
                            iconColor: Colors.white,
                            iconSize: Dimension.height80,
                            size: Dimension.height15 * 10,
                          ),
                          SizedBox(height: Dimension.height30),
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              children: [
                                //name
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.person,
                                    backgroundcolor: AppColors.mainColor,
                                    iconColor: Colors.white,
                                    iconSize: Dimension.iconSize24,
                                    size: Dimension.size20 * 2.5,
                                  ),
                                  bigText: BigText(
                                    text: userController.userModel.name
                                        .toString(),
                                  ),
                                ),
                                SizedBox(height: Dimension.height20),
                                //phone
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.phone,
                                    backgroundcolor: Colors.yellow,
                                    iconColor: Colors.white,
                                    iconSize: Dimension.iconSize24,
                                    size: Dimension.size20 * 2.5,
                                  ),
                                  bigText: BigText(
                                    text: userController.userModel.phone
                                        .toString(),
                                  ),
                                ),
                                SizedBox(height: Dimension.height20),
                                //email
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.email,
                                    backgroundcolor: Colors.grey,
                                    iconColor: Colors.white,
                                    iconSize: Dimension.iconSize24,
                                    size: Dimension.size20 * 2.5,
                                  ),
                                  bigText: BigText(
                                    text: userController.userModel.email
                                        .toString(),
                                  ),
                                ),
                                SizedBox(height: Dimension.height20),
                                //address
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.map,
                                    backgroundcolor: Colors.green,
                                    iconColor: Colors.white,
                                    iconSize: Dimension.iconSize24,
                                    size: Dimension.size20 * 2.5,
                                  ),
                                  bigText: BigText(
                                    text: "my map",
                                  ),
                                ),
                                SizedBox(height: Dimension.height20),
                                //message
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.message,
                                    backgroundcolor: Colors.blue,
                                    iconColor: Colors.white,
                                    iconSize: Dimension.iconSize24,
                                    size: Dimension.size20 * 2.5,
                                  ),
                                  bigText: BigText(
                                    text: "message",
                                  ),
                                ),
                                SizedBox(height: Dimension.height20),
                                //checkout
                                GestureDetector(
                                  onTap: () {
                                    if (Get.find<AuthController>()
                                        .userLoggedIn()) {
                                      Get.find<AuthController>()
                                          .clearSharedData();
                                      Get.find<CartController>().clear();
                                      Get.find<CartController>()
                                          .clearCartHistoryList();
                                      Get.offNamed(
                                          RoutesHelper.getSignInPage());
                                    } else {
                                      print("You are not logged in");
                                    }
                                  },
                                  child: AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.logout,
                                      backgroundcolor: Colors.red,
                                      iconColor: Colors.white,
                                      iconSize: Dimension.iconSize24,
                                      size: Dimension.size20 * 2.5,
                                    ),
                                    bigText: BigText(
                                      text: "Logoutt",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    )
                  : const CustomLoader())
              : Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: Dimension.height100 * 2,
                        margin: EdgeInsets.only(
                            left: Dimension.width20, right: Dimension.width20),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/image/signintocontinue.png",
                              )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesHelper.getSignInPage());
                        },
                        child: Container(
                          width: double.maxFinite,
                          height: Dimension.height20 * 5,
                          margin: EdgeInsets.only(
                              top: Dimension.font16,
                              left: Dimension.width20,
                              right: Dimension.width20),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimension.radius20),
                          ),
                          child: Center(
                            child: BigText(
                              text: "Sign in",
                              color: Colors.white,
                              size: Dimension.font30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        }));
  }
}
