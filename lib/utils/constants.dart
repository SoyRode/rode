// Tasas de ITP (Impuesto a las Transmisiones Patrimoniales)

/// Alícuota ITP para compraventa en general
const double ITP_COMPRAVENTA = 0.02; // 2%

/// Alícuota ITP reducida para primera vivienda
const double ITP_PRIMERA_VIVIENDA = 0.005; // 0.5%

/// Alícuota ITP para sucesiones - cónyuge e hijos
const double ITP_SUCESION_EXENTA = 0.0; // Exento

/// Alícuota ITP para sucesiones - hermanos
const double ITP_SUCESION_HERMANOS = 0.02; // 2%

/// Alícuota ITP para sucesiones - otros herederos
const double ITP_SUCESION_OTROS = 0.05; // 5%

/// Alícuota ITP para permutas
const double ITP_PERMUTA = 0.02; // 2%

/// Alícuota ITP para cesión de derechos posesorios
const double ITP_CESION_DERECHOS = 0.01; // 1%

/// Alícuota ITP para donaciones entre cónyuges
const double ITP_DONACION_CONYUGE = 0.0; // Exento

/// Alícuota ITP para donaciones de padres a hijos
const double ITP_DONACION_PADRES_HIJOS = 0.01; // 1%

/// Alícuota ITP para donaciones entre otros
const double ITP_DONACION_OTROS = 0.03; // 3%

// ==================== IRPF URBANO ====================

/// Límite de ganancia exenta - IRPF Urbano
const double IRPF_URBANO_EXEMPT_LIMIT = 100000.0;

/// Tramo 1: Ganancia hasta $200.000 - IRPF Urbano
const double IRPF_URBANO_TRAMO1_LIMIT = 200000.0;
const double IRPF_URBANO_TRAMO1_RATE = 0.08; // 8%

/// Tramo 2: Ganancia hasta $400.000 - IRPF Urbano
const double IRPF_URBANO_TRAMO2_LIMIT = 400000.0;
const double IRPF_URBANO_TRAMO2_RATE = 0.12; // 12%

/// Tramo 3: Ganancia hasta $600.000 - IRPF Urbano
const double IRPF_URBANO_TRAMO3_LIMIT = 600000.0;
const double IRPF_URBANO_TRAMO3_RATE = 0.14; // 14%

/// Tramo 4: Ganancia hasta $800.000 - IRPF Urbano
const double IRPF_URBANO_TRAMO4_LIMIT = 800000.0;
const double IRPF_URBANO_TRAMO4_RATE = 0.16; // 16%

/// Tramo 5: Ganancia superior a $800.000 - IRPF Urbano
const double IRPF_URBANO_TRAMO5_RATE = 0.18; // 18%

/// Régimen Ficto - IRPF Urbano
const double IRPF_URBANO_FICTO_RATE = 0.02; // 2%

// ==================== IRPF RURAL ====================

/// Límite de ganancia exenta - IRPF Rural
const double IRPF_RURAL_EXEMPT_LIMIT = 150000.0;

/// Tramo 1: Ganancia hasta $300.000 - IRPF Rural
const double IRPF_RURAL_TRAMO1_LIMIT = 300000.0;
const double IRPF_RURAL_TRAMO1_RATE = 0.08; // 8%

/// Tramo 2: Ganancia hasta $500.000 - IRPF Rural
const double IRPF_RURAL_TRAMO2_LIMIT = 500000.0;
const double IRPF_RURAL_TRAMO2_RATE = 0.12; // 12%

/// Tramo 3: Ganancia superior a $500.000 - IRPF Rural
const double IRPF_RURAL_TRAMO3_RATE = 0.15; // 15%

/// Régimen Ficto - IRPF Rural
const double IRPF_RURAL_FICTO_RATE = 0.01; // 1%

// ==================== OTROS ÍNDICES ====================

/// Índice de inflación base (diciembre 2010)
const double IPC_BASE = 100.0;

// ==================== VALIDACIONES ====================

/// Monto mínimo para una operación
const double MIN_OPERATION_AMOUNT = 1000.0;

/// Monto máximo para una operación (sin restricción real)
const double MAX_OPERATION_AMOUNT = 999999999.99;

/// Número de decimales para dinero
const int CURRENCY_DECIMALS = 2;

/// Número de decimales para índices
const int INDEX_DECIMALS = 2;

// ==================== CONFIGURACIÓN ====================

/// Días para considerar un índice como desactualizado
const int INDEX_OUTDATED_DAYS = 7;

/// URL base para API del INE
const String INE_API_BASE_URL = 'https://www.ine.gub.uy/';

/// URL base para API del BCU
const String BCU_API_BASE_URL = 'https://www.bcu.gub.uy/';

/// URL base para API del MVOTMA
const String MVOTMA_API_BASE_URL = 'https://www.mvotma.gub.uy/';

// ==================== MENSAJES Y DESCRIPCIONES ====================

const String ITP_DESCRIPTION = 'Impuesto a las Transmisiones Patrimoniales';
const String IRPF_DESCRIPTION = 'Incremento Patrimonial - Impuesto a la Renta';
const String IPC_DESCRIPTION = 'Índice de Precios al Consumidor';
const String UI_DESCRIPTION = 'Índice de Unidad Reajustable';
const String UR_DESCRIPTION = 'Unidad Reajustable';

// ==================== TIPOS DE OPERACIÓN ====================

const String OPERATION_TYPE_COMPRAVENTA = 'compraventa';
const String OPERATION_TYPE_HERENCIA = 'herencia';
const String OPERATION_TYPE_DONACION = 'donacion';
const String OPERATION_TYPE_PERMUTA = 'permuta';
const String OPERATION_TYPE_CESION = 'cesion';

// ==================== TIPOS DE INMUEBLES ====================

const String IMMOBILE_TYPE_URBAN = 'urban';
const String IMMOBILE_TYPE_RURAL = 'rural';

// ==================== REGÍMENES IRPF ====================

const String REGIMEN_REAL = 'real';
const String REGIMEN_FICTO = 'ficto';
