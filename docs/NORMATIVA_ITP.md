# ITP - Impuesto a las Transmisiones Patrimoniales

## DEFINICIÓN Y ALCANCE

El ITP es un impuesto que grava las transmisiones de dominio de bienes inmuebles ubicados en Uruguay. Se aplica a operaciones de compraventa, sucesiones, permutas, cesiones de derechos posesorios y otros actos gravados.

## ALÍCUOTAS SEGÚN TIPO DE OPERACIÓN

### 1. COMPRAVENTA DE INMUEBLES

**Régimen General:**
- Urbanidad: 2% sobre el precio de venta
- Ruralidad: 2% sobre el precio de venta

**Casos especiales:**
- Vivienda única: 0.5% (siempre que sea primera vivienda del comprador)
- Compra por parte del Estado: Exento

### 2. SUCESIONES

- Cónyuge: Exento
- Descendientes en línea recta: Exento
- Ascendientes en línea recta: Exento
- Hermanos: 2%
- Otros herederos: 5%
- Legados a personas ajenas: 5%

### 3. PERMUTAS

- Se calcula sobre el mayor valor de los bienes permutados
- Alícuota: 2%

### 4. CESIONES DE DERECHOS POSESORIOS

- Alícuota: 1% sobre el valor del derecho cedido

### 5. OTROS ACTOS GRAVADOS

- Donaciones: Según vincularidad
  - Padres a hijos: 1%
  - Entre cónyuges: Exento
  - Otros: 3-5%

## BASE IMPONIBLE

La base imponible es el valor de mercado del inmueble. Se utiliza:

1. **Valuación Fiscal (VF):** Valor asignado por catastro
2. **Precio pactado:** Si es superior a VF
3. **Avalúo:** En caso de discrepancia

**Fórmula:**
```
Base Imponible = max(Valuación Fiscal, Precio pactado)
```

## CÁLCULO DEL ITP

**Fórmula General:**
```
ITP = Base Imponible × Alícuota (%)
```

**Ejemplo - Compraventa:**
- Valuación Fiscal: $500.000
- Precio pactado: $550.000
- Base Imponible = $550.000 (mayor valor)
- ITP (2%) = $550.000 × 0.02 = $11.000
```

## EXENCIONES Y REDUCCIONES

1. **Exento:** Compra por primera vivienda (0.5%)
2. **Exento:** Herencias en línea recta
3. **Exento:** Donaciones entre cónyuges

## RÉGIMEN DE RETENCIÓN

El escribano actúa como **agente de retención**:
- Retiene el 100% del ITP antes de entregar escritura
- Deposita en DGI dentro de 30 días
- Debe informar operación en formulario

## PLAZOS Y OBLIGACIONES

- **Plazo de pago:** Dentro de 30 días de la operación
- **Responsable:** El comprador (o heredero/cesionario)
- **Retención:** Por el escribano

## APLICACIÓN EN LA APP

La app debe:
1. Permitir seleccionar tipo de operación
2. Solicitar datos del inmueble (urbano/rural)
3. Calcular base imponible
4. Aplicar alícota correcta
5. Mostrar desglose del cálculo
6. Permitir exportar resultado
