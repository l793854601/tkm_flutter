import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TextField Page'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              LoginTextFieldsWidget(),
              FeedbackTextFieldWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginTextFieldsWidget extends StatefulWidget {
  const LoginTextFieldsWidget({Key? key}) : super(key: key);

  @override
  State<LoginTextFieldsWidget> createState() => _LoginTextFieldsWidgetState();
}

class _LoginTextFieldsWidgetState extends State<LoginTextFieldsWidget> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      debugPrint('user name changed: ${_usernameController.text}');
    });

    _passwordController.addListener(() {
      debugPrint('password changed: ${_passwordController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _usernameController,
            focusNode: _usernameFocusNode,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: '用户名',
              hintText: '请输入用户名',
              prefixIcon: Icon(Icons.person),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            autofocus: false,
            decoration: const InputDecoration(
              labelText: '密码',
              hintText: '请输入密码',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                _usernameFocusNode.unfocus();
                _passwordFocusNode.unfocus();
                debugPrint(
                    'username: ${_usernameController.text}, password = ${_passwordController.text}');
              },
              child: const Text('登录'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class FeedbackTextFieldWidget extends StatefulWidget {
  const FeedbackTextFieldWidget({Key? key}) : super(key: key);

  @override
  State<FeedbackTextFieldWidget> createState() =>
      _FeedbackTextFieldWidgetState();
}

class _FeedbackTextFieldWidgetState extends State<FeedbackTextFieldWidget> {
  final _controller = TextEditingController();
  var _realInputLength = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _handleTextChanged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //  使用ConstrainedBox修改TextField默认高度
          ConstrainedBox(
            constraints: BoxConstraints.tight(
              const Size(double.infinity, 100),
            ),
            child:  TextField(
              controller: _controller,
              //  设置多行后，TextField高度生效
              maxLines: 100,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Text('$_realInputLength'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTextChanged() {
    final int realInputLength;
    final isComposingRangeValid = _controller.value.isComposingRangeValid;
    if (isComposingRangeValid) {
      final start = _controller.value.composing.start;
      final end = _controller.value.composing.end;
      final length = _controller.text.length;
      final realInputText = _controller.text.substring(0, start) + _controller.text.substring(end, length);
      realInputLength = realInputText.length;
    } else {
      realInputLength = _controller.text.length;
    }

    if (_realInputLength != realInputLength) {
      setState(() {
        _realInputLength = realInputLength;
      });
    }
  }
}
