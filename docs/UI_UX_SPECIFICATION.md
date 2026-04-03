# ESPECIFICACIÓN UI/UX Y FLUJO DE USUARIO

## PALETA DE COLORES

- **Primary:** #5B3BA0 (Púrpura oscuro)
- **Secondary:** #3B5BA0 (Azul oscuro)
- **Accent:** #00A8CC (Azul cielo)
- **Success:** #2ECC71 (Verde)
- **Warning:** #F39C12 (Naranja)
- **Danger:** #E74C3C (Rojo)
- **Background:** #F8F9FA (Gris claro)
- **Surface:** #FFFFFF (Blanco)
- **Text Primary:** #2C3E50 (Gris oscuro)
- **Text Secondary:** #7F8C8D (Gris medio)
- **Border:** #BDC3C7 (Gris claro)

## TIPOGRAFÍA

- **Familia:** Inter / Roboto
- **Encabezados (H1):** 28px, Bold, Primary Color
- **Encabezados (H2):** 24px, SemiBold, Primary Color
- **Encabezados (H3):** 20px, SemiBold, Primary Color
- **Body:** 16px, Regular, Text Primary
- **Body Small:** 14px, Regular, Text Secondary
- **Label:** 12px, Medium, Text Secondary

---

## ESTRUCTURA DE PANTALLAS

### PANTALLA 1: SPLASH SCREEN
**Propósito:** Presentar la app al iniciar

**Elementos:**
- Logo de la app (icono púrpura con símbolo de dinero/casa)
- Nombre: "ITP-IRPF Calculator"
- Subtitle: "Cálculo de Impuestos Inmobiliarios en Uruguay"
- Loading spinner animado
- Duración: 2-3 segundos

**Acciones:**
- Carga automática de índices del servidor
- Navega a Home si hay conexión
- Navega a Home en modo offline si no hay conexión

---

### PANTALLA 2: HOME / MENÚ PRINCIPAL
**Propósito:** Punto de entrada principal, permite seleccionar qué hacer

**Layout:**
```
┌─────────────────────────────────────┐
│   ITP-IRPF Calculator      [≡]      │
├─────────────────────────────────────┤
│                                     │
│   Bienvenido a la app de cálculo   │
│   de impuestos inmobiliarios       │
│                                     │
│   ┌─────────────────────────────┐  │
│   │  ¿QUÉ QUERÉS CALCULAR?      │  │
│   └─────────────────────────────┘  │
│                                     │
│   ┌─────────────────────────────┐  │
│   │ [🏠] IMPUESTOS SOBRE VENTA  │  │
│   │      ITP + IRPF             │  │
│   └─────────────────────────────┘  │
│                                     │
│   ┌─────────────────────────────┐  │
│   │ [📋] OTRAS OPERACIONES      │  │
│   │      Sucesiones, Herencias  │  │
│   │      Donaciones, Permutas   │  │
│   └─────────────────────────────┘  │
│                                     │
│   ┌─────────────────────────────┐  │
│   │ [📊] HISTORIAL             │  │
│   │      Ver cálculos anteriores │  │
│   └─────────────────────────────┘  │
│                                     │
│   ┌─────────────────────────────┐  │
│   │ [⚙️] CONFIGURACIÓN          │  │
│   │      Índices, preferencias   │  │
│   └─────────────────────────────┘  │
│                                     │
└─────────────────────────────────────┘
```

**Elementos:**
- Header con branding
- Botón menú (≡) en esquina superior derecha
- Tarjetas (Cards) grandes y clickeables
- Iconos claros para cada opción
- Footer con versión y fecha de última actualización

**Acciones:**
- Tap en "Impuestos sobre venta" → Va a pantalla 3
- Tap en "Otras operaciones" → Va a pantalla tipo operación
- Tap en "Historial" → Va a pantalla de historial
- Tap en "Configuración" → Va a pantalla de configuración
- Tap en menú (≡) → Abre drawer con opciones

---

### PANTALLA 3: SELECTOR DE TIPO DE BIEN
**Propósito:** Elegir si el inmueble es urbano o rural

