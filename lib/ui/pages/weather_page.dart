import 'package:flutter/material.dart';
import '../../models/weather_model.dart';
import '../organisms/weather_card.dart';
import '../organisms/weather_actions.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>
    with TickerProviderStateMixin {
  late WeatherModel _weatherModel;
  bool _isLoading = false;
  
  late AnimationController _loadingAnimationController;
  late Animation<double> _loadingAnimation;
  
  late AnimationController _contentAnimationController;
  late Animation<double> _contentOpacityAnimation;

  @override
  void initState() {
    super.initState();
    
    // Dados iniciais
    _weatherModel = WeatherModel(
      cityName: 'São Paulo',
      temperature: 25.0,
      weatherDescription: 'Ensolarado',
      weatherIcon: '☀️',
    );

    // Configuração das animações de loading
    _loadingAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _loadingAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _loadingAnimationController,
      curve: Curves.easeInOut,
    ));

    // Configuração das animações de conteúdo
    _contentAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _contentOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _contentAnimationController,
      curve: Curves.easeInOut,
    ));

    // Iniciar com o conteúdo visível
    _contentAnimationController.forward();
  }

  @override
  void dispose() {
    _loadingAnimationController.dispose();
    _contentAnimationController.dispose();
    super.dispose();
  }

  void _fetchWeather() {
    setState(() {
      _isLoading = true;
    });

    // Iniciar animação de loading
    _loadingAnimationController.repeat();
    _contentAnimationController.reverse();

    // Simulação de uma requisição de API
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _weatherModel = _weatherModel.copyWith(
            cityName: 'Rio de Janeiro',
            temperature: 28.5,
            weatherDescription: 'Chuva leve',
            weatherIcon: '🌧️',
          );
          _isLoading = false;
        });

        // Parar animação de loading e mostrar conteúdo
        _loadingAnimationController.stop();
        _loadingAnimationController.reset();
        _contentAnimationController.forward();
      }
    });
  }

  void _searchNewCity() {
    // Implementação futura para buscar nova cidade
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Funcionalidade em desenvolvimento!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App do Clima'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _isLoading
                ? [Colors.grey.shade300, Colors.grey.shade100]
                : [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: Center(
          child: _isLoading
              ? _buildLoadingWidget()
              : _buildContentWidget(),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotationTransition(
          turns: _loadingAnimation,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.lightBlue],
              ),
            ),
            child: const Icon(
              Icons.refresh,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        const SizedBox(height: 20),
        FadeTransition(
          opacity: _loadingAnimation,
          child: const Text(
            'Atualizando dados do clima...',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContentWidget() {
    return FadeTransition(
      opacity: _contentOpacityAnimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          WeatherCard(
            cityName: _weatherModel.cityName,
            temperature: _weatherModel.temperature,
            weatherDescription: _weatherModel.weatherDescription,
            weatherIcon: _weatherModel.weatherIcon,
          ),
          const SizedBox(height: 40),
          WeatherActions(
            onUpdateWeather: _fetchWeather,
            onSearchCity: _searchNewCity,
          ),
        ],
      ),
    );
  }
}