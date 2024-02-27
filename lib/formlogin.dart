// ignore_for_file: unnecessary_const

import 'package:mbank/formregister.dart';
import 'package:mbank/home.dart';
import 'package:pinput/pinput.dart';
import 'package:mbank/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.translate)),
        ],
      ),
      body: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  bool _buttonDisabled = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _isUsernameEmpty = TextEditingController();
  final TextEditingController _isPasswordEmpty = TextEditingController();

  void changeButtonState() {
    setState(() {
      _buttonDisabled = _isUsernameEmpty.text.trim().isEmpty ||
          _isPasswordEmpty.text.trim().isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Enjoy all the features that make it easy for you to manage your finances',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _isUsernameEmpty,
                        onChanged: (text) {
                          changeButtonState();
                        },
                        validator: (isItEmpty) {
                          if (isItEmpty == null || isItEmpty.isEmpty) {
                            return 'Requierd';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email / Username',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          controller: _isPasswordEmpty,
                          onChanged: (text) {
                            changeButtonState();
                          },
                          validator: (isItEmpty) {
                            if (isItEmpty == null || isItEmpty.isEmpty) {
                              return 'Requierd';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, right: 10),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                      ),
                      const Text('Remember me'),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: TextButton(
                    onPressed: () {
                      // Handle Forgot Password button press
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: FilledButton(
                onPressed: _buttonDisabled
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const Pin())));
                        }
                      },
                style: FilledButton.styleFrom(
                    shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    minimumSize: const Size(343, 53)),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Text(
              'Other',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: OutlinedButton.icon(
                icon: Image.asset(
                  'materials/textures/icon_google.png',
                  width: 16,
                  height: 16,
                ),
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        const FakeGoogleAccountList()),
                style: OutlinedButton.styleFrom(
                    shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    minimumSize: const Size(343, 53)),
                label: const Text(
                  'Login with Gmail',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FormRegister()));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            ),
            const Text(
              'Warning!! No backend is configured yet. Only frontend',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: ColorMain.customDanger),
            )
          ],
        ),
      ),
    );
  }
}

class Pin extends StatefulWidget {
  const Pin({super.key});

  @override
  createState() => PinState();
}

class PinState extends State<Pin> {
  final _pinControll = TextEditingController();
  final _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _pinControll.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = ColorMain.customPrimary;
    const fillColor = ColorMain.customPrimaryBorder;
    const borderColor = ColorMain.customPrimaryBorder;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
            child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: SvgPicture.asset('materials/textures/lock.svg'),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: const Text(
                'Enter Security Code',
                textAlign: TextAlign.center,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Directionality(
                    // Specify direction if desired
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      controller: _pinControll,
                      focusNode: _focusNode,
                      obscureText: true,
                      defaultPinTheme: defaultPinTheme,
                      validator: (value) {
                        return value == '2222' ? null : 'Pin is incorrect';
                      },
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => Home())));
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: focusedBorderColor,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: ColorMain.customDanger),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class FakeGoogleAccountList extends StatelessWidget {
  const FakeGoogleAccountList({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      surfaceTintColor: Colors.white,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                width: 24,
                height: 24,
                child: Image.asset('materials/textures/icon_google.png'),
              ),
              const Text(
                'Sign in with Google',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
            ],
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            child: Column(
              children: [
                SvgPicture.asset(
                  'materials/textures/icon.svg',
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Choose an account',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'to continue to Dragonfly Bank',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Text(
                    'No users found',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
