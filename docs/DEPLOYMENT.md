# GUÍA DE DESPLIEGUE - ITP-IRPF CALCULATOR

## 📱 PUBLICACIÓN EN PLAY STORE (ANDROID)

### Paso 1: Crear Cuenta Google Play Developer

1. Ir a https://play.google.com/console
2. Click en "Crear cuenta"
3. Pagar $25 USD (una sola vez)
4. Completar información del desarrollador

### Paso 2: Generar Signing Key (Certificado)

**Primera vez solamente:**

```bash
# Crear directorio seguro
mkdir -p ~/keystores

# Generar keystore
keytool -genkey -v -keystore ~/keystores/itp-irpf-release.keystore \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -alias itp-irpf-key
```

**Ingresar datos solicitados:**
- Contraseña del keystore: (ingresar contraseña fuerte)
- Nombre y apellido: Tu Nombre
- Nombre de unidad organizativa: Tu Empresa
- Nombre de organización: Tu Empresa
- Ciudad/Localidad: Montevideo
- Provincia: Montevideo
- Código de país: UY

**⚠️ IMPORTANTE:** Guardar esta contraseña en lugar seguro. Se necesita para actualizaciones futuras.

### Paso 3: Configurar Android para Firma

Editar `android/app/build.gradle`:

```gradle
android {
    ...
    
    signingConfigs {
        release {
            keyAlias System.getenv("KEY_ALIAS") ?: "itp-irpf-key"
            keyPassword System.getenv("KEY_PASSWORD") ?: "tu_contraseña"
            storeFile file("../keystores/itp-irpf-release.keystore")
            storePassword System.getenv("STORE_PASSWORD") ?: "tu_contraseña"
        }
    }

    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            shrinkResources true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
}
```

### Paso 4: Compilar APK/AAB (App Bundle)

**Opción A: App Bundle (RECOMENDADO - más pequeño):**
```bash
flutter build appbundle --release
# Salida: build/app/outputs/bundle/release/app-release.aab (~15-20 MB)
```

**Opción B: APK (para testing):**
```bash
flutter build apk --release --split-per-abi
# Salida: build/app/outputs/apk/release/
```

### Paso 5: Preparar Store Listing

1. Ir a https://play.google.com/console
2. Crear nueva app
3. Completar:
   - **Nombre de la app:** ITP-IRPF Calculator
   - **Descripción corta:** Calcula impuestos inmobiliarios en Uruguay
   - **Descripción completa:** 
     ```
     ITP-IRPF Calculator es la aplicación de referencia para calcular 
     impuestos en operaciones inmobiliarias en Uruguay.
     
     ✅ Calcula:
     - ITP (Impuesto a las Transmisiones Patrimoniales)
     - IRPF (Incrementos Patrimoniales)
     
     ✅ Características:
     - Cálculos automáticos paso a paso
     - Datos oficiales actualizados (IPC, UI, UR)
     - Historial de operaciones
     - Exportación a PDF
     - Funciona sin internet
     
     Diseñada para escribanos, contadores y público general en Uruguay.
     ```
   - **Categoría:** Finance
   - **Clasificación por contenido:** 3+ años
   - **Privacidad:** Enlace a política
   - **Email de contacto:** soporte@itpirpf.com

### Paso 6: Cargar Screenshots y Arte

**Requisitos:**
- Mínimo 2, máximo 8 screenshots
- Resolución: 1080x1920 (móviles)
- Formato: PNG o JPG
- Tamaño máximo: 8 MB cada uno

**Crear screenshots en el simulador:**
```bash
# Ejecutar en emulador
flutter run -d emulator-5554

# Usar herramienta de screenshots
# O presionar Screenshot en Android Studio
```

### Paso 7: Subir APK/AAB

1. En Play Console: "Release" → "Production"
2. Click "Crear lanzamiento"
3. Subir archivo `app-release.aab`
4. Completar notas de lanzamiento:
   ```
   v1.0.0 - Lanzamiento inicial
   
   - Cálculo completo de ITP e IRPF
   - Integración con datos oficiales del INE y BCU
   - Historial y exportación de operaciones
   - Interfaz intuitiva y fácil de usar
   ```

### Paso 8: Revisar y Publicar

1. Revisar todo antes de enviar
2. Aceptar términos
3. Click "Enviar para revisión"
4. **Tiempo de revisión:** 24-72 horas

