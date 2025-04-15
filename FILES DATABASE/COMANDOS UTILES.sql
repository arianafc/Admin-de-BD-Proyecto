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
