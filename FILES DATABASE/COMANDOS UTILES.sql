--RESUMEN DE OBJETOS
SELECT
  (SELECT COUNT(*) FROM all_sequences WHERE sequence_owner = 'ADMINISTRATOR') AS total_secuencias,
  (SELECT COUNT(*) FROM all_triggers  WHERE owner = 'ADMINISTRATOR') AS total_triggers,
  (SELECT COUNT(*) FROM all_objects   WHERE object_type = 'FUNCTION'     AND owner = 'ADMINISTRATOR') AS total_funciones,
  (SELECT COUNT(*) FROM all_objects   WHERE object_type = 'PACKAGE'      AND owner = 'ADMINISTRATOR') AS total_paquetes,
  (SELECT COUNT(*) FROM all_objects   WHERE object_type = 'PACKAGE BODY' AND owner = 'ADMINISTRATOR') AS total_paquetes_body,
  (SELECT COUNT(*) FROM all_tables    WHERE owner = 'ADMINISTRATOR') AS total_tablas
FROM dual;

--EJECUTAR AUDITORIA COMO SYS
SELECT * FROM dba_audit_trail
WHERE username = 'ADMINISTRATOR'
ORDER BY timestamp DESC;


--------------------------------------------------------------------------------------------------------------------------
-- 1. TABLAS DEL ESQUEMA
SELECT 'TABLAS' AS tipo, table_name
FROM all_tables
WHERE owner = 'ADMINISTRATOR'
ORDER BY table_name;

-- 2. COLUMNAS DE CADA TABLA
SELECT 'COLUMNAS' AS tipo, table_name, column_name, data_type, data_length, nullable
FROM all_tab_columns
WHERE owner = 'ADMINISTRATOR'
ORDER BY table_name, column_id;

-- 3. CLAVES PRIMARIAS
SELECT 'CLAVES_PRIMARIAS' AS tipo, cols.table_name, cols.column_name, cons.constraint_name
FROM all_constraints cons
JOIN all_cons_columns cols ON cons.constraint_name = cols.constraint_name AND cons.owner = cols.owner
WHERE cons.constraint_type = 'P'
  AND cons.owner = 'ADMINISTRATOR'
ORDER BY cols.table_name;

-- 4. CLAVES FORANEAS
SELECT 'CLAVES_FORANEAS' AS tipo,
       a.table_name, a.column_name, a.constraint_name,
       c_pk.table_name AS tabla_referenciada, b.column_name AS columna_referenciada
FROM all_cons_columns a
JOIN all_constraints c ON a.constraint_name = c.constraint_name AND a.owner = c.owner
JOIN all_constraints c_pk ON c.r_constraint_name = c_pk.constraint_name AND c.r_owner = c_pk.owner
JOIN all_cons_columns b ON c_pk.constraint_name = b.constraint_name AND c_pk.owner = b.owner AND a.position = b.position
WHERE c.constraint_type = 'R'
  AND c.owner = 'ADMINISTRATOR'
ORDER BY a.table_name;

-- 5. FUNCIONES, PROCEDIMIENTOS Y PAQUETES
SELECT 'OBJETOS_PLSQL' AS tipo, object_name, object_type, status
FROM all_objects
WHERE object_type IN ('FUNCTION', 'PROCEDURE', 'PACKAGE', 'PACKAGE BODY')
  AND owner = 'ADMINISTRATOR'
ORDER BY object_type, object_name;

-- 6. TRIGGERS
SELECT 'TRIGGERS' AS tipo, trigger_name, table_name, triggering_event, status
FROM all_triggers
WHERE owner = 'ADMINISTRATOR'
ORDER BY table_name;

-- 7. SECUENCIAS
SELECT 'SECUENCIAS' AS tipo, sequence_name, min_value, max_value, increment_by, last_number
FROM all_sequences
WHERE sequence_owner = 'ADMINISTRATOR';

-- 8. VISTAS
SELECT 'VISTAS' AS tipo, view_name
FROM all_views
WHERE owner = 'ADMINISTRATOR'
ORDER BY view_name;