### Monitoreo Post-Publicación

```bash
# Ver analytics
# https://play.google.com/console → Estadísticas

# Monitorear errores
# https://play.google.com/console → Calidad → Crashes
```

---

## 🍎 PUBLICACIÓN EN APP STORE (iOS)

### Paso 1: Crear Apple Developer Account

1. Ir a https://developer.apple.com
2. Click "Account"
3. Pagar $99 USD/año
4. Registrar dispositivos y certificados

### Paso 2: Configurar Certificados

**Usar Xcode automático:**

```bash
open ios/Runner.xcworkspace
```

1. Seleccionar "Runner" en Project Navigator
2. Ir a "Signing & Capabilities"
3. Seleccionar Team
4. Cambiar Bundle ID a algo único: `com.tuempresa.itpirpf`

**Crear certificados manualmente (si es necesario):**

```bash
# Crear Certificate Signing Request (CSR)
# En Keychain Access → Certificate Assistant → Request a Certificate...

# Luego en Apple Developer:
# https://developer.apple.com/account/resources/certificates/
# → Create certificate (App Distribution)
```

### Paso 3: Crear App ID en App Store Connect

1. Ir a https://appstoreconnect.apple.com
2. Click "Apps" → "New App"
3. Completar:
   - **Platform:** iOS
   - **Name:** ITP-IRPF Calculator
   - **Primary Language:** Spanish
   - **Bundle ID:** com.tuempresa.itpirpf

### Paso 4: Configurar Build Settings

En Xcode:

```
Build Settings:
├── Display Name: ITP-IRPF
├── Bundle ID: com.tuempresa.itpirpf
├── Version: 1.0.0
├── Build: 1
├── Deployment Target: iOS 12.0 o superior
└── Signing Certificate: Distribution (App Store)
```

### Paso 5: Compilar para iOS

```bash
flutter build ios --release
# Output: build/ios/iphoneos/Runner.app
```

### Paso 6: Crear Archive

```bash
# En Xcode: Product → Archive
# O vía CLI:

xcodebuild -workspace ios/Runner.xcworkspace \
  -scheme Runner \
  -configuration Release \
  -derivedDataPath build \
  -archivePath "build/Runner.xcarchive" \
  archive
```

### Paso 7: Subir con Transporter

```bash
# Descargar Transporter desde App Store o:
# https://apps.apple.com/us/app/transporter/id1450874784

# Alternativa vía CLI:
xcrun altool --upload-app \
  -f "build/Runner.xcarchive" \
  -t ios \
  -u "tu_email@apple.com" \
  -p "tu_contraseña_app_specific"
```

### Paso 8: Completar App Store Listing

1. En App Store Connect
2. "App Information" → Completar todos los campos
3. Screenshots (6-5 para cada dispositivo):
   - iPhone 6.7"
   - iPhone 5.5"
   - iPad
4. Descripción, palabras clave, categoría, etc.

### Paso 9: Someter a Revisión

1. Ir a "App Review Information"
2. Completar datos de contacto
3. Click "Submit for Review"
4. **Tiempo de revisión:** 24-48 horas típicamente

---

## ☁️ DESPLIEGUE DE BACKEND (APIs)

### Opción 1: Heroku (Recomendado para inicio)

```bash
# Instalar Heroku CLI
brew tap heroku/brew && brew install heroku

# Login
heroku login

# Crear app
heroku create itp-irpf-api

# Crear base de datos
heroku addons:create heroku-postgresql:hobby-dev

# Deploy
git push heroku main

# Ver logs
heroku logs --tail
```

### Opción 2: AWS (Escalabilidad)

```bash
# Opción A: Elastic Beanstalk
eb init -p "Node.js 16 running on 64bit Amazon Linux 2" itp-irpf
eb create production
eb deploy

# Opción B: EC2 + Nginx
# 1. Lanzar instancia Ubuntu 22.04
# 2. SSH en la instancia
ssh -i key.pem ubuntu@ip-address

# 3. Instalar Node y dependencias
sudo apt update
sudo apt install nodejs npm git

# 4. Clonar y deployar
git clone https://github.com/tuusuario/itp-irpf-backend.git
cd itp-irpf-backend
npm install
npm start

# 5. Usar PM2 para mantener proceso vivo
sudo npm install -g pm2
pm2 start index.js
pm2 startup
pm2 save

# 6. Configurar Nginx como reverse proxy
sudo apt install nginx

# /etc/nginx/sites-available/default
server {
    listen 80;
    server_name api.itpirpf.com;
    
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

# Habilitar HTTPS con Let's Encrypt
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d api.itpirpf.com
```