**Layout:**
```
┌─────────────────────────────────────┐
│   < ITP + IRPF         [?]          │
├─────────────────────────────────────┤
│                                     │
│   ¿Qué tipo de inmueble es?        │
│                                     │
│   ℹ️  Esto determina las alícuotas   │
│   y cálculos que se aplicarán       │
│                                     │
│   ┌─────────────────────────────┐  │
│   │ [🏘️] INMUEBLE URBANO        │  │
│   │                              │  │
│   │ Casa, apartamento,           │  │
│   │ local comercial, oficina     │  │
│   └─────────────────────────────┘  │
│                                     │
│   ┌─────────────────────────────┐  │
│   │ [🌾] INMUEBLE RURAL         │  │
│   │                              │  │
│   │ Tierra, chacra, estancia,    │  │
│   │ campo, quinta                │  │
│   └─────────────────────────────┘  │
│                                     │
│        [← Cancelar]                 │
│                                     │
└─────────────────────────────────────┘
```

**Elementos:**
- Botón atrás (<) en header
- Pregunta clara y tooltip explicativo
- Dos opciones principales con iconos
- Botón cancelar abajo

**Acciones:**
- Urbano → Pantalla 4A (Formulario urbano)
- Rural → Pantalla 4B (Formulario rural)

---

### PANTALLA 4A: FORMULARIO ITP + IRPF (URBANO)
**Propósito:** Ingresar datos de la operación

**Layout (scrollable):**
```
┌─────────────────────────────────────┐
│   < ITP + IRPF - Urbano   [?]       │
├─────────────────────────────────────┤
│                                     │
│   DATOS DEL INMUEBLE               │
│   ─────────────────────────────────│
│   Valuación Fiscal (VF) *           │
│   ┌─────────────────────────────┐  │
│   │ $  |________________|        │  │
│   └─────────────────────────────┘  │
│   💡 Valor catastral del inmueble  │
│                                     │
│   Precio Pactado *                  │
│   ┌─────────────────────────────┐  │
│   │ $  |________________|        │  │
│   └─────────────────────────────┘  │
│   💡 Precio de la operación         │
│                                     │
│   ─────────────────────────────────│
│   DATOS DEL CÁLCULO                │
│   ─────────────────────────────────│
│                                     │
│   Precio Original (compra) *        │
│   ┌─────────────────────────────┐  │
│   │ $  |________________|        │  │
│   └─────────────────────────────┘  │
│   💡 A cuánto lo compró             │
│                                     │
│   Fecha de Compra *                 │
│   ┌─────────────────────────────┐  │
│   │ [Seleccionar fecha]    [📅] │  │
│   └─────────────────────────────┘  │
│                                     │
│   Fecha de Venta *                  │
│   ┌─────────────────────────────┐  │
│   │ [Seleccionar fecha]    [📅] │  │
│   └─────────────────────────────┘  │
│                                     │
│   ┌─────────────────────────────┐  │
│   │ [🔄] CALCULAR               │  │
│   └─────────────────────────────┘  │
│                                     │
│        [← Atrás]     [Guardar]      │
│                                     │
└─────────────────────────────────────┘
```

**Elementos:**
- Campos de entrada con validación
- Placeholders descriptivos
- Tooltips en iconos (💡)
- Picker de fechas con calendario
- Botón calcular (primario)
- Botones atrás/guardar (secundarios)

**Validaciones:**
- Campos requeridos (*)
- Números positivos
- Fechas válidas (compra < venta)
- Mensajes de error claros

---

### PANTALLA 5: RESULTADOS DEL CÁLCULO
**Propósito:** Mostrar desglose completo del cálculo

