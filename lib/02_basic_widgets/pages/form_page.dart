import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
      ),
      body: const FormBody(),
    );
  }
}

class FormBody extends StatefulWidget {
  const FormBody({Key? key}) : super(key: key);

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: _usernameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                return (value ?? '').trim().isNotEmpty ? null : '用户名不能为空';
              },
            ),
            TextFormField(
              controller: _passwordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
                prefixIcon: Icon(Icons.lock),
              ),
              validator: (value) {
                return (value ?? '').trim().length >= 6 ? null : '密码不能少于6位';
              },
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    final formState = _formKey.currentState as FormState;
                    if (formState.validate()) {
                      debugPrint('校验通过');
                    }
                  },
                  child: const Text('登录'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
