# ITP-IRPF Calculator - Aplicación Móvil

Una aplicación profesional para calcular impuestos inmobiliarios en Uruguay (ITP e IRPF) con datos oficiales actualizados.

## 📱 Características

✅ **Cálculo Completo de Impuestos:**
- ITP (Impuesto a las Transmisiones Patrimoniales)
- IRPF (Incrementos Patrimoniales) - Régimen Real y Ficto
- Soporte para inmuebles urbanos y rurales

✅ **Datos Automáticos:**
- IPC del INE
- UI del BCU
- UR del MVOTMA
- Cotización USD en tiempo real

✅ **Funcionalidades:**
- Formularios dinámicos según tipo de operación
- Cálculos paso a paso detallados
- Historial de operaciones guardadas
- Exportación a PDF
- Modo offline con datos en caché

✅ **Experiencia de Usuario:**
- Diseño moderno y minimalista
- Flujo guiado paso a paso
- Explicaciones simples en cada campo
- Tooltips informativos

## 🛠 Requisitos Previos

### Desarrollo
- Flutter 3.0+ ([Instalar](https://flutter.dev/docs/get-started/install))
- Dart 3.0+
- Android Studio o Xcode
- Git

### Producción
- Node.js 16+ (para backend opcional)
- PostgreSQL o Firebase (base de datos)
- Servidor HTTP (AWS, GCP, Heroku, etc.)

## 📦 Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/tuusuario/itp-irpf-calculator.git
cd itp-irpf-calculator
```

### 2. Obtener dependencias

```bash
flutter pub get
```

### 3. Configurar variables de entorno

```bash
cp .env.example .env
# Editar .env con tus valores
```

**Contenido de `.env`:**
```
BACKEND_URL=http://localhost:3000
API_KEY=tu_api_key_aqui
ENV=development
```

### 4. Ejecutar en desarrollo

```bash
# Ejecutar en emulador
flutter run

# Ejecutar en dispositivo físico
flutter run --release

# Ejecutar en navegador (web)
flutter run -d chrome
```

## 🏗 Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada
├── config/                   # Configuración
│   ├── app_config.dart
│   ├── routes.dart
│   └── theme.dart
├── models/                   # Modelos de datos
│   ├── immobile_model.dart
│   ├── operation_model.dart
│   ├── calculation_breakdown_model.dart
│   └── index_model.dart
├── services/                 # Servicios
│   ├── calculation_service.dart
│   ├── index_service.dart
│   ├── api_service.dart
│   └── storage_service.dart
├── screens/                  # Pantallas
│   ├── splash_screen.dart
│   ├── home_screen.dart
│   ├── calculation_screen.dart
│   ├── results_screen.dart
│   └── history_screen.dart
├── widgets/                  # Componentes reutilizables
│   └── common_widgets.dart
├── utils/                    # Utilidades
│   ├── constants.dart
│   ├── validators.dart
│   └── formatters.dart
└── error_handling/           # Manejo de errores
    └── custom_exceptions.dart
```

## 📚 Documentación

La documentación completa se encuentra en la carpeta `docs/`:

- **[NORMATIVA_ITP.md](docs/NORMATIVA_ITP.md)** - Normativa y cálculo de ITP
- **[NORMATIVA_IRPF.md](docs/NORMATIVA_IRPF.md)** - Normativa y cálculo de IRPF
- **[UI_UX_SPECIFICATION.md](docs/UI_UX_SPECIFICATION.md)** - Especificación de interfaz
- **[ARCHITECTURE.md](docs/ARCHITECTURE.md)** - Arquitectura técnica
- **[API_INTEGRATION.md](docs/API_INTEGRATION.md)** - Integración de APIs

## 🔧 Configuración de Desarrollo

### IDE Recomendado: VS Code

```bash
# Instalar extensión Dart
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter
```

### Análisis estático

```bash
# Ejecutar análisis
flutter analyze

# Formatear código
dart format lib/
```

### Testing

```bash
# Ejecutar tests unitarios
flutter test

# Ejecutar tests con cobertura
flutter test --coverage
```

## 🚀 Despliegue

### Android (Play Store)

#### Requisitos:
- Google Play Developer Account ($25 USD - una sola vez)
- Certificado de firma (keystore)

#### Pasos:

1. **Generar APK/AAB:**
```bash
flutter build apk --release
# o para App Bundle (recomendado):
flutter build appbundle --release
```

2. **Crear keystore (primera vez):**
```bash
keytool -genkey -v -keystore ~/my-release-key.keystore \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias my-key-alias
```

3. **Configurar firma en `android/app/build.gradle`:**
```gradle
signingConfigs {
    release {
        keyAlias "my-key-alias"
        keyPassword "tu_contraseña"
        storeFile file("../my-release-key.keystore")
        storePassword "tu_contraseña"
    }
}

buildTypes {
    release {
        signingConfig signingConfigs.release
    }
}
```

4. **Publicar en Play Store:**
   - Ir a https://play.google.com/console
   - Crear nueva app
   - Subir AAB
   - Rellenar información y metadatos
   - Enviar para revisión (24-72 horas)

### iOS (App Store)

#### Requisitos:
- Apple Developer Account ($99 USD/año)
- Mac con Xcode
- Certificados y perfiles de distribución

#### Pasos:

1. **Configurar en Xcode:**
```bash
open ios/Runner.xcworkspace
```

2. **Configurar identidad:**
   - Abrir "Runner" en Project Navigator
   - Ir a "Signing & Capabilities"
   - Seleccionar Team
   - Cambiar Bundle ID

3. **Compilar release:**
```bash
flutter build ios --release
```

4. **Enviar a App Store:**
```bash
cd ios
xcodebuild -workspace Runner.xcworkspace \
  -scheme Runner \
  -configuration Release \
  -derivedDataPath build \
  -destination "generic/platform=iOS" \
  -archivePath "build/Runner.xcarchive" \
  archive
```

5. **Usar Transporter (App):
   - Descargar desde Mac App Store
   - Seleccionar archivo .xcarchive
   - Enviar para revisión

### Web

```bash
flutter build web --release
# Archivos en: build/web/

# Servir localmente
python3 -m http.server 8000
```

### Backend (Node.js)

1. **Preparar servidor:**
```bash
cd backend
npm install
npm run build
```

2. **Desplegar en Heroku:**
```bash
heroku login
heroku create itp-irpf-api
git push heroku main
```

3. **Desplegar en AWS:**
```bash
# Usar Elastic Beanstalk o EC2
eb init
eb create
eb deploy
```

## 🔐 Seguridad

### Checklist de Producción:

- [ ] Usar HTTPS en todas las comunicaciones
- [ ] Validar todos los inputs del usuario
- [ ] Encriptar datos sensibles en local
- [ ] Usar variables de entorno para API keys
- [ ] Implementar autenticación (OAuth 2.0)
- [ ] Ejecutar penetration testing
- [ ] Cumplir LGPD (Ley General de Protección de Datos)
- [ ] Implementar rate limiting en backend
- [ ] Usar certificado SSL válido
- [ ] Mantener dependencias actualizadas

## 📊 Métricas de Calidad

```bash
# Coverage de tests
flutter test --coverage

# Análisis estático avanzado
flutter analyze --fatal-infos --fatal-warnings

# Tamaño de la app
flutter build apk --analyze-size --release
```

## 🐛 Debugging

### Logs en desarrollo:
```dart
import 'package:logger/logger.dart';

final logger = Logger();
logger.d('Debug message');
logger.i('Info message');
logger.w('Warning message');
logger.e('Error message');
```

### Modo debug:
```bash
flutter run
# Presionar 'd' para modo debug
# Presionar 'q' para salir
```

## 🤝 Contribución

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📝 Licencia

Este proyecto está bajo la licencia MIT. Ver [LICENSE](LICENSE) para más detalles.

## 👨‍💼 Soporte

Para preguntas o problemas:
- Email: soporte@itpirpf.com
- Issues: https://github.com/tuusuario/itp-irpf-calculator/issues
- Documentación: https://itpirpf.com/docs

## 🙏 Créditos

- Diseño UI/UX inspirado en apps financieras de clase mundial
- Normativa según DGI Uruguay 2026
- Íconos: Material Design Icons
- Fuentes: Google Fonts

## 📅 Roadmap

### v1.0 (Actual)
- [x] Cálculo ITP completo
- [x] Cálculo IRPF (real y ficto)
- [x] Historial de operaciones
- [x] Exportación a PDF

### v1.1
- [ ] Soporte para múltiples usuarios
- [ ] Autenticación con redes sociales
- [ ] Sincronización en cloud
- [ ] Modo offline mejorado

### v1.2
- [ ] Cálculo de otros impuestos
- [ ] Simulador de escenarios
- [ ] Integración con escribanías
- [ ] API para profesionales

### v2.0
- [ ] Soporte para otros países
- [ ] Análisis predictivo
- [ ] Dashboard profesional
- [ ] Integración bancaria

---

**Última actualización:** Abril 2026  
**Versión:** 1.0.0  
**Mantenedor:** Equipo de Desarrollo