**Layout (scrollable):**
```
┌─────────────────────────────────────┐
│   < Resultados          [↓] [📤]    │
├─────────────────────────────────────┤
│                                     │
│   RESUMEN OPERACIÓN                │
│   ═════════════════════════════════ │
│                                     │
│   Base Imponible                    │
│   $550.000,00                       │
│   (Mayor entre VF y precio)         │
│                                     │
│   ═════════════════════════════════ │
│                                     │
│   ITP (Transmisiones Patrimoniales)│
│   ─────────────────────────────────│
│   Alícuota: 2%                      │
│   ITP Total: $11.000,00  [✓]       │
│                                     │
│   ═════════════════════════════════ │
│                                     │
│   IRPF (Incrementos Patrimoniales) │
│   ─────────────────────────────────│
│                                     │
│   RÉGIMEN REAL (Ganancia)           │
│   Costo Original (7/2015):$200.000 │
│   IPC Compra (7/2015): 230.67      │
│   IPC Venta (3/2026): 320.45       │
│                                     │
│   Costo Actualizado:                │
│   $200.000 × (320.45/230.67)=       │
│   $277.760,00                       │
│                                     │
│   Ganancia Real:                    │
│   $550.000 - $277.760 = $272.240   │
│                                     │
│   Alícuota (12%): $272.240 × 0.12  │
│   IRPF Real: $32.668,80  [✓]       │
│                                     │
│   ═════════════════════════════════ │
│                                     │
│   RÉGIMEN FICTO (Alternativo)       │
│   Alícuota: 2% sobre venta          │
│   IRPF Ficto: $11.000,00            │
│                                     │
│   ⚠️  Se aplica el RÉGIMEN REAL      │
│   (es más favorable)                │
│                                     │
│   ═════════════════════════════════ │
│   TOTAL IMPUESTOS:                  │
│   ITP + IRPF = $43.668,80           │
│   ═════════════════════════════════ │
│                                     │
│   ┌─────────────────────────────┐  │
│   │ [📥] GUARDAR OPERACIÓN      │  │
│   └─────────────────────────────┘  │
│                                     │
│   ┌─────────────────────────────┐  │
│   │ [📤] EXPORTAR (PDF/Imagen)  │  │
│   └─────────────────────────────┘  │
│                                     │
│   ┌─────────────────────────────┐  │
│   │ [🔄] NUEVA OPERACIÓN        │  │
│   └─────────────────────────────┘  │
│                                     │
└─────────────────────────────────────┘
```

**Elementos:**
- Encabezados con separadores visuales
- Desglose paso a paso del cálculo
- Valores destacados en color
- Indicadores de éxito (✓)
- Advertencias cuando sea necesario (⚠️)
- Botones de acción (guardar, exportar, nueva operación)

**Acciones:**
- Botón guardar → Almacena en historial
- Botón exportar → Genera PDF/imagen
- Botón nueva operación → Regresa a selección
- Swipe left/right → Navega entre operaciones

---

### PANTALLA 6: HISTORIAL DE CÁLCULOS
**Propósito:** Ver y gestionar operaciones guardadas

**Layout:**
```
┌─────────────────────────────────────┐
│   < Historial             [🗑️]     │
├─────────────────────────────────────┤
│                                     │
│   Total guardadas: 5 operaciones   │
│   Última: Hace 2 días              │
│                                     │
│   ┌─────────────────────────────┐  │
│   │ Operación: Compraventa      │  │
│   │ Tipo: Urbano                │  │
│   │ Base: $550.000              │  │
│   │ Impuestos: $43.668,80       │  │
│   │ Fecha: 15/03/2026           │  │
│   │                      [▶]    │  │
│   └─────────────────────────────┘  │
│                                     │
│   ┌─────────────────────────────┐  │
│   │ Operación: Permuta          │  │
│   │ Tipo: Rural                 │  │
│   │ Base: $200.000              │  │
│   │ Impuestos: $4.000           │  │
│   │ Fecha: 10/03/2026           │  │
│   │                      [▶]    │  │
│   └─────────────────────────────┘  │
│                                     │
│   [Cargar más...]                   │
│                                     │
└─────────────────────────────────────┘
```

**Elementos:**
- Lista de operaciones en cards
- Información resumida (tipo, monto, fecha)
- Botón para expandir/ver detalles
- Contador de operaciones
- Opción para eliminar

**Acciones:**
- Tap en tarjeta → Muestra detalles completos
- Deslizar → Opciones de eliminar/editar
- Buscar/filtrar por fecha o tipo

---

### PANTALLA 7: CONFIGURACIÓN
**Propósito:** Ajustes y opciones de la app

