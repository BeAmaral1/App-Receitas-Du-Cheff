import 'dart:async';
import 'package:flutter/material.dart';
import 'package:receitas_du_cheff/utils/app_routes.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _isLoading = true;
  bool _isConfirmed = false;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      // Após 1 segundo, exibe a animação de confirmação
      Timer(Duration(seconds: 0), () {
        setState(() {
          _isConfirmed = true;
        });
        // Navega para a tela inicial após 1 segundo da animação de confirmação
        Timer(Duration(seconds: 2), () {
          Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: _isLoading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Preparando seu aplicativo...', style: TextStyle(fontSize: 24, color: Colors.black)),
                      SizedBox(height: 15),
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                      ),
                    ],
                  )
                : _isConfirmed
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Login concluído', style: TextStyle(fontSize: 24, color: Colors.black)),
                          SizedBox(height: 5),
                          Icon(Icons.check_circle, color: Colors.orange, size: 58),
                        ],
                      )
                    : SizedBox(), // Widget vazio quando não está carregando nem confirmado
          ),
        ],
      ),
    );
  }
}
