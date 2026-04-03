# IRPF - Impuesto a la Renta de las Personas Físicas
## Incrementos Patrimoniales en Operaciones Inmobiliarias

## DEFINICIÓN

El IRPF sobre incrementos patrimoniales grava las ganancias obtenidas por la venta de bienes inmuebles. Es obligación del escribano (agente de retención) calcular y retener este impuesto.

## RÉGIMEN DE CÁLCULO

Existen DOS regímenes de cálculo:

### RÉGIMEN 1: RÉGIMEN REAL (ACTUAL - A partir de 2019)

Se calcula sobre la **ganancia real** del inmueble.

**Fórmula:**
```
Ganancia Real = Precio de Venta - Costo de Adquisición Actualizado

Costo Actualizado = (Costo Original × Índice Final) / Índice Original

IRPF = Ganancia Real × Alícuota (%)
```

**Componentes:**
- **Precio de Venta:** Monto pactado en la operación
- **Costo Original:** Precio pagado en la compra original
- **Índice Original:** IPC del mes de compra
- **Índice Final:** IPC del mes de venta
- **Alícuota:** Depende del tipo de inmueble y régimen

### RÉGIMEN 2: RÉGIMEN FICTO (Alternativa permitida)

Se aplica cuando la ganancia real es negativa o muy baja.

**Alícuota Ficta:**
- Inmuebles urbanos: 2% sobre el precio de venta
- Inmuebles rurales: 1% sobre el precio de venta

```
IRPF Ficto = Precio de Venta × Alícuota Ficta
```

## ALÍCUOTAS DE IRPF

### INMUEBLES URBANOS

**Régimen Real:**
- **Ganancia hasta $100.000:** Exento
- **Ganancia hasta $200.000:** 8%
- **Ganancia hasta $400.000:** 12%
- **Ganancia hasta $600.000:** 14%
- **Ganancia hasta $800.000:** 16%
- **Ganancia superior a $800.000:** 18%

**Régimen Ficto:**
- 2% sobre precio de venta

### INMUEBLES RURALES

**Régimen Real:**
- **Ganancia hasta $150.000:** Exento
- **Ganancia hasta $300.000:** 8%
- **Ganancia hasta $500.000:** 12%
- **Ganancia superior a $500.000:** 15%

**Régimen Ficto:**
- 1% sobre precio de venta

### CASOS ESPECIALES

**Primera Vivienda (Exención):**
- Exento si se cumplen requisitos:
  - Única vivienda vendida en últimos 5 años
  - Vivienda fue habitada por el propietario
  - Precio no supera límite establecido ($100.000 USD aprox.)

**Donaciones:**
- No tributan incremento patrimonial (otros impuestos aplican)

**Herencias:**
- La ganancia se calcula desde la valuación de herencia
- Se aplica régimen normal

## FECHAS IMPORTANTES

- **Fecha de compra:** Determina índice de actualización
- **Fecha de venta:** Determina índice final
- **Período de tenencia:** Afecta tratamiento en algunos casos

## ÍNDICES A UTILIZAR

### IPC (Índice de Precios al Consumidor)
- Publicado por **INE** (Instituto Nacional de Estadística)
- Base: Diciembre 2010 = 100
- Actualización: Mensual
- URL: https://www.ine.gub.uy

### IU (Índice de Unidad Reajustable)
- Publicado por **BCU** (Banco Central del Uruguay)
- Actualización: Diaria
- Usado en algunos cálculos y ajustes
- URL: https://www.bcu.gub.uy

### UR (Unidad Reajustable)
- Similar a IU pero con frecuencia diferente
- Publicado por **MVOTMA**
- Usado en urbanizaciones y construcción

### COTIZACIÓN DEL DÓLAR
- Cotización BCU Banco Comprador
- Para operaciones en moneda extranjera
- URL: https://www.bcu.gub.uy

## CÁLCULO PASO A PASO

### Ejemplo 1: INMUEBLE URBANO - RÉGIMEN REAL

**Datos:**
- Compra: Julio 2015 - Precio $200.000
- Venta: Marzo 2026 - Precio $400.000
- IPC Jul 2015: 230.67
- IPC Mar 2026: 320.45

**Paso 1: Calcular costo actualizado**
```
Costo Actualizado = $200.000 × (320.45 / 230.67) = $200.000 × 1.3888 = $277.760
```

**Paso 2: Calcular ganancia real**
```
Ganancia Real = $400.000 - $277.760 = $122.240
```

**Paso 3: Aplicar alícuota (Ganancia entre $100.000 y $200.000 = 8%)**
```
IRPF = $122.240 × 0.08 = $9.779,20
```

**Paso 4: Comparar con régimen ficto**
```
IRPF Ficto = $400.000 × 0.02 = $8.000
```

**Resultado:** El contribuyente elige régimen real ($9.779,20) o ficto ($8.000) - menor impuesto

---

### Ejemplo 2: INMUEBLE RURAL - RÉGIMEN REAL

**Datos:**
- Compra: Enero 2020 - Precio $600.000
- Venta: Marzo 2026 - Precio $750.000
- IPC Ene 2020: 298.15
- IPC Mar 2026: 320.45

**Paso 1: Costo actualizado**
```
Costo Actualizado = $600.000 × (320.45 / 298.15) = $600.000 × 1.0747 = $644.820
```

**Paso 2: Ganancia**
```
Ganancia = $750.000 - $644.820 = $105.180
```

**Paso 3: Alícuota (Ganancia entre $150.000 pero menor - tabla rural)**
```
IRPF = $105.180 × 0.08 = $8.414,40
```

**Paso 4: Comparar ficto**
```
IRPF Ficto = $750.000 × 0.01 = $7.500
```

**Resultado:** Régimen ficto ($7.500) es más beneficioso

---

## OBLIGACIÓN DE RETENCIÓN

**El escribano debe:**

1. Calcular ambos regímenes (real y ficto)
2. Aplicar el menor (más favorable al vendedor)
3. Retener 100% del impuesto
4. Informar a DGI
5. Depositar dentro de 30 días

**Formularios:**
- RUT (Registro Único Tributario) 2125: Ventas de inmuebles
- Formulario 2127: Retención de IRPF

## EXENCIONES Y CASOS ESPECIALES

1. **Primera vivienda:** Exención total
2. **Herencias:** No tributan (se grava en otro momento)
3. **Cambio de vivienda:** Ciertos beneficios
4. **Personas jubiladas:** Tratamiento especial

## INTEGRACIÓN EN LA APP

La app debe:

1. Permitir elegir entre urbano/rural
2. Solicitar: fecha compra, precio compra, fecha venta, precio venta
3. Obtener automáticamente IPC del INE
4. Calcular régimen real (con fórmula de ganancia)
5. Calcular régimen ficto
6. Mostrar ambos resultados
7. Indicar cuál es más favorable
8. Desglosar cada paso del cálculo
9. Permitir ingreso manual de IPC (si no se conecta a API)
10. Exportar resultado con cálculos detallados

## REFERENCIAS NORMATIVAS

- Ley de IRPF (2019): Cambios al régimen de incrementos
- DGI (Dirección General Impositiva): https://www.dgi.gub.uy
- Resoluciones y actualizaciones: Formularios 2125, 2127, 2128
