# GUÍA DE USO - ITP-IRPF CALCULATOR

## 🎯 BIENVENIDA

Esta guía te ayudará a usar la aplicación ITP-IRPF Calculator para calcular impuestos en operaciones inmobiliarias en Uruguay.

### ¿Para quién es?

✅ **Escribanos** - Agentes de retención
✅ **Contadores** - Asesoría fiscal
✅ **Inmobiliarios** - Apoyo al cliente
✅ **Público general** - Consultas personales

---

## 📥 INSTALACIÓN

### Android (Play Store)

1. Abrir Play Store en tu teléfono
2. Buscar "ITP-IRPF Calculator"
3. Presionar "Instalar"
4. Esperar a que termine la descarga (5-10 MB)
5. Presionar "Abrir"

### iOS (App Store)

1. Abrir App Store en tu iPhone/iPad
2. Buscar "ITP-IRPF Calculator"
3. Presionar nube (descargar)
4. Autorizar con Face ID / Touch ID
5. Esperar instalación
6. Presionar "Abrir"

### Requisitos Mínimos

- **Android:** 6.0 o superior
- **iOS:** 12.0 o superior
- **Espacio:** 30 MB libre
- **Conexión:** Internet (primera vez para obtener índices)

---

## 🚀 PRIMEROS PASOS

### 1. Iniciar la App

Al abrir por primera vez:
1. Pantalla de inicio (2-3 segundos)
2. Se cargan automáticamente los índices:
   - IPC (Índice de Precios al Consumidor)
   - UI (Índice de Unidad Reajustable)
   - UR (Unidad Reajustable)
   - Cotización USD

**Nota:** Se necesita conexión a internet para la primera carga.

### 2. Pantalla Principal

Verás 4 opciones principales:

```
┌─────────────────────────────────────┐
│  ITP-IRPF Calculator                │
├─────────────────────────────────────┤
│                                     │
│ 1. IMPUESTOS SOBRE VENTA            │
│    Calcula ITP + IRPF               │
│                                     │
│ 2. OTRAS OPERACIONES                │
│    Herencias, donaciones, permutas  │
│                                     │
│ 3. HISTORIAL                        │
│    Ver cálculos anteriores          │
│                                     │
│ 4. CONFIGURACIÓN                    │
│    Índices, preferencias            │
│                                     │
└─────────────────────────────────────┘
```

---

## 💰 CÁLCULO DE ITP + IRPF

Este es el cálculo más común. Úsalo cuando:
- Alguien vende un inmueble (casa, apartamento, terreno, etc.)
- Es una compraventa
- Necesitas calcular tanto ITP como IRPF

### Paso 1: Seleccionar Tipo de Inmueble

Presiona "IMPUESTOS SOBRE VENTA"

**Elige:**
- 🏘️ **INMUEBLE URBANO** - Casa, apartamento, local comercial en la ciudad
- 🌾 **INMUEBLE RURAL** - Tierra, chacra, estancia, campo, quinta

⚠️ Esto determina las tasas que se aplicarán.

### Paso 2: Completar Formulario

**DATOS DEL INMUEBLE:**

1. **Valuación Fiscal (VF)** - Este es el valor que asigna catastro
   - Dónde encontrarlo: Documento de propiedad / Catastro
   - Ej: $500.000

2. **Precio Pactado** - El precio de la operación actual
   - Lo que realmente se vende
   - Ej: $550.000

**DATOS DEL CÁLCULO:**

3. **Precio Original** - Cuánto costó cuando se compró
   - Ej: $200.000

4. **Fecha de Compra** - Cuándo se adquirió el inmueble
   - Presiona el calendario para seleccionar
   - Ej: 15/07/2015

5. **Fecha de Venta** - Cuándo se vende ahora
   - Presiona el calendario
   - Ej: 15/03/2026

⚠️ Todos los campos son obligatorios (marcados con *)

