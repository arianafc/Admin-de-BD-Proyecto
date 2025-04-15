BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 415743284,
        P_FECHA_INICIO  => TO_DATE('2022-10-11', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-10-12', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 3,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 415743284,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-10-11', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 948680916,
        P_FECHA_INICIO  => TO_DATE('2021-01-04', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-01-05', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 12,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 948680916,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-01-04', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 333194343,
        P_FECHA_INICIO  => TO_DATE('2023-07-20', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-07-21', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 16,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 333194343,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-07-20', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 266920089,
        P_FECHA_INICIO  => TO_DATE('2021-12-29', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-12-30', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 3,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 266920089,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-12-29', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 303954090,
        P_FECHA_INICIO  => TO_DATE('2021-10-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-10-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 5,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 303954090,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-10-27', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 131324164,
        P_FECHA_INICIO  => TO_DATE('2021-01-04', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-01-05', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 6,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 131324164,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-01-04', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 581583099,
        P_FECHA_INICIO  => TO_DATE('2025-03-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-03-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 1,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 581583099,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-03-27', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 274373492,
        P_FECHA_INICIO  => TO_DATE('2023-04-19', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-04-20', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 2,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 274373492,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-04-19', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 158466602,
        P_FECHA_INICIO  => TO_DATE('2023-02-18', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-02-19', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 7,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 158466602,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-02-18', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 697319820,
        P_FECHA_INICIO  => TO_DATE('2023-11-28', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-11-29', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 2,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 697319820,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-11-28', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 458953161,
        P_FECHA_INICIO  => TO_DATE('2021-08-06', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-08-07', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 2,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 458953161,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-08-06', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 171915407,
        P_FECHA_INICIO  => TO_DATE('2021-11-04', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-11-05', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 1,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 171915407,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-11-04', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 845042226,
        P_FECHA_INICIO  => TO_DATE('2021-10-06', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-10-07', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 12,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 845042226,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-10-06', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 409602799,
        P_FECHA_INICIO  => TO_DATE('2023-08-03', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-08-04', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 12,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 409602799,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-08-03', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 948680916,
        P_FECHA_INICIO  => TO_DATE('2024-03-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-03-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 948680916,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-03-23', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 281708811,
        P_FECHA_INICIO  => TO_DATE('2022-03-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-03-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 5,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 281708811,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-03-27', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 623159621,
        P_FECHA_INICIO  => TO_DATE('2023-02-05', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-02-06', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 17,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 623159621,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-02-05', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 415813764,
        P_FECHA_INICIO  => TO_DATE('2021-06-15', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-06-16', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 415813764,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-06-15', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 178165051,
        P_FECHA_INICIO  => TO_DATE('2024-06-12', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-06-13', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 19,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 178165051,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-06-12', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 303954090,
        P_FECHA_INICIO  => TO_DATE('2022-06-22', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-06-23', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 1,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 303954090,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-06-22', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 596435060,
        P_FECHA_INICIO  => TO_DATE('2024-01-28', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-01-29', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 17,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 596435060,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-01-28', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 946624902,
        P_FECHA_INICIO  => TO_DATE('2021-02-02', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-02-03', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 1,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 946624902,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-02-02', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 591264539,
        P_FECHA_INICIO  => TO_DATE('2024-06-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-06-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 19,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 591264539,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-06-23', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 364528232,
        P_FECHA_INICIO  => TO_DATE('2025-07-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-07-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 6,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 364528232,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-07-09', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 946624902,
        P_FECHA_INICIO  => TO_DATE('2022-08-06', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-08-07', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 18,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 946624902,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-08-06', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 792373661,
        P_FECHA_INICIO  => TO_DATE('2024-03-29', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-03-30', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 18,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 792373661,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-03-29', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 273522987,
        P_FECHA_INICIO  => TO_DATE('2023-03-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 13,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 273522987,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-03-10', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 166914181,
        P_FECHA_INICIO  => TO_DATE('2024-12-03', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-12-04', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 18,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 166914181,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-12-03', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 186564306,
        P_FECHA_INICIO  => TO_DATE('2022-12-21', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-12-22', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 3,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 186564306,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-12-21', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 463824860,
        P_FECHA_INICIO  => TO_DATE('2023-10-12', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-10-13', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 12,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 463824860,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-10-12', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 186564306,
        P_FECHA_INICIO  => TO_DATE('2021-12-19', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-12-20', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 18,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 186564306,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-12-19', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 980585498,
        P_FECHA_INICIO  => TO_DATE('2023-06-03', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-06-04', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 18,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 980585498,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-06-03', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 229378074,
        P_FECHA_INICIO  => TO_DATE('2024-10-31', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-11-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 10,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 229378074,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-10-31', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 941779996,
        P_FECHA_INICIO  => TO_DATE('2024-07-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-07-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 941779996,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-07-10', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 975872912,
        P_FECHA_INICIO  => TO_DATE('2023-12-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-12-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 13,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 975872912,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-12-09', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 980585498,
        P_FECHA_INICIO  => TO_DATE('2024-08-12', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-08-13', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 20,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 980585498,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-08-12', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 207102036,
        P_FECHA_INICIO  => TO_DATE('2022-05-31', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-06-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 16,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 207102036,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-05-31', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 980585498,
        P_FECHA_INICIO  => TO_DATE('2024-07-06', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-07-07', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 3,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 980585498,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-07-06', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 628459555,
        P_FECHA_INICIO  => TO_DATE('2025-06-11', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-06-12', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 8,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 628459555,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-06-11', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 128673724,
        P_FECHA_INICIO  => TO_DATE('2023-07-24', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-07-25', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 8,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 128673724,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-07-24', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 275474416,
        P_FECHA_INICIO  => TO_DATE('2023-09-05', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-09-06', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 20,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 275474416,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-09-05', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 409602799,
        P_FECHA_INICIO  => TO_DATE('2022-04-05', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-04-06', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 2,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 409602799,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-04-05', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 846613112,
        P_FECHA_INICIO  => TO_DATE('2024-10-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-10-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 2,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 846613112,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-10-27', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 975872912,
        P_FECHA_INICIO  => TO_DATE('2024-06-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-06-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 975872912,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-06-09', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 458953161,
        P_FECHA_INICIO  => TO_DATE('2021-01-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-01-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 7,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 458953161,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-01-01', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 395524404,
        P_FECHA_INICIO  => TO_DATE('2023-05-18', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-05-19', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 9,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 395524404,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-05-18', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 729094832,
        P_FECHA_INICIO  => TO_DATE('2023-10-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-10-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 14,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 729094832,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-10-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 958543215,
        P_FECHA_INICIO  => TO_DATE('2025-01-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-01-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 6,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 958543215,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-01-16', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 619379091,
        P_FECHA_INICIO  => TO_DATE('2025-03-20', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-03-21', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 19,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 619379091,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-03-20', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 789690055,
        P_FECHA_INICIO  => TO_DATE('2024-02-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-02-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 8,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 789690055,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-02-10', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 581583099,
        P_FECHA_INICIO  => TO_DATE('2023-06-03', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-06-04', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 1,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 581583099,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-06-03', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 318215086,
        P_FECHA_INICIO  => TO_DATE('2021-02-15', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-02-16', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 16,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 318215086,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-02-15', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 364528232,
        P_FECHA_INICIO  => TO_DATE('2021-02-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-02-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 17,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 364528232,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-02-25', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 810124685,
        P_FECHA_INICIO  => TO_DATE('2023-02-28', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 16,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 810124685,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-02-28', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 140826345,
        P_FECHA_INICIO  => TO_DATE('2024-12-06', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-12-07', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 1,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 140826345,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-12-06', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 274373492,
        P_FECHA_INICIO  => TO_DATE('2021-08-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-08-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 18,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 274373492,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-08-14', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 792373661,
        P_FECHA_INICIO  => TO_DATE('2021-06-28', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-06-29', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 20,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 792373661,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-06-28', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 985895657,
        P_FECHA_INICIO  => TO_DATE('2023-09-21', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-09-22', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 2,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 985895657,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-09-21', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 985895657,
        P_FECHA_INICIO  => TO_DATE('2023-11-30', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-12-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 17,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 985895657,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-11-30', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 845042226,
        P_FECHA_INICIO  => TO_DATE('2022-01-24', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-01-25', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 2,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 845042226,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-01-24', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 229378074,
        P_FECHA_INICIO  => TO_DATE('2023-08-24', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-08-25', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 17,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 229378074,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-08-24', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 684344264,
        P_FECHA_INICIO  => TO_DATE('2025-01-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-01-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 6,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 684344264,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-01-16', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 330695808,
        P_FECHA_INICIO  => TO_DATE('2024-08-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-08-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 3,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 330695808,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-08-27', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 207102036,
        P_FECHA_INICIO  => TO_DATE('2023-08-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-08-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 8,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 207102036,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-08-01', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 693286551,
        P_FECHA_INICIO  => TO_DATE('2022-11-03', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-11-04', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 7,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 693286551,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-11-03', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 141130201,
        P_FECHA_INICIO  => TO_DATE('2022-12-13', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-12-14', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 9,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 141130201,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-12-13', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 681940822,
        P_FECHA_INICIO  => TO_DATE('2022-12-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-12-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 8,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 681940822,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-12-23', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 422136108,
        P_FECHA_INICIO  => TO_DATE('2024-06-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-06-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 15,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 422136108,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-06-01', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 171915407,
        P_FECHA_INICIO  => TO_DATE('2022-07-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-07-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 8,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 171915407,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-07-09', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 689180750,
        P_FECHA_INICIO  => TO_DATE('2021-12-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-12-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 14,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 689180750,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-12-23', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 166029930,
        P_FECHA_INICIO  => TO_DATE('2024-12-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-12-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 12,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 166029930,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-12-23', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 152027821,
        P_FECHA_INICIO  => TO_DATE('2024-08-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-08-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 11,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 152027821,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-08-27', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 152027821,
        P_FECHA_INICIO  => TO_DATE('2021-08-30', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-08-31', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 2,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 152027821,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-08-30', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 521785453,
        P_FECHA_INICIO  => TO_DATE('2024-04-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-04-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 16,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 521785453,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-04-16', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 229378074,
        P_FECHA_INICIO  => TO_DATE('2022-03-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-03-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 14,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 229378074,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-03-27', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 409602799,
        P_FECHA_INICIO  => TO_DATE('2022-10-06', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-10-07', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 3,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 409602799,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-10-06', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 522615465,
        P_FECHA_INICIO  => TO_DATE('2021-08-31', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-09-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 11,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 522615465,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-08-31', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 330695808,
        P_FECHA_INICIO  => TO_DATE('2023-03-19', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-20', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 17,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 330695808,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-03-19', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 229378074,
        P_FECHA_INICIO  => TO_DATE('2024-03-18', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-03-19', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 16,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 229378074,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-03-18', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 166914181,
        P_FECHA_INICIO  => TO_DATE('2022-04-11', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-04-12', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 9,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 166914181,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-04-11', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 603717373,
        P_FECHA_INICIO  => TO_DATE('2024-03-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-03-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 20,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 603717373,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-03-01', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 603717373,
        P_FECHA_INICIO  => TO_DATE('2023-04-30', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-05-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 20,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 603717373,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-04-30', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 522615465,
        P_FECHA_INICIO  => TO_DATE('2021-06-19', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-06-20', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 11,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 522615465,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-06-19', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 152803506,
        P_FECHA_INICIO  => TO_DATE('2021-11-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-11-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 18,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 152803506,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-11-16', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 681940822,
        P_FECHA_INICIO  => TO_DATE('2022-03-31', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-04-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 14,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 681940822,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-03-31', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 741468124,
        P_FECHA_INICIO  => TO_DATE('2025-02-26', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-02-27', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 9,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 741468124,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-02-26', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 547766054,
        P_FECHA_INICIO  => TO_DATE('2022-11-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-11-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 8,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 547766054,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-11-25', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 996138159,
        P_FECHA_INICIO  => TO_DATE('2024-05-18', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-05-19', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 15,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 996138159,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-05-18', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 368977860,
        P_FECHA_INICIO  => TO_DATE('2025-04-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-04-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 1,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 368977860,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-04-01', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 581583099,
        P_FECHA_INICIO  => TO_DATE('2022-11-30', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-12-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 20,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 581583099,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-11-30', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 281708811,
        P_FECHA_INICIO  => TO_DATE('2024-06-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-06-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 14,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 281708811,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-06-10', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 980585498,
        P_FECHA_INICIO  => TO_DATE('2024-07-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-07-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 980585498,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-07-14', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 985895657,
        P_FECHA_INICIO  => TO_DATE('2021-01-31', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-02-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 17,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 985895657,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-01-31', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 415813764,
        P_FECHA_INICIO  => TO_DATE('2025-02-08', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-02-09', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 2,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 415813764,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-02-08', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 619379091,
        P_FECHA_INICIO  => TO_DATE('2024-12-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-12-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 8,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 619379091,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-12-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 509200875,
        P_FECHA_INICIO  => TO_DATE('2022-12-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-12-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 18,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 509200875,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-12-10', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 698926359,
        P_FECHA_INICIO  => TO_DATE('2024-08-24', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-08-25', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 6,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 698926359,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-08-24', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 509200875,
        P_FECHA_INICIO  => TO_DATE('2022-05-31', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-06-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 7,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 509200875,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-05-31', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 110660086,
        P_FECHA_INICIO  => TO_DATE('2023-07-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-07-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 18,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 110660086,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-07-09', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 509200875,
        P_FECHA_INICIO  => TO_DATE('2024-06-12', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-06-13', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 19,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 509200875,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-06-12', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 689180750,
        P_FECHA_INICIO  => TO_DATE('2024-09-28', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-09-29', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 17,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 689180750,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-09-28', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 522615465,
        P_FECHA_INICIO  => TO_DATE('2025-01-28', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-01-29', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 7,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 522615465,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-01-28', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 422136108,
        P_FECHA_INICIO  => TO_DATE('2021-10-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-10-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 7,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 422136108,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-10-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 207102036,
        P_FECHA_INICIO  => TO_DATE('2023-10-11', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-10-12', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 9,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 207102036,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-10-11', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 128673724,
        P_FECHA_INICIO  => TO_DATE('2024-07-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-07-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 11,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 128673724,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-07-14', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 603717373,
        P_FECHA_INICIO  => TO_DATE('2021-01-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-01-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 18,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 603717373,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-01-25', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 152027821,
        P_FECHA_INICIO  => TO_DATE('2024-09-26', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-09-27', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 11,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 152027821,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-09-26', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 333194343,
        P_FECHA_INICIO  => TO_DATE('2025-06-07', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-06-08', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 8,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 333194343,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-06-07', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 741468124,
        P_FECHA_INICIO  => TO_DATE('2024-12-08', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-12-09', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 14,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 741468124,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-12-08', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 514920735,
        P_FECHA_INICIO  => TO_DATE('2025-03-31', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-04-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 16,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 514920735,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-03-31', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 412828538,
        P_FECHA_INICIO  => TO_DATE('2025-02-12', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-02-13', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 412828538,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-02-12', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 170504053,
        P_FECHA_INICIO  => TO_DATE('2025-07-11', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-07-12', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 15,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 170504053,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-07-11', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 275474416,
        P_FECHA_INICIO  => TO_DATE('2022-04-15', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-04-16', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 275474416,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-04-15', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 229378074,
        P_FECHA_INICIO  => TO_DATE('2021-02-03', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-02-04', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 19,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 229378074,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-02-03', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 415813764,
        P_FECHA_INICIO  => TO_DATE('2023-05-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-05-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 5,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 415813764,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-05-27', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 318060186,
        P_FECHA_INICIO  => TO_DATE('2023-09-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-09-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 19,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 318060186,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-09-25', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 274373492,
        P_FECHA_INICIO  => TO_DATE('2025-04-08', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-04-09', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 5,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 274373492,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-04-08', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 178165051,
        P_FECHA_INICIO  => TO_DATE('2024-08-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-08-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 11,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 178165051,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-08-23', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 318215086,
        P_FECHA_INICIO  => TO_DATE('2021-04-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-04-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 1,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 318215086,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-04-09', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 958543215,
        P_FECHA_INICIO  => TO_DATE('2023-10-30', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-10-31', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 3,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 958543215,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-10-30', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 946624902,
        P_FECHA_INICIO  => TO_DATE('2023-08-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-08-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 1,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 946624902,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-08-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 619379091,
        P_FECHA_INICIO  => TO_DATE('2023-10-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-10-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 12,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 619379091,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-10-23', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 166029930,
        P_FECHA_INICIO  => TO_DATE('2025-02-13', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-02-14', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 5,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 166029930,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-02-13', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 729094832,
        P_FECHA_INICIO  => TO_DATE('2024-08-03', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-08-04', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 5,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 729094832,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-08-03', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 628459555,
        P_FECHA_INICIO  => TO_DATE('2021-02-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-02-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 628459555,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-02-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 946624902,
        P_FECHA_INICIO  => TO_DATE('2023-02-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-02-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 16,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 946624902,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-02-23', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 140826345,
        P_FECHA_INICIO  => TO_DATE('2024-04-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-04-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 15,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 140826345,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-04-10', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 628459555,
        P_FECHA_INICIO  => TO_DATE('2025-06-19', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-06-20', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 17,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 628459555,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-06-19', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 368977860,
        P_FECHA_INICIO  => TO_DATE('2021-01-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-01-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 13,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 368977860,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-01-16', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 318060186,
        P_FECHA_INICIO  => TO_DATE('2022-09-21', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-09-22', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 15,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 318060186,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-09-21', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 946624902,
        P_FECHA_INICIO  => TO_DATE('2024-03-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-03-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 7,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 946624902,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-03-16', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 178165051,
        P_FECHA_INICIO  => TO_DATE('2022-05-04', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-05-05', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 14,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 178165051,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-05-04', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 276769385,
        P_FECHA_INICIO  => TO_DATE('2022-07-15', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-07-16', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 19,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 276769385,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-07-15', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 985895657,
        P_FECHA_INICIO  => TO_DATE('2024-06-04', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-06-05', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 1,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 985895657,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-06-04', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 318060186,
        P_FECHA_INICIO  => TO_DATE('2022-12-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-12-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 6,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 318060186,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-12-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 620735683,
        P_FECHA_INICIO  => TO_DATE('2023-08-19', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-08-20', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 20,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 620735683,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-08-19', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 946624902,
        P_FECHA_INICIO  => TO_DATE('2023-04-02', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-04-03', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 2,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 946624902,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-04-02', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 257572039,
        P_FECHA_INICIO  => TO_DATE('2022-09-12', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-09-13', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 15,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 257572039,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-09-12', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 619379091,
        P_FECHA_INICIO  => TO_DATE('2021-12-02', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-12-03', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 10,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 619379091,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-12-02', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 276769385,
        P_FECHA_INICIO  => TO_DATE('2023-03-24', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-25', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 12,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 276769385,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-03-24', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 273522987,
        P_FECHA_INICIO  => TO_DATE('2022-12-20', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-12-21', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 7,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 273522987,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-12-20', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 547766054,
        P_FECHA_INICIO  => TO_DATE('2025-04-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-04-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 7,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 547766054,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-04-09', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 729094832,
        P_FECHA_INICIO  => TO_DATE('2024-08-26', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-08-27', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 13,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 729094832,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-08-26', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 302225170,
        P_FECHA_INICIO  => TO_DATE('2023-02-21', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-02-22', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 12,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 302225170,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-02-21', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 509200875,
        P_FECHA_INICIO  => TO_DATE('2025-06-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-06-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 509200875,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-06-23', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 504874455,
        P_FECHA_INICIO  => TO_DATE('2023-07-06', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-07-07', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 16,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 504874455,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-07-06', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 588056501,
        P_FECHA_INICIO  => TO_DATE('2022-08-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-08-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 17,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 588056501,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-08-01', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 596435060,
        P_FECHA_INICIO  => TO_DATE('2024-05-12', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-05-13', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 9,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 596435060,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-05-12', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 458953161,
        P_FECHA_INICIO  => TO_DATE('2024-09-19', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-09-20', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 13,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 458953161,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-09-19', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 596435060,
        P_FECHA_INICIO  => TO_DATE('2023-03-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 14,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 596435060,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-03-01', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 810124685,
        P_FECHA_INICIO  => TO_DATE('2025-03-31', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-04-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 810124685,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-03-31', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 306191864,
        P_FECHA_INICIO  => TO_DATE('2022-06-13', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-06-14', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 10,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 306191864,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-06-13', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 178165051,
        P_FECHA_INICIO  => TO_DATE('2022-08-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-08-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 11,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 178165051,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-08-27', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 741468124,
        P_FECHA_INICIO  => TO_DATE('2025-01-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-01-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 18,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 741468124,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-01-09', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 522615465,
        P_FECHA_INICIO  => TO_DATE('2023-11-08', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-11-09', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 522615465,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-11-08', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 333194343,
        P_FECHA_INICIO  => TO_DATE('2022-09-19', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-09-20', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 1,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 333194343,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-09-19', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 644347007,
        P_FECHA_INICIO  => TO_DATE('2024-09-18', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-09-19', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 3,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 644347007,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-09-18', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 504874455,
        P_FECHA_INICIO  => TO_DATE('2021-05-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-05-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 19,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 504874455,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-05-25', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 266920089,
        P_FECHA_INICIO  => TO_DATE('2024-08-02', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-08-03', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 266920089,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-08-02', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 846613112,
        P_FECHA_INICIO  => TO_DATE('2023-01-07', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-01-08', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 20,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 846613112,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-01-07', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 729094832,
        P_FECHA_INICIO  => TO_DATE('2023-03-11', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-12', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 6,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 729094832,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-03-11', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 845042226,
        P_FECHA_INICIO  => TO_DATE('2021-02-07', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-02-08', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 11,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 845042226,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-02-07', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 521785453,
        P_FECHA_INICIO  => TO_DATE('2023-06-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-06-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 6,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 521785453,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-06-25', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 591264539,
        P_FECHA_INICIO  => TO_DATE('2024-02-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-02-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 7,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 591264539,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-02-09', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 422136108,
        P_FECHA_INICIO  => TO_DATE('2023-03-28', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-29', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 6,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 422136108,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-03-28', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 174540857,
        P_FECHA_INICIO  => TO_DATE('2021-03-20', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-03-21', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 16,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 174540857,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-03-20', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 306191864,
        P_FECHA_INICIO  => TO_DATE('2023-02-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-02-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 20,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 306191864,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-02-14', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 186564306,
        P_FECHA_INICIO  => TO_DATE('2023-03-18', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-19', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 6,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 186564306,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-03-18', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 268100269,
        P_FECHA_INICIO  => TO_DATE('2023-04-02', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-04-03', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 2,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 268100269,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-04-02', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 810124685,
        P_FECHA_INICIO  => TO_DATE('2025-05-02', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-05-03', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 19,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 810124685,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-05-02', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 975872912,
        P_FECHA_INICIO  => TO_DATE('2024-02-29', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-03-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 6,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 975872912,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-02-29', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 509200875,
        P_FECHA_INICIO  => TO_DATE('2021-09-28', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-09-29', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 2,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 509200875,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-09-28', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 318060186,
        P_FECHA_INICIO  => TO_DATE('2022-12-15', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-12-16', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 15,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 318060186,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-12-15', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 996138159,
        P_FECHA_INICIO  => TO_DATE('2021-11-20', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-11-21', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 20,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 996138159,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-11-20', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 332852533,
        P_FECHA_INICIO  => TO_DATE('2022-08-06', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-08-07', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 7,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 332852533,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-08-06', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 586505047,
        P_FECHA_INICIO  => TO_DATE('2023-06-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-06-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 6,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 586505047,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-06-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 274373492,
        P_FECHA_INICIO  => TO_DATE('2025-06-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-06-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 274373492,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-06-25', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 135883996,
        P_FECHA_INICIO  => TO_DATE('2022-01-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-01-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 17,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 135883996,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-01-01', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 522615465,
        P_FECHA_INICIO  => TO_DATE('2022-06-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-06-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 12,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 522615465,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-06-10', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 306191864,
        P_FECHA_INICIO  => TO_DATE('2022-05-13', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-05-14', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 7,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 306191864,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-05-13', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 596435060,
        P_FECHA_INICIO  => TO_DATE('2023-12-24', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-12-25', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 17,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 596435060,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-12-24', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 131324164,
        P_FECHA_INICIO  => TO_DATE('2021-04-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-04-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 8,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 131324164,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-04-25', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 883533894,
        P_FECHA_INICIO  => TO_DATE('2024-09-20', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-09-21', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 2,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 883533894,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-09-20', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 975872912,
        P_FECHA_INICIO  => TO_DATE('2023-11-30', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-12-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 2,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 975872912,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-11-30', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 521785453,
        P_FECHA_INICIO  => TO_DATE('2023-12-08', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-12-09', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 12,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 521785453,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-12-08', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 588056501,
        P_FECHA_INICIO  => TO_DATE('2024-05-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-05-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 588056501,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-05-23', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 628459555,
        P_FECHA_INICIO  => TO_DATE('2021-11-29', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-11-30', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 18,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 628459555,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-11-29', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 996138159,
        P_FECHA_INICIO  => TO_DATE('2024-04-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-04-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 996138159,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-04-27', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 410932524,
        P_FECHA_INICIO  => TO_DATE('2024-10-20', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-10-21', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 7,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 410932524,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-10-20', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 207102036,
        P_FECHA_INICIO  => TO_DATE('2023-01-04', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-01-05', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 16,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 207102036,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-01-04', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 270748411,
        P_FECHA_INICIO  => TO_DATE('2022-06-22', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-06-23', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 18,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 270748411,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-06-22', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 395524404,
        P_FECHA_INICIO  => TO_DATE('2024-02-07', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-02-08', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 19,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 395524404,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-02-07', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 941779996,
        P_FECHA_INICIO  => TO_DATE('2025-07-08', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-07-09', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 18,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 941779996,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-07-08', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 996138159,
        P_FECHA_INICIO  => TO_DATE('2023-04-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-04-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 6,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 996138159,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-04-01', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 596435060,
        P_FECHA_INICIO  => TO_DATE('2024-02-06', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-02-07', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 15,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 596435060,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-02-06', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 303954090,
        P_FECHA_INICIO  => TO_DATE('2024-10-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-10-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 4,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 303954090,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-10-14', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 946624902,
        P_FECHA_INICIO  => TO_DATE('2022-03-22', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-03-23', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 12,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 946624902,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-03-22', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 509200875,
        P_FECHA_INICIO  => TO_DATE('2021-06-18', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-06-19', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 16,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 509200875,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-06-18', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 619379091,
        P_FECHA_INICIO  => TO_DATE('2024-10-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-10-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 10,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 619379091,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-10-10', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 110660086,
        P_FECHA_INICIO  => TO_DATE('2024-03-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-03-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 1,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 110660086,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-03-10', 'YYYY-MM-DD')
    );
END;