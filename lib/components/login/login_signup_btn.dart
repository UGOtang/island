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
          child: const Text("登录"),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