### Paso 3: Revisar Datos

Antes de calcular, verifica:
- ✓ Valuación Fiscal = valor catastral
- ✓ Precio Pactado = precio de venta real
- ✓ Fechas correctas (compra < venta)
- ✓ Todos los montos en UYU (pesos uruguayos)

### Paso 4: Presionar "CALCULAR"

Se procesarán automáticamente:
- Índices IPC más recientes
- Cálculo de ITP
- Cálculo de IRPF (régimen real y ficto)
- Selección automática del régimen más favorable

---

## 📊 ENTENDER LOS RESULTADOS

### Pantalla de Resultados

```
RESUMEN OPERACIÓN
═════════════════════════════════════
Base Imponible
$550.000,00
(Mayor entre Valuación Fiscal y Precio)

═════════════════════════════════════
ITP (Transmisiones Patrimoniales)
─────────────────────────────────────
Alícuota: 2%
ITP Total: $11.000,00 ✓

═════════════════════════════════════
IRPF (Incrementos Patrimoniales)
─────────────────────────────────────

RÉGIMEN REAL (Ganancia)
├─ Costo Actualizado: $277.760
├─ Ganancia Real: $272.240
└─ IRPF Real (12%): $32.668,80

RÉGIMEN FICTO (Simplificado)
└─ IRPF Ficto (2%): $11.000,00

⚠️ Se aplica RÉGIMEN REAL ($32.668,80)

═════════════════════════════════════
TOTAL IMPUESTOS:
ITP + IRPF = $43.668,80
═════════════════════════════════════
```

### Explicación de Cada Sección

**ITP (Impuesto a las Transmisiones Patrimoniales)**

¿Qué es? Un impuesto sobre la transmisión de propiedad.

¿Quién paga? El comprador (aunque el vendedor puede negociar).

¿Cuánto es? Normalmente 2% del precio de venta.

Ejemplo:
```
Precio: $550.000
Alícuota: 2%
ITP = $550.000 × 0.02 = $11.000
```

---

**IRPF - Régimen REAL**

¿Qué es? Impuesto sobre la ganancia real obtenida.

¿Cómo se calcula?

Paso 1: **Actualizar el costo original por inflación**
```
Costo Actualizado = Precio Original × (IPC Final / IPC Inicial)

Ejemplo:
- Precio Original: $200.000
- IPC en Jul 2015: 230.67
- IPC en Mar 2026: 323.78
- Costo Actualizado = $200.000 × (323.78 / 230.67) = $277.760
```

Paso 2: **Calcular ganancia real**
```
Ganancia Real = Precio Venta - Costo Actualizado

Ejemplo:
Ganancia = $550.000 - $277.760 = $272.240
```

Paso 3: **Aplicar alícuota por tramo**
```
Si ganancia es $272.240 (entre $200.000 y $400.000):
Tasa = 12%
IRPF = $272.240 × 0.12 = $32.668,80
```

---

**IRPF - Régimen FICTO** (Alternativo)

¿Cuándo se usa? Cuando NO hay ganancia o es mínima.

¿Cómo se calcula?
```
IRPF Ficto = Precio Venta × Tasa Ficta

Urbano: 2% sobre precio de venta
Rural: 1% sobre precio de venta

Ejemplo urbano:
IRPF Ficto = $550.000 × 0.02 = $11.000
```

---

**¿Cuál se aplica?** 

La app calcula AMBOS y aplica **el menor** (más favorable al vendedor):
- Régimen Real: $32.668,80
- Régimen Ficto: $11.000,00
- **Se aplica:** Régimen Real $32.668,80 (oops, es mayor)

En este caso: **Se aplicaría Régimen Ficto $11.000,00**

---

## 💾 GUARDAR OPERACIONES

Después del cálculo, presiona **"Guardar Operación"**

**Beneficios:**
- Recuperar cálculos anteriores
- No perder información
- Comparar diferentes escenarios
- Acceso rápido sin recalcular

