BEGIN

    INSERTAR_RESERVA(
        P_CEDULA        => 1233,
        P_FECHA_INICIO  => TO_DATE('2024-10-07', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-10-08', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 44,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 1233,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-10-07', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 8977,
        P_FECHA_INICIO  => TO_DATE('2023-06-28', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-06-29', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 49,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 8977,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-06-28', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 100720929,
        P_FECHA_INICIO  => TO_DATE('2021-08-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-08-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 45,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 100720929,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-08-09', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 101184172,
        P_FECHA_INICIO  => TO_DATE('2024-07-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-07-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 34,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 101184172,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-07-16', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 107012411,
        P_FECHA_INICIO  => TO_DATE('2024-09-20', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-09-21', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 48,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 107012411,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-09-20', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 117800906,
        P_FECHA_INICIO  => TO_DATE('2023-02-07', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-02-08', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 49,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 117800906,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-02-07', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 126071820,
        P_FECHA_INICIO  => TO_DATE('2023-04-28', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-04-29', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 39,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 126071820,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-04-28', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 127615389,
        P_FECHA_INICIO  => TO_DATE('2022-05-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-05-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 44,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 127615389,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-05-16', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 150458075,
        P_FECHA_INICIO  => TO_DATE('2025-03-11', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-03-12', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 150458075,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-03-11', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 168892908,
        P_FECHA_INICIO  => TO_DATE('2022-07-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-07-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 32,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 168892908,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-07-09', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 172289365,
        P_FECHA_INICIO  => TO_DATE('2023-11-30', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-12-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 41,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 172289365,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-11-30', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 172636412,
        P_FECHA_INICIO  => TO_DATE('2023-04-03', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-04-04', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 32,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 172636412,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-04-03', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 200929268,
        P_FECHA_INICIO  => TO_DATE('2022-09-04', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-09-05', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 29,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 200929268,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-09-04', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 206105620,
        P_FECHA_INICIO  => TO_DATE('2023-12-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-12-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 37,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 206105620,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-12-09', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 228573924,
        P_FECHA_INICIO  => TO_DATE('2021-06-02', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-06-03', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 32,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 228573924,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-06-02', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 231570267,
        P_FECHA_INICIO  => TO_DATE('2024-10-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-10-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 47,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 231570267,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-10-01', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 251052244,
        P_FECHA_INICIO  => TO_DATE('2024-01-30', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-01-31', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 46,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 251052244,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-01-30', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 258973738,
        P_FECHA_INICIO  => TO_DATE('2021-02-13', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-02-14', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 34,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 258973738,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-02-13', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 263338238,
        P_FECHA_INICIO  => TO_DATE('2022-11-05', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-11-06', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 43,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 263338238,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-11-05', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 279820816,
        P_FECHA_INICIO  => TO_DATE('2021-03-08', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-03-09', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 35,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 279820816,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-03-08', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 282525601,
        P_FECHA_INICIO  => TO_DATE('2025-03-21', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-03-22', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 30,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 282525601,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-03-21', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 294637478,
        P_FECHA_INICIO  => TO_DATE('2024-08-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-08-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 38,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 294637478,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-08-10', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 295601898,
        P_FECHA_INICIO  => TO_DATE('2023-10-12', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-10-13', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 45,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 295601898,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-10-12', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 307642952,
        P_FECHA_INICIO  => TO_DATE('2022-04-20', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-04-21', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 39,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 307642952,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-04-20', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 307733583,
        P_FECHA_INICIO  => TO_DATE('2023-07-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-07-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 307733583,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-07-16', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 313558389,
        P_FECHA_INICIO  => TO_DATE('2022-06-07', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-06-08', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 313558389,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-06-07', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 333103311,
        P_FECHA_INICIO  => TO_DATE('2025-06-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-06-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 47,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 333103311,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-06-10', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 361583191,
        P_FECHA_INICIO  => TO_DATE('2024-10-13', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-10-14', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 39,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 361583191,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-10-13', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 370284113,
        P_FECHA_INICIO  => TO_DATE('2021-10-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-10-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 42,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 370284113,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-10-01', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 382958402,
        P_FECHA_INICIO  => TO_DATE('2023-08-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-08-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 38,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 382958402,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-08-09', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 384284384,
        P_FECHA_INICIO  => TO_DATE('2021-07-17', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-07-18', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 37,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 384284384,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-07-17', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 390660266,
        P_FECHA_INICIO  => TO_DATE('2025-06-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-06-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 47,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 390660266,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-06-09', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 392877776,
        P_FECHA_INICIO  => TO_DATE('2025-05-26', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-05-27', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 37,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 392877776,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-05-26', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 393032943,
        P_FECHA_INICIO  => TO_DATE('2024-04-21', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-04-22', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 42,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 393032943,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-04-21', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 412955229,
        P_FECHA_INICIO  => TO_DATE('2023-03-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 39,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 412955229,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-03-16', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 414917884,
        P_FECHA_INICIO  => TO_DATE('2024-04-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-04-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 49,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 414917884,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-04-16', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 421421812,
        P_FECHA_INICIO  => TO_DATE('2024-12-29', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-12-30', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 42,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 421421812,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-12-29', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 425275190,
        P_FECHA_INICIO  => TO_DATE('2025-05-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-05-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 42,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 425275190,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-05-01', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 455303095,
        P_FECHA_INICIO  => TO_DATE('2021-05-02', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-05-03', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 31,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 455303095,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-05-02', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 458830987,
        P_FECHA_INICIO  => TO_DATE('2021-12-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-12-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 31,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 458830987,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-12-10', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 464654263,
        P_FECHA_INICIO  => TO_DATE('2025-03-07', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-03-08', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 464654263,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-03-07', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 468777336,
        P_FECHA_INICIO  => TO_DATE('2022-02-12', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-02-13', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 50,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 468777336,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-02-12', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 470825378,
        P_FECHA_INICIO  => TO_DATE('2025-03-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-03-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 44,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 470825378,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-03-25', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 495330799,
        P_FECHA_INICIO  => TO_DATE('2024-10-12', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-10-13', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 49,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 495330799,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-10-12', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 512379497,
        P_FECHA_INICIO  => TO_DATE('2024-06-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-06-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 512379497,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-06-14', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 512614737,
        P_FECHA_INICIO  => TO_DATE('2025-07-13', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-07-14', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 50,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 512614737,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-07-13', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 513336799,
        P_FECHA_INICIO  => TO_DATE('2022-07-09', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-07-10', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 34,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 513336799,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-07-09', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 517075373,
        P_FECHA_INICIO  => TO_DATE('2023-11-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-11-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 49,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 517075373,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-11-23', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 518506875,
        P_FECHA_INICIO  => TO_DATE('2025-03-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-03-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 42,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 518506875,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-03-10', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 526397666,
        P_FECHA_INICIO  => TO_DATE('2021-04-04', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-04-05', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 43,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 526397666,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-04-04', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 540317711,
        P_FECHA_INICIO  => TO_DATE('2024-08-26', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-08-27', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 35,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 540317711,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-08-26', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 547568084,
        P_FECHA_INICIO  => TO_DATE('2023-10-31', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-11-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 47,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 547568084,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-10-31', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 549319113,
        P_FECHA_INICIO  => TO_DATE('2025-06-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-06-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 44,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 549319113,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-06-10', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 578195086,
        P_FECHA_INICIO  => TO_DATE('2024-03-29', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-03-30', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 46,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 578195086,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-03-29', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 588379629,
        P_FECHA_INICIO  => TO_DATE('2023-02-28', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 41,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 588379629,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-02-28', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 604470872,
        P_FECHA_INICIO  => TO_DATE('2025-02-21', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-02-22', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 45,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 604470872,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-02-21', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 608610147,
        P_FECHA_INICIO  => TO_DATE('2022-12-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-12-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 39,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 608610147,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-12-14', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 639676732,
        P_FECHA_INICIO  => TO_DATE('2024-06-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-06-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 48,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 639676732,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-06-16', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 644631577,
        P_FECHA_INICIO  => TO_DATE('2023-04-02', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-04-03', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 38,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 644631577,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-04-02', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 646632159,
        P_FECHA_INICIO  => TO_DATE('2024-01-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-01-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 44,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 646632159,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-01-01', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 647869657,
        P_FECHA_INICIO  => TO_DATE('2023-12-03', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-12-04', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 37,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 647869657,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-12-03', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 656294783,
        P_FECHA_INICIO  => TO_DATE('2023-05-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-05-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 30,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 656294783,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-05-10', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 663142039,
        P_FECHA_INICIO  => TO_DATE('2022-02-02', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-02-03', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 36,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 663142039,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-02-02', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 678203186,
        P_FECHA_INICIO  => TO_DATE('2025-04-18', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-04-19', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 31,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 678203186,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-04-18', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 686451399,
        P_FECHA_INICIO  => TO_DATE('2024-05-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-05-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 43,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 686451399,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-05-14', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 686817640,
        P_FECHA_INICIO  => TO_DATE('2023-08-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-08-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 45,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 686817640,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-08-14', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 698520993,
        P_FECHA_INICIO  => TO_DATE('2022-06-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-06-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 36,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 698520993,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-06-27', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 700277679,
        P_FECHA_INICIO  => TO_DATE('2024-01-08', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-01-09', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 46,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 700277679,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-01-08', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 705506419,
        P_FECHA_INICIO  => TO_DATE('2021-10-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-10-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 705506419,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-10-14', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 714728004,
        P_FECHA_INICIO  => TO_DATE('2022-04-15', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-04-16', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 32,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 714728004,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-04-15', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 719058288,
        P_FECHA_INICIO  => TO_DATE('2024-05-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-05-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 48,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 719058288,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-05-27', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 725406015,
        P_FECHA_INICIO  => TO_DATE('2021-04-19', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-04-20', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 31,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 725406015,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-04-19', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 729714143,
        P_FECHA_INICIO  => TO_DATE('2021-10-26', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-10-27', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 48,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 729714143,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-10-26', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 739771731,
        P_FECHA_INICIO  => TO_DATE('2024-02-28', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-02-29', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 35,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 739771731,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-02-28', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 762585116,
        P_FECHA_INICIO  => TO_DATE('2023-03-24', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-03-25', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 50,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 762585116,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-03-24', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 773355823,
        P_FECHA_INICIO  => TO_DATE('2024-12-04', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-12-05', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 28,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 773355823,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-12-04', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 773857006,
        P_FECHA_INICIO  => TO_DATE('2025-03-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2025-03-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 37,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 9,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 773857006,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2025-03-01', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 776305873,
        P_FECHA_INICIO  => TO_DATE('2022-09-27', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-09-28', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 29,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 776305873,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-09-27', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 778822025,
        P_FECHA_INICIO  => TO_DATE('2024-05-14', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-05-15', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 42,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 778822025,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-05-14', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 791453213,
        P_FECHA_INICIO  => TO_DATE('2021-05-06', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-05-07', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 50,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 791453213,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-05-06', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 809323991,
        P_FECHA_INICIO  => TO_DATE('2021-07-07', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-07-08', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 7,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 809323991,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-07-07', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 827919175,
        P_FECHA_INICIO  => TO_DATE('2023-06-11', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-06-12', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 39,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 6,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 827919175,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-06-11', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 838994395,
        P_FECHA_INICIO  => TO_DATE('2023-01-05', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-01-06', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 48,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 838994395,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-01-05', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 839255961,
        P_FECHA_INICIO  => TO_DATE('2023-05-24', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-05-25', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 42,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 839255961,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-05-24', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 859267116,
        P_FECHA_INICIO  => TO_DATE('2022-05-26', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-05-27', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 29,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 859267116,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-05-26', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 859929290,
        P_FECHA_INICIO  => TO_DATE('2022-03-21', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-03-22', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 859929290,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-03-21', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 861737131,
        P_FECHA_INICIO  => TO_DATE('2024-05-16', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-05-17', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 861737131,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-05-16', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 871456311,
        P_FECHA_INICIO  => TO_DATE('2022-11-11', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-11-12', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 38,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 871456311,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-11-11', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 891145927,
        P_FECHA_INICIO  => TO_DATE('2021-05-04', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-05-05', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 891145927,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-05-04', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 892703626,
        P_FECHA_INICIO  => TO_DATE('2021-02-01', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-02-02', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 30,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 892703626,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-02-01', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 895265240,
        P_FECHA_INICIO  => TO_DATE('2021-10-07', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-10-08', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 33,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 895265240,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-10-07', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 904272193,
        P_FECHA_INICIO  => TO_DATE('2023-06-06', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-06-07', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 45,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 5,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 904272193,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-06-06', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 920143463,
        P_FECHA_INICIO  => TO_DATE('2021-10-24', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-10-25', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 50,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 920143463,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-10-24', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 929196802,
        P_FECHA_INICIO  => TO_DATE('2023-08-13', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-08-14', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 30,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 929196802,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-08-13', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 931116401,
        P_FECHA_INICIO  => TO_DATE('2022-02-13', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-02-14', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 49,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 4,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 931116401,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-02-13', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 974285648,
        P_FECHA_INICIO  => TO_DATE('2021-03-25', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-03-26', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 35,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 8,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 974285648,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-03-25', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 974922647,
        P_FECHA_INICIO  => TO_DATE('2024-04-10', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-04-11', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 40,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 974922647,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-04-10', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 978083325,
        P_FECHA_INICIO  => TO_DATE('2021-04-30', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-05-01', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 47,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 978083325,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-04-30', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 989693745,
        P_FECHA_INICIO  => TO_DATE('2023-01-23', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2023-01-24', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 35,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 989693745,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2023-01-23', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 991546843,
        P_FECHA_INICIO  => TO_DATE('2024-11-21', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2024-11-22', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 41,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 2,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 991546843,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2024-11-21', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 996087457,
        P_FECHA_INICIO  => TO_DATE('2021-08-08', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2021-08-09', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 50,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 10,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 996087457,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2021-08-08', 'YYYY-MM-DD')
    );

    INSERTAR_RESERVA(
        P_CEDULA        => 999418637,
        P_FECHA_INICIO  => TO_DATE('2022-01-22', 'YYYY-MM-DD'),
        P_FECHA_FIN     => TO_DATE('2022-01-23', 'YYYY-MM-DD'),
        P_ID_INSTALACION => 34,
        ID_ESTADO       => 3,
        P_NUM_PERSONAS  => 3,
        P_HORA_FIN      => TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
        P_HORA_INICIO   => TO_TIMESTAMP('10:00:00', 'HH24:MI:SS')
    );

    EJECUTAR_CARRITO(
        P_CEDULA        => 999418637,
        P_METODO_PAGO   => 1,
        FECHA           => TO_DATE('2022-01-22', 'YYYY-MM-DD')
    );

END;