// login_signup_btn.dart 假设是你的登录/注册按钮文件
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // ✅ 引入 get

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 登录按钮
        ElevatedButton(
          onPressed: () {
            // ✅ 使用 GetX 跳转到 /login 路由
            Get.toNamed('/login');
          },
          child: const Text("Login"),
        ),
        const SizedBox(height: 16),
        // 注册按钮 (如果有的话)
        ElevatedButton(
          onPressed: () {
            // 你也可以在这里跳转到其他页面，比如 "/register"
            // 或者 Get.to(()=> AnotherScreen());
          },
          child: const Text("Signup"),
        ),
      ],
    );
  }
}