### Opción 3: Google Cloud Platform (GCP)

```bash
# Instalar gcloud CLI
curl https://sdk.cloud.google.com | bash

# Login
gcloud auth login

# Deploy a Cloud Run
gcloud run deploy itp-irpf-api \
  --source . \
  --platform managed \
  --region us-central1

# Ver URL pública
gcloud run services describe itp-irpf-api --region us-central1
```

---

## 🔒 CONFIGURACIÓN DE SEGURIDAD

### HTTPS/SSL

```bash
# Certificado Let's Encrypt (Gratuito)
sudo certbot certonly --standalone -d api.itpirpf.com

# Renovación automática
sudo systemctl enable certbot.timer
```

### Variables de Entorno

```bash
# .env
DATABASE_URL=postgresql://user:pass@host:5432/dbname
JWT_SECRET=algo_muy_secreto_y_largo
API_KEY=otra_key_segura
NODE_ENV=production
LOG_LEVEL=error
```

### Rate Limiting

```javascript
const rateLimit = require("express-rate-limit");

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutos
  max: 100 // máximo 100 requests por IP
});

app.use(limiter);
```

---

## 📊 MONITOREO Y MANTENIMIENTO

### Logs Centralizados

```bash
# Instalar Stack ELK (Elasticsearch, Logstash, Kibana)
# O usar servicio: LogRocket, Datadog, New Relic

# Env variable para app:
LOG_LEVEL=info
SENTRY_DSN=https://...@sentry.io/...
```

### Base de Datos

```sql
-- Backup diario
pg_dump $DATABASE_URL > backup-$(date +%Y%m%d).sql

-- Monitorar performance
SELECT * FROM pg_stat_statements;

-- Índices
CREATE INDEX idx_operations_user_id ON operations(user_id);
CREATE INDEX idx_operations_created_at ON operations(created_at);
```

### Alertas

```javascript
// Usar servicio como UptimeRobot
// Monitorear: https://api.itpirpf.com/health

app.get('/health', (req, res) => {
  res.json({ 
    status: 'ok',
    timestamp: new Date(),
    version: '1.0.0'
  });
});
```

---

## ✅ CHECKLIST DE LANZAMIENTO

### Antes de Publicar:

- [ ] Todas las pruebas pasan (`flutter test`)
- [ ] No hay warnings ni errores (`flutter analyze`)
- [ ] Screenshots y descripciones completas
- [ ] Política de privacidad actualizada
- [ ] Términos de servicio definidos
- [ ] Backend testeado y funcionando
- [ ] Base de datos configurada
- [ ] HTTPS habilitado
- [ ] Logging y monitoring configurado
- [ ] Plan de soporte definido

### Después de Publicar:

- [ ] Monitorear crashes y errores
- [ ] Responder reviews de usuarios
- [ ] Monitorear analytics
- [ ] Preparar actualizaciones según feedback
- [ ] Mantener dependencias actualizadas
- [ ] Documentar cambios en changelog

---

## 🆘 SOLUCIÓN DE PROBLEMAS

### APK/AAB rechazado en Play Store

**Error:** "Invalid APK signature"
```bash
# Verificar firma
keytool -printcert -jarfile app-release.apk

# Reconstruir
flutter clean
flutter build appbundle --release
```

**Error:** "64-bit native libraries"
```bash
# Asegurar que build.gradle incluye:
android {
    defaultConfig {
        ndk {
            abiFilters 'arm64-v8a', 'x86_64'
        }
    }
}
```

### iOS app rejected

**Error:** "Guideline 5.1 - Legal"
- Asegurar política de privacidad clara
- Declarar permisos necesarios

**Error:** "Guideline 2.1 - Information Needed"
- Proporcionar instrucciones de prueba
- Demo account si es necesario

---

## 📞 REFERENCIAS

- Play Store: https://play.google.com/console
- App Store: https://appstoreconnect.apple.com
- Flutter Build: https://flutter.dev/docs/deployment
- Heroku: https://devcenter.heroku.com/

