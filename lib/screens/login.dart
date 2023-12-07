import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Color miColor;
  late Size miSize;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    miColor = Theme.of(context).primaryColor;
    miSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: miColor,
        image: DecorationImage(
          image: const AssetImage("assets/images/fondo.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            miColor.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 50, child: _parteSuperior()),
            Positioned(bottom: 20, child: _parteInferior()),
          ],
        ),
      ),
    );
  }

  Widget _parteSuperior() {
    return SizedBox(
      width: miSize.width,
      child: const Column(
        children: [
          Icon(Icons.location_on, color: Colors.white, size: 100),
          Text(
            'GO MAP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _parteInferior() {
    return SizedBox(
      width: miSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _miFormulario(),
        ),
      ),
    );
  }

  Widget _miFormulario() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: TextStyle(
              color: miColor,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          _tipoTextoPlomo("Please login with your information"),
          const SizedBox(height: 40),
          _tipoTextoPlomo("Email adress"),
          _tipoInputField(),
          const SizedBox(height: 20),
          _tipoTextoPlomo("Password"),
          _tipoInputFieldPassword(),
          const SizedBox(height: 20),
          _crearCheckBox(),
          const SizedBox(height: 20),
          _crearBoton(),
          const SizedBox(height: 20),
          Center(
            child: _tipoTextoPlomo("Or Login with"),
          ),
          const SizedBox(height: 20),
          threeIconsInCircles(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _tipoTextoPlomo(String texto) {
    return Text(
      texto,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _tipoInputField() {
    return const TextField(
      decoration: InputDecoration(suffixIcon: Icon(Icons.done)),
    );
  }

  Widget _tipoInputFieldPassword() {
    return TextField(
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: miColor,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
    );
  }

  Widget _crearCheckBox() {
    bool rememberMe = true;

    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: (value) {
            setState(() {
              rememberMe = value!;
            });
          },
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Remember Me',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'I forgot my password',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _crearBoton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: miColor,
          elevation: 8,
          shadowColor: miColor,
          minimumSize: const Size(double.infinity, 50),
        ),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget threeIconsInCircles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _iconImage('assets/images/facebook2.png'),
        _iconImage('assets/images/iconox.png'),
        _iconImage('assets/images/github.png'),
      ],
    );
  }

  Widget _iconImage(String imagePath) {
    return Image.asset(
      imagePath,
      width: 50,
      height: 50,
    );
  }
}
