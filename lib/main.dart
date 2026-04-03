import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// ==================== COLORES DE LA APP ====================

const Color PRIMARY_COLOR = Color(0xFF5B3BA0); // Púrpura oscuro
const Color SECONDARY_COLOR = Color(0xFF3B5BA0); // Azul oscuro
const Color ACCENT_COLOR = Color(0xFF00A8CC); // Azul cielo
const Color SUCCESS_COLOR = Color(0xFF2ECC71); // Verde
const Color WARNING_COLOR = Color(0xFFF39C12); // Naranja
const Color DANGER_COLOR = Color(0xFFE74C3C); // Rojo
const Color BACKGROUND_COLOR = Color(0xFFF8F9FA); // Gris claro
const Color SURFACE_COLOR = Color(0xFFFFFFFF); // Blanco
const Color TEXT_PRIMARY_COLOR = Color(0xFF2C3E50); // Gris oscuro
const Color TEXT_SECONDARY_COLOR = Color(0xFF7F8C8D); // Gris medio
const Color BORDER_COLOR = Color(0xFFBDC3C7); // Gris claro

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // TODO: Inicializar Hive para almacenamiento local
  // await Hive.initFlutter();
  // await Hive.openBox('operations');
  // await Hive.openBox('indexes');
  // await Hive.openBox('preferences');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'ITP-IRPF Calculator',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: const SplashScreen(),
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: PRIMARY_COLOR,
        primary: PRIMARY_COLOR,
        secondary: SECONDARY_COLOR,
      ),
      scaffoldBackgroundColor: BACKGROUND_COLOR,
      appBarTheme: AppBarTheme(
        backgroundColor: PRIMARY_COLOR,
        foregroundColor: SURFACE_COLOR,
        elevation: 2,
        centerTitle: false,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: SURFACE_COLOR,
        ),
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: TEXT_PRIMARY_COLOR,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: TEXT_PRIMARY_COLOR,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: TEXT_PRIMARY_COLOR,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: TEXT_PRIMARY_COLOR,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: TEXT_PRIMARY_COLOR,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: TEXT_SECONDARY_COLOR,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: SURFACE_COLOR,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: BORDER_COLOR),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: BORDER_COLOR),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: PRIMARY_COLOR, width: 2),
        ),
        labelStyle: GoogleFonts.inter(
          fontSize: 14,
          color: TEXT_SECONDARY_COLOR,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: PRIMARY_COLOR,
          foregroundColor: SURFACE_COLOR,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: PRIMARY_COLOR,
          side: const BorderSide(color: PRIMARY_COLOR, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: SURFACE_COLOR,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.zero,
      ),
    );
  }
}

/// ==================== SPLASH SCREEN ====================

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Simular carga de índices
    await Future.delayed(const Duration(seconds: 2));
    
    if (mounted) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [PRIMARY_COLOR, SECONDARY_COLOR],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: SURFACE_COLOR.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.home_outlined,
                  size: 60,
                  color: SURFACE_COLOR,
                ),
              ),
              const SizedBox(height: 30),

              // Título
              Text(
                'ITP-IRPF',
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: SURFACE_COLOR,
                ),
              ),
              const SizedBox(height: 10),

              // Subtítulo
              Text(
                'Cálculo de Impuestos Inmobiliarios',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: SURFACE_COLOR.withOpacity(0.9),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),

              // Loading spinner
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(SURFACE_COLOR),
              ),
              const SizedBox(height: 20),

              // Texto de carga
              Text(
                'Cargando datos...',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: SURFACE_COLOR.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ==================== HOME SCREEN (PLACEHOLDER) ====================

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ITP-IRPF Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 64, color: PRIMARY_COLOR),
            const SizedBox(height: 16),
            Text(
              'Bienvenido a ITP-IRPF Calculator',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Navegar a cálculo
              },
              child: const Text('Comenzar Cálculo'),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== CONFIGURACIÓN DE RUTAS ====================
// En producción, usar GoRouter o similar para mejor navegación

extension RoutingExtension on NavigatorState {
  // Aquí se definirían las rutas de la aplicación
}
