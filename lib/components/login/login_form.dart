import 'package:flutter/material.dart';
import 'package:get/get.dart'; // ✅ 使用 GetX 进行页面跳转
import 'package:island/components/general/already_have_an_account_acheck.dart';
import 'package:island/utils/constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  bool _isSending = false; // 标记是否正在发送验证码

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // 📌 手机号输入框
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "请输入手机号",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.phone),
              ),
            ),
          ),

          // 📌 验证码输入框（带小纸飞机按钮）
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "输入验证码",
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
                suffixIcon: _isSending
                    ? const Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: CircularProgressIndicator(),
                      )
                    : IconButton(
                        icon: const Icon(Icons.send, color: kPrimaryColor),
                        onPressed: _sendCode, // 点击发送验证码
                      ),
              ),
            ),
          ),

          const SizedBox(height: defaultPadding),

          // 📌 登录按钮
          ElevatedButton(
            onPressed: _login,
            child: Text(
              "登录".toUpperCase(),
            ),
          ),

          const SizedBox(height: defaultPadding),

          // 📌 已有账户？去注册
          AlreadyHaveAnAccountCheck(
            press: () {
              Get.toNamed('/register'); // ✅ 使用 GetX 进行页面跳转
            },
          ),
        ],
      ),
    );
  }

  // 📌 发送验证码逻辑
  void _sendCode() {
    String phone = _phoneController.text.trim();

    if (phone.isEmpty || !RegExp(r'^\d{11}$').hasMatch(phone)) {
      Get.snackbar("错误", "请输入有效的手机号",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    setState(() => _isSending = true);

    // 模拟 API 请求，3 秒后恢复按钮状态
    Future.delayed(const Duration(seconds: 3), () {
      setState(() => _isSending = false);
      Get.snackbar("验证码已发送", "请检查短信",
          backgroundColor: Colors.green, colorText: Colors.white);
    });
  }

  // 📌 登录逻辑
  void _login() {
    String phone = _phoneController.text.trim();
    String code = _codeController.text.trim();

    if (phone.isEmpty || code.isEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "错误",
          message: "手机号和验证码不能为空",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.only(top: 100), // ✅ 调整位置
          borderRadius: 8,
          duration: Duration(seconds: 2),
        ),
      );

      return;
    }

    // 这里可以调用 API 进行登录验证
    Get.snackbar("登录成功", "欢迎回来！",
        backgroundColor: Colors.green, colorText: Colors.white);
    Get.offAllNamed('/home'); // 登录成功后跳转到主页
  }
}
