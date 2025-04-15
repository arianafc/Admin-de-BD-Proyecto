BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 1233,
        P_FECHA_INICIO  => TO_DATE('2021-06-11', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-06-12', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 45,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 1233,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-06-11', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 8977,
        P_FECHA_INICIO  => TO_DATE('2021-08-22', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-08-23', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 28,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 8977,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-08-22', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 100720929,
        P_FECHA_INICIO  => TO_DATE('2021-10-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-10-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 39,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 100720929,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-10-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 101184172,
        P_FECHA_INICIO  => TO_DATE('2025-03-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-03-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 51,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 101184172,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-03-10', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 107012411,
        P_FECHA_INICIO  => TO_DATE('2022-11-24', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-11-25', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 46,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 107012411,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-11-24', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 117800906,
        P_FECHA_INICIO  => TO_DATE('2022-02-20', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-02-21', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 51,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 117800906,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-02-20', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 126071820,
        P_FECHA_INICIO  => TO_DATE('2022-04-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-04-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 29,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 126071820,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-04-14', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 127615389,
        P_FECHA_INICIO  => TO_DATE('2022-05-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-05-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 32,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 127615389,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-05-09', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 150458075,
        P_FECHA_INICIO  => TO_DATE('2024-10-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-10-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 32,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 150458075,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-10-14', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 168892908,
        P_FECHA_INICIO  => TO_DATE('2022-11-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-11-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 43,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 168892908,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-11-09', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 172289365,
        P_FECHA_INICIO  => TO_DATE('2024-12-15', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-12-16', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 47,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 172289365,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-12-15', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 172636412,
        P_FECHA_INICIO  => TO_DATE('2022-09-04', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-09-05', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 39,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 172636412,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-09-04', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 200929268,
        P_FECHA_INICIO  => TO_DATE('2024-05-12', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-05-13', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 42,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 200929268,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-05-12', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 206105620,
        P_FECHA_INICIO  => TO_DATE('2021-07-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-07-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 37,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 206105620,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-07-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 228573924,
        P_FECHA_INICIO  => TO_DATE('2023-11-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-11-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 51,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 228573924,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-11-25', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 231570267,
        P_FECHA_INICIO  => TO_DATE('2023-03-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 29,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 231570267,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-03-16', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 251052244,
        P_FECHA_INICIO  => TO_DATE('2021-12-26', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-12-27', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 38,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 251052244,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-12-26', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 258973738,
        P_FECHA_INICIO  => TO_DATE('2023-09-11', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-09-12', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 36,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 258973738,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-09-11', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 263338238,
        P_FECHA_INICIO  => TO_DATE('2025-01-28', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-01-29', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 28,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 263338238,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-01-28', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 279820816,
        P_FECHA_INICIO  => TO_DATE('2021-04-03', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-04-04', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 35,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 279820816,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-04-03', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 282525601,
        P_FECHA_INICIO  => TO_DATE('2024-01-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-01-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 43,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 282525601,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-01-25', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 294637478,
        P_FECHA_INICIO  => TO_DATE('2024-08-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-08-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 50,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 294637478,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-08-27', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 295601898,
        P_FECHA_INICIO  => TO_DATE('2024-12-29', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-12-30', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 31,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 295601898,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-12-29', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 307642952,
        P_FECHA_INICIO  => TO_DATE('2021-06-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-06-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 45,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 307642952,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-06-09', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 307733583,
        P_FECHA_INICIO  => TO_DATE('2024-03-02', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-03-03', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 32,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 307733583,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-03-02', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 313558389,
        P_FECHA_INICIO  => TO_DATE('2023-09-08', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-09-09', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 40,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 313558389,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-09-08', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 333103311,
        P_FECHA_INICIO  => TO_DATE('2022-09-20', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-09-21', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 45,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 333103311,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-09-20', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 361583191,
        P_FECHA_INICIO  => TO_DATE('2024-03-24', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-03-25', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 28,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 361583191,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-03-24', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 370284113,
        P_FECHA_INICIO  => TO_DATE('2022-08-24', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-08-25', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 43,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 370284113,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-08-24', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 382958402,
        P_FECHA_INICIO  => TO_DATE('2023-06-02', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-06-03', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 45,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 382958402,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-06-02', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 384284384,
        P_FECHA_INICIO  => TO_DATE('2023-01-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-01-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 46,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 384284384,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-01-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 390660266,
        P_FECHA_INICIO  => TO_DATE('2023-09-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-09-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 28,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 390660266,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-09-25', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 392877776,
        P_FECHA_INICIO  => TO_DATE('2024-10-30', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-10-31', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 40,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 392877776,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-10-30', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 393032943,
        P_FECHA_INICIO  => TO_DATE('2023-05-22', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-05-23', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 46,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 393032943,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-05-22', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 412955229,
        P_FECHA_INICIO  => TO_DATE('2024-03-05', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-03-06', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 38,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 412955229,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-03-05', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 414917884,
        P_FECHA_INICIO  => TO_DATE('2025-04-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-04-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 37,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 414917884,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-04-16', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 421421812,
        P_FECHA_INICIO  => TO_DATE('2021-08-24', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-08-25', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 30,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 421421812,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-08-24', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 425275190,
        P_FECHA_INICIO  => TO_DATE('2024-10-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-10-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 425275190,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-10-23', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 455303095,
        P_FECHA_INICIO  => TO_DATE('2021-10-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-10-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 29,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 455303095,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-10-27', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 458830987,
        P_FECHA_INICIO  => TO_DATE('2024-11-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-11-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 35,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 458830987,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-11-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 464654263,
        P_FECHA_INICIO  => TO_DATE('2023-10-21', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-10-22', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 45,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 464654263,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-10-21', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 468777336,
        P_FECHA_INICIO  => TO_DATE('2024-07-05', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-07-06', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 29,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 468777336,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-07-05', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 470825378,
        P_FECHA_INICIO  => TO_DATE('2024-06-21', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-06-22', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 28,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 470825378,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-06-21', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 495330799,
        P_FECHA_INICIO  => TO_DATE('2022-03-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-03-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 495330799,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-03-09', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 512379497,
        P_FECHA_INICIO  => TO_DATE('2024-02-02', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-02-03', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 40,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 512379497,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-02-02', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 512614737,
        P_FECHA_INICIO  => TO_DATE('2024-10-22', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-10-23', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 39,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 512614737,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-10-22', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 513336799,
        P_FECHA_INICIO  => TO_DATE('2021-05-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-05-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 513336799,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-05-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 517075373,
        P_FECHA_INICIO  => TO_DATE('2022-11-21', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-11-22', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 517075373,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-11-21', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 518506875,
        P_FECHA_INICIO  => TO_DATE('2022-06-30', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-07-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 32,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 518506875,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-06-30', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 526397666,
        P_FECHA_INICIO  => TO_DATE('2022-11-05', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-11-06', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 44,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 526397666,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-11-05', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 540317711,
        P_FECHA_INICIO  => TO_DATE('2022-12-15', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-12-16', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 43,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 540317711,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-12-15', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 547568084,
        P_FECHA_INICIO  => TO_DATE('2022-06-28', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-06-29', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 41,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 547568084,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-06-28', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 549319113,
        P_FECHA_INICIO  => TO_DATE('2024-08-29', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-08-30', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 28,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 549319113,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-08-29', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 578195086,
        P_FECHA_INICIO  => TO_DATE('2022-03-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-03-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 43,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 578195086,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-03-16', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 588379629,
        P_FECHA_INICIO  => TO_DATE('2023-08-26', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-08-27', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 45,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 588379629,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-08-26', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 604470872,
        P_FECHA_INICIO  => TO_DATE('2022-04-06', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-04-07', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 50,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 604470872,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-04-06', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 608610147,
        P_FECHA_INICIO  => TO_DATE('2022-01-11', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-01-12', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 28,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 608610147,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-01-11', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 639676732,
        P_FECHA_INICIO  => TO_DATE('2024-07-18', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-07-19', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 51,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 639676732,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-07-18', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 644631577,
        P_FECHA_INICIO  => TO_DATE('2023-10-18', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-10-19', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 36,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 644631577,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-10-18', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 646632159,
        P_FECHA_INICIO  => TO_DATE('2023-11-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-11-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 47,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 646632159,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-11-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 647869657,
        P_FECHA_INICIO  => TO_DATE('2023-07-08', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-07-09', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 44,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 647869657,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-07-08', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 656294783,
        P_FECHA_INICIO  => TO_DATE('2021-11-30', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-12-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 45,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 656294783,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-11-30', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 663142039,
        P_FECHA_INICIO  => TO_DATE('2021-01-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-01-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 31,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 663142039,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-01-23', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 678203186,
        P_FECHA_INICIO  => TO_DATE('2024-02-11', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-02-12', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 50,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 678203186,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-02-11', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 686451399,
        P_FECHA_INICIO  => TO_DATE('2024-01-13', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-01-14', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 49,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 686451399,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-01-13', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 686817640,
        P_FECHA_INICIO  => TO_DATE('2023-07-18', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-07-19', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 48,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 686817640,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-07-18', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 698520993,
        P_FECHA_INICIO  => TO_DATE('2021-03-15', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-03-16', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 43,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 698520993,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-03-15', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 700277679,
        P_FECHA_INICIO  => TO_DATE('2021-09-06', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-09-07', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 46,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 700277679,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-09-06', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 705506419,
        P_FECHA_INICIO  => TO_DATE('2023-03-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 42,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 705506419,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-03-27', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 714728004,
        P_FECHA_INICIO  => TO_DATE('2025-06-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-06-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 38,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 714728004,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-06-16', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 719058288,
        P_FECHA_INICIO  => TO_DATE('2021-09-08', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-09-09', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 49,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 719058288,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-09-08', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 725406015,
        P_FECHA_INICIO  => TO_DATE('2022-03-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-03-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 45,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 725406015,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-03-01', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 729714143,
        P_FECHA_INICIO  => TO_DATE('2023-11-12', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-11-13', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 36,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 729714143,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-11-12', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 739771731,
        P_FECHA_INICIO  => TO_DATE('2021-05-29', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-05-30', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 47,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 739771731,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-05-29', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 762585116,
        P_FECHA_INICIO  => TO_DATE('2024-04-08', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-04-09', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 32,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 762585116,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-04-08', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 773355823,
        P_FECHA_INICIO  => TO_DATE('2021-10-22', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-10-23', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 37,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 773355823,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-10-22', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 773857006,
        P_FECHA_INICIO  => TO_DATE('2022-06-05', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-06-06', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 46,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 773857006,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-06-05', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 776305873,
        P_FECHA_INICIO  => TO_DATE('2023-10-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-10-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 28,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 776305873,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-10-01', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 778822025,
        P_FECHA_INICIO  => TO_DATE('2023-03-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 32,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 778822025,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-03-01', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 791453213,
        P_FECHA_INICIO  => TO_DATE('2024-06-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-06-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 42,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 791453213,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-06-23', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 809323991,
        P_FECHA_INICIO  => TO_DATE('2021-12-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-12-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 31,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 809323991,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-12-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 827919175,
        P_FECHA_INICIO  => TO_DATE('2024-08-21', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-08-22', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 37,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 827919175,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-08-21', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 838994395,
        P_FECHA_INICIO  => TO_DATE('2023-06-04', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-06-05', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 40,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 838994395,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-06-04', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 839255961,
        P_FECHA_INICIO  => TO_DATE('2022-06-21', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-06-22', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 38,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 839255961,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-06-21', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 859267116,
        P_FECHA_INICIO  => TO_DATE('2022-05-04', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-05-05', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 44,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 859267116,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-05-04', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 859929290,
        P_FECHA_INICIO  => TO_DATE('2024-05-05', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-05-06', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 38,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 859929290,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-05-05', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 861737131,
        P_FECHA_INICIO  => TO_DATE('2022-12-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-12-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 40,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 861737131,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-12-01', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 871456311,
        P_FECHA_INICIO  => TO_DATE('2024-07-07', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-07-08', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 40,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 871456311,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-07-07', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 891145927,
        P_FECHA_INICIO  => TO_DATE('2022-02-07', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-02-08', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 51,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 891145927,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-02-07', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 892703626,
        P_FECHA_INICIO  => TO_DATE('2023-03-24', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-25', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 32,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 892703626,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-03-24', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 895265240,
        P_FECHA_INICIO  => TO_DATE('2021-06-19', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-06-20', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 48,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 895265240,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-06-19', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 904272193,
        P_FECHA_INICIO  => TO_DATE('2023-06-29', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-06-30', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 36,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 904272193,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-06-29', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 920143463,
        P_FECHA_INICIO  => TO_DATE('2024-01-12', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-01-13', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 30,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 920143463,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-01-12', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 929196802,
        P_FECHA_INICIO  => TO_DATE('2024-02-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-02-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 32,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 929196802,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-02-14', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 931116401,
        P_FECHA_INICIO  => TO_DATE('2022-05-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-05-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 32,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 931116401,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-05-14', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 974285648,
        P_FECHA_INICIO  => TO_DATE('2023-08-07', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-08-08', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 43,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 974285648,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-08-07', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 974922647,
        P_FECHA_INICIO  => TO_DATE('2022-04-18', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-04-19', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 28,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 974922647,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-04-18', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 978083325,
        P_FECHA_INICIO  => TO_DATE('2023-02-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-02-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 34,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 978083325,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-02-25', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 989693745,
        P_FECHA_INICIO  => TO_DATE('2023-03-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 29,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 989693745,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-03-25', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 991546843,
        P_FECHA_INICIO  => TO_DATE('2022-05-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-05-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 46,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 991546843,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-05-17', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 996087457,
        P_FECHA_INICIO  => TO_DATE('2022-08-22', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-08-23', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 31,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 996087457,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-08-22', 'YYYY-MM-DD')
    );
END;

BEGIN
    INSERTAR_RESERVA(
        P_CEDULA        => 999418637,
        P_FECHA_INICIO  => TO_DATE('2022-09-26', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-09-27', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 40,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );
END;

BEGIN
    EJECUTAR_CARRITO(
        P_CEDULA        => 999418637,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-09-26', 'YYYY-MM-DD')
    );
END;