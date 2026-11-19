import 'package:flutter/material.dart';
import 'accueil.dart';
import 'cv.dart';
import 'famille.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});
  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final _identifiantController = TextEditingController();
  final _mdpController = TextEditingController();
  bool _voirMdp = false;

  void _seConnecter() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const AccueilPage()),
    );
  }

  void _allerVers(int index) {
    Widget page;
    if (index == 0) {
      page = const ConnexionPage();
    } else if (index == 1) {
      page = const AccueilPage();
    } else if (index == 2) {
      page = const CvPage();
    } else {
      page = const FamillePage();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D2B4E),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // IMAGE CORRIGÉE
              const CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage('assets/images/thierry.jpg'),
              ),
              const SizedBox(height: 20),
              const Text(
                'M\'LISHO M\'SAMBYA\nTHIERRY',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'ISIG - GOMA | Réseaux & Télécommunications',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const SizedBox(height: 36),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Connexion',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _identifiantController,
                      decoration: const InputDecoration(
                        labelText: 'Identifiant',
                        hintText: 'Ex: thierry',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _mdpController,
                      obscureText: !_voirMdp,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        prefixIcon: const Icon(Icons.lock),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(_voirMdp ? Icons.visibility_off : Icons.visibility),
                          onPressed: () => setState(() => _voirMdp = !_voirMdp),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _seConnecter,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0D2B4E),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Se connecter',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF0D2B4E),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _allerVers,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Connexion'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Mon CV'),
          BottomNavigationBarItem(icon: Icon(Icons.family_restroom), label: 'Famille'),
        ],
      ),
    );
  }
}