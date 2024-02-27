import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './theme.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.translate)),
        ],
      ),
      body: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                'Register',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Create an account and enjoy the benefits we provide for you',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterWithEmail()));
                },
                style: FilledButton.styleFrom(
                    shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    minimumSize: const Size(343, 53)),
                child: const Text(
                  'Register with email',
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
                  'Register with Gmail',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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

class RegisterWithEmail extends StatefulWidget {
  const RegisterWithEmail({super.key});

  @override
  createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterWithEmail> {
  bool _buttonDisabled = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _isUsernameEmpty = TextEditingController();
  final TextEditingController _isPasswordEmpty = TextEditingController();

  void changeButtonState() {
    setState(() {
      _buttonDisabled = _isUsernameEmpty.text.trim().isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.translate)),
        ],
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Register',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Enter your email address',
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
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height / 2) - 50,
                    bottom: 10),
                child: FilledButton(
                  onPressed: _buttonDisabled
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {}
                        },
                  style: FilledButton.styleFrom(
                      shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      minimumSize: const Size(343, 53)),
                  child: const Text(
                    'next',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Text(
                'Warning!! No backend is configured yet. Only frontend',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w800, color: ColorMain.customDanger),
              )
            ],
          ),
        ),
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