**Layout:**
```
┌─────────────────────────────────────┐
│   < Configuración                   │
├─────────────────────────────────────┤
│                                     │
│   ÍNDICES MACROECONÓMICOS          │
│   ─────────────────────────────────│
│   IPC - Último: 320.45              │
│   Actualizado: 01/03/2026           │
│   [Actualizar ahora]     [⟳]       │
│                                     │
│   UI - Último: 1254.89              │
│   Actualizado: 01/03/2026           │
│   [Actualizar ahora]     [⟳]       │
│                                     │
│   UR - Último: 1845.22              │
│   Actualizado: 01/03/2026           │
│   [Actualizar ahora]     [⟳]       │
│                                     │
│   Cotización USD (BCU):             │
│   Comprador: $36,50                 │
│   Actualizado: 02/04/2026           │
│   [Actualizar ahora]     [⟳]       │
│                                     │
│   ─────────────────────────────────│
│   PREFERENCIAS                      │
│   ─────────────────────────────────│
│                                     │
│   Moneda por defecto                │
│   [UYU]  [USD]  [EUR]              │
│                                     │
│   Formato de fecha                  │
│   [DD/MM/YYYY]  [MM/DD/YYYY]       │
│                                     │
│   Notificaciones                    │
│   [Activadas ✓]  [Desactivadas]    │
│                                     │
│   Modo oscuro                       │
│   [Activado]  [Desactivado ✓]      │
│                                     │
│   ─────────────────────────────────│
│   INFORMACIÓN                       │
│   ─────────────────────────────────│
│   Versión: 1.0.0                    │
│   [Acerca de] [Ayuda] [Privacidad] │
│   [Contactar Desarrolladores]       │
│                                     │
└─────────────────────────────────────┘
```

**Elementos:**
- Secciones claras
- Indicadores de estado (fechas de actualización)
- Botones de actualización manual
- Toggles para preferencias
- Links a información adicional

---

## FLUJO DE USUARIO COMPLETO

```
START
  ↓
[Splash Screen] (2-3 seg)
  ↓
[Home/Menú Principal]
  ├─→ [Impuestos sobre venta]
  │    ├─→ [Selector Urbano/Rural]
  │    │    ├─→ [Formulario Urbano] → [Resultados] → [Guardar/Exportar]
  │    │    └─→ [Formulario Rural] → [Resultados] → [Guardar/Exportar]
  │    └─→ [Nueva operación] ⟲ (regresa a Selector)
  │
  ├─→ [Otras Operaciones]
  │    ├─→ [Selector tipo: Herencia/Donación/Permuta/etc]
  │    │    └─→ [Formulario específico] → [Resultados]
  │    └─→ [Nueva operación] ⟲
  │
  ├─→ [Historial]
  │    ├─→ [Ver operaciones guardadas]
  │    ├─→ [Expandir operación] → [Detalles completos]
  │    ├─→ [Editar/Recalcular]
  │    └─→ [Eliminar]
  │
  └─→ [Configuración]
       ├─→ [Actualizar índices]
       ├─→ [Cambiar preferencias]
       └─→ [Acerca de/Ayuda]

END
```

---

## COMPONENTES REUTILIZABLES

### 1. **Card Component**
- Container redondeado
- Sombra suave
- Padding consistente
- Icono + texto

### 2. **Input Field Component**
- Label obligatorio
- Placeholder descriptivo
- Icono de moneda para dinero
- Validación en tiempo real
- Mensaje de error

### 3. **Date Picker Component**
- Calendario emergente
- Selector de mes/año
- Rango de fechas permitidas
- Confirmación clara

### 4. **Result Card Component**
- Título y subtítulo
- Valor destacado
- Descripción explicativa
- Icono de estado

### 5. **Button Component**
- Estados: Normal, Hover, Pressed, Disabled
- Variantes: Primary, Secondary, Outline
- Iconos opcionales
- Loading state

### 6. **Tooltip/Info Component**
- Icono (💡) clickeable
- Pop-up con explicación
- Cierre automático

---

## ANIMACIONES Y TRANSICIONES

- **Transición entre pantallas:** Slide (izquierda/derecha) 300ms
- **Carga de índices:** Spinner animado 2-3 segundos
- **Botón presionado:** Scale 0.95 50ms
- **Expansión de cards:** Expand 250ms con fade
- **Número contador:** Fade in 500ms

---

## RESPONSIVE DESIGN

- **Móviles pequeños (320px):** Layout vertical, fuentes ajustadas
- **Móviles normales (375-428px):** Layout óptimo
- **Tablets (600px+):** Dos columnas, cards más grandes
- **Aplicar max-width de 500px en tablets para mantener proporción**