---

## 📤 EXPORTAR RESULTADOS

Presiona **"Exportar (PDF/Imagen)"**

**Se genera un documento con:**
- Todos los datos ingresados
- Desglose paso a paso del cálculo
- Resultado final
- Fecha y hora del cálculo
- Logo de la app

**Formatos disponibles:**
- 📄 PDF - Para imprimir y archivar
- 🖼️ Imagen PNG - Para compartir por WhatsApp

---

## 📚 OPERACIONES ESPECIALES

Presiona "OTRAS OPERACIONES" para:

### Herencias

¿Cuándo usar? Cuando alguien hereda un inmueble.

**Tasas según tipo de heredero:**
- Cónyuge e hijos: Exento (0%)
- Hermanos: 2%
- Otros herederos: 5%

**Datos requeridos:**
- Tipo de heredero
- Valuación fiscal
- Fecha de compra del fallecido
- Fecha del fallecimiento

### Donaciones

¿Cuándo usar? Cuando se regala un inmueble.

**Tasas según relación:**
- Entre cónyuges: Exento (0%)
- Padres a hijos: 1%
- Otros: 3-5%

### Permutas

¿Cuándo usar? Cuando se intercambian dos inmuebles.

**Cálculo:**
- Se calcula ITP sobre el mayor valor
- Alícuota: 2%

### Cesión de Derechos

¿Cuándo usar? Cuando se cede derechos posesorios.

**Alícuota:** 1%

---

## 🔍 HISTORIAL DE OPERACIONES

Presiona **"HISTORIAL"** para ver todas tus operaciones guardadas.

**Cada operación muestra:**
- Tipo de operación
- Tipo de inmueble (urbano/rural)
- Base imponible
- Impuestos totales
- Fecha del cálculo

**Acciones:**
- 👁️ Expandir - Ver detalles completos
- 📤 Exportar - Descargar resultado
- 🗑️ Eliminar - Borrar de historial
- 🔄 Recalcular - Actualizar con nuevos índices

---

## ⚙️ CONFIGURACIÓN

Presiona **"CONFIGURACIÓN"** para:

### Actualizar Índices

Los índices se cargan automáticamente cada vez que:
- Abres la app
- Si hace más de 24 horas que no se actualizaban

**Actualizar manualmente:**
1. Ir a Configuración
2. Ver el estado de cada índice:
   - IPC - Última: 323.78 (01/03/2026)
   - UI - Última: 1254.89 (01/03/2026)
   - UR - Última: 1845.22 (01/03/2026)
   - USD - Última: 36.50 (02/04/2026)
3. Presionar [Actualizar ahora] si quieres forzar actualización

⚠️ **Importante:** Los índices afectan el cálculo de IRPF en régimen real.

### Preferencias

**Moneda:**
- UYU (Pesos Uruguayos) - Recomendado
- USD (Dólares)
- EUR (Euros)

**Formato de fecha:**
- DD/MM/YYYY (15/03/2026) - Recomendado en Uruguay
- MM/DD/YYYY (03/15/2026) - Formato US

**Notificaciones:**
- Activadas - Recibe alertas de actualizaciones
- Desactivadas - No recibe notificaciones

**Modo oscuro:**
- Activado - Pantalla oscura (menos batería)
- Desactivado - Pantalla clara

---

## 🆘 PREGUNTAS FRECUENTES

### ¿Qué es la Valuación Fiscal?

Es el valor que asigna la intendencia municipal basándose en:
- Ubicación del inmueble
- Tamaño
- Antigüedad
- Estado

**Dónde encontrarlo:**
- Documento de propiedad
- Boleto de compraventa anterior
- Catastro (en línea o presencial)
- Escribano

### ¿Qué diferencia hay entre Valuación Fiscal y Precio Pactado?

