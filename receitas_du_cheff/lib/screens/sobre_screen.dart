import 'package:flutter/material.dart';
import 'package:receitas_du_cheff/utils/app_routes.dart';

class SobreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.homeRoute, // Nome da rota da sua página inicial
              (route) => false, // Remove todas as rotas anteriores
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white, // Definindo a cor de fundo da tela como branca
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 300, // Altura modificada para a logo
                color: Colors.orange, // Cor de fundo laranja
                child: Center(
                  child: Container(
                    height: 250, // Defina a altura desejada para a logo
                    width: 250, // Defina a largura desejada para a logo
                    child: Image.asset(
                      'assets/images/logo1.png',
                      fit: BoxFit.cover, // Ajuste para cobrir todo o espaço do Container
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'História',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'O aplicativo Receitas du Cheff, é dedicado a fornecer atualizações constantes sobre o universo da gastronomia, apresentando receitas brasileiras e internacionais. O aplicativo se destacará pela automação exclusiva, suporte preciso e responsividade, visando atrair entusiastas da culinária interessados em explorar novas abordagens gastronômicas por meio de um acesso fácil via dispositivos móveis ou web.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Desenvolvedores',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Bernardo Amaral - Desenvolvedor Flutter',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(width: 10),
                            Image.asset(
                              'assets/images/fotobernardo.png',
                              height: 40,
                              width: 40,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Pedro Prudêncio - Desenvolvedor Flutter',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(width: 10),
                            Image.asset(
                              'assets/images/fotopedro.jpg',
                              height: 40,
                              width: 40,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Leonardo Ermel - Analista de Negócios',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(width: 10),
                            Image.asset(
                              'assets/images/fotoleonardo3.png',
                              height: 40,
                              width: 40,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Leonardo Hoffman - Designer de UI/UX',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(width: 10),
                            Image.asset(
                              'assets/images/fotoleonardo2.jpg',
                              height: 40,
                              width: 40,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Redes Sociais',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.facebook),
                          onPressed: () {
                            // Adicione a ação para abrir o Facebook
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.face),
                          onPressed: () {
                            // Adicione a ação para abrir o Instagram
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.email),
                          onPressed: () {
                            // Adicione a ação para enviar um email
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