| | Valuación Fiscal | Precio Pactado |
|---|---|---|
| **Quién asigna** | Intendencia | Las partes |
| **Cuándo** | Periódicamente | En la operación |
| **Usa para** | Contribuciones | Base imponible (si es mayor) |

**ITP se calcula sobre el MAYOR de los dos.**

### ¿Por qué hay dos cálculos de IRPF?

Porque la ley permite elegir el régimen más favorable:

**Régimen Real:**
- Más preciso
- Requiere cálculo complejo
- Usa inflación (IPC)
- Mejor cuando hay ganancia grande

**Régimen Ficto:**
- Simplificado
- Sin cálculos complejos
- Mejor cuando hay ganancia pequeña

La app calcula ambos y elige el menor automáticamente.

### ¿Qué pasa si pierdo dinero con la venta?

Si la ganancia es negativa (vendo por menos de lo que pagué):
- IRPF Real = $0 (no hay ganancia)
- IRPF Ficto = se aplica igual (desventajoso)
- La app elige Régimen Real = $0

### ¿Está actualizado con las leyes de 2026?

Sí. La app incluye:
- Cambios en alícuotas ITP
- Reforma del IRPF de 2019
- Índices actuales
- Jurisprudencia reciente

⚠️ Consultar siempre con profesional antes de operación importante.

### ¿Funciona sin internet?

**Primera carga:** Necesita internet para cargar índices.

**Después:** Funciona sin conexión usando datos en caché.

⚠️ Los cálculos se hacen con índices de 7 días máximo.

### ¿Se guardan mis datos?

**Local:** Sí, en tu dispositivo (Hive Database).

**Cloud:** No (a menos que configures sincronización).

**Privacidad:** No enviamos datos a servidores.

### ¿Puedo usar esto como asesor tributario?

⚠️ **NO.** Esta app es de referencia educativa.

**Para decisiones importantes:**
- Consultar con contador profesional
- Asesoría de escribano especializado
- DGI si hay dudas

La app **NO reemplaza** asesoría profesional.

---

## 🐛 SOLUCIÓN DE PROBLEMAS

### "No carga los índices"

**Solución:**
1. Verificar conexión a internet
2. Ir a Configuración → Actualizar ahora
3. Si sigue sin funcionar:
   - Cerrar app completamente
   - Reabrirla
   - Reiniciar teléfono

### "Dice que necesito actualización"

**Solución:**
1. Ir a Play Store / App Store
2. Buscar "ITP-IRPF Calculator"
3. Presionar "Actualizar"
4. Esperar a que termine
5. Reabrirla

### "No puedo guardar operación"

**Solución:**
1. Verificar que tengas espacio libre
2. Cerrar otras apps
3. Ir a Configuración del teléfono
4. Borrar caché de la app
5. Reiniciar teléfono

### "Los números no se ven correctos"

**Solución:**
1. Verificar que ingresaste datos correctos
2. Revisar que la moneda sea UYU
3. Consultar con contador
4. Contactar soporte

---

## 📞 CONTACTO Y SOPORTE

**¿Problemas o preguntas?**

- 📧 Email: soporte@itpirpf.com
- 🌐 Web: https://www.itpirpf.com
- 📱 WhatsApp: +598 99999999 (horario: 9-17 hrs)

**Horario de atención:**
- Lunes a viernes: 9:00 - 17:00
- Sábados: 9:00 - 13:00
- Domingos y feriados: No hay atención

---

## 📋 REFERENCIAS LEGALES

**Documentos consultados:**
- DGI - Resoluciones sobre ITP e IRPF
- INE - Metodología IPC
- BCU - Índices UI
- Ley de IRPF 2019
- Jurisprudencia vigente 2026

**Esta app es de referencia.** Consultar siempre documentación oficial de DGI.

---

**Última actualización:** Abril 2026  
**Versión de la guía:** 1.0.0  
**Para soporte:** soporte@itpirpf.com

