INSERT INTO Cliente VALUES
(9844, 'Renato', 'Cuadrado', 'Av. Larco Herrera', '987654321', 'rcuadr2@gmail.com'),
(9846, 'Carlos', 'Ramos', 'Av. La Marina 456', '988776655', 'cramos@hotmail.com'),
(9847, 'Lucía', 'Mejía', 'Calle Los Álamos 789', '977665544', 'lmejia@yahoo.com'),
(6388, 'Andrés', 'Salazar', 'Av. Primavera 234', '987123456', 'asalazar@gmail.com'),
(7463, 'María', 'Lopez', 'Jr. Los Olivos 567', '986543210', 'mlopez@hotmail.com'),
(9850, 'Jorge', 'Perez', 'Av. Angamos Este 890', '987654321', 'jperez@yahoo.com'),
(6248, 'Diana', 'Rojas', 'Calle Los Cedros 345', '976543219', 'drojas@gmail.com'),
(2856, 'Pablo', 'Ramírez', 'Jr. Las Magnolias 678', '985432167', 'pramirez@gmail.com'),
(7318, 'Ana', 'Gómez', 'Av. San Felipe 910', '984321098', 'agomez@gmail.com');

INSERT INTO Encargado VALUES
(10001, 'Luis Sánchez', '12345678'),
(10002, 'Marta Pérez', '87654321'),
(10003, 'Carlos Ramírez', '56781234'),
(10004, 'Ana Palacios', '43218765'),
(10005, 'Sofía Mechara', '34567812'),
(10006, 'Enzo Fernández', '12348765'),
(10007, 'Gabriel Torres', '56784321'),
(10008, 'Mariana Flores', '87651234'),
(10009, 'Javier Ortega', '43215678'),
(10010, 'Fiorella Portella', '726515690'),
(10011, 'Mariana Ortega', '72654088');

INSERT INTO Motorizado VALUES
(10325, 'Alex Puerto', '959753468', 'Recepcion'),
(11520, 'Jose Monte', '965423781', 'Disponible'),
(11345, 'Maria Valqui', '951357842', 'Ausente'),
(12345, 'Ramon Vergara', '963215487', 'Recepcion'),
(13548, 'Roberto Checa', '968875324', 'Transportando'),
(14758, 'Mirio Morilla', '998865742', 'Disponible'),
(19876, 'Rodrigo Vera', '987763541', 'Transportando'),
(21354, 'Micaela Alva', '913547682', 'Transportando'),
(21657, 'Abel Carte', '936325412', 'Disponible'),
(23564, 'Nero Alfen', '910235404', 'Recepcion');

INSERT INTO Municipalidad VALUES
(15086, 'Municipalidad de San Miguel', 'San Miguel'),
(15076, 'Municipalidad de Magdalena del Mar', 'Magdalena del Mar'),
(15084, 'Municipalidad de Pueblo Libre', 'Pueblo Libre'),
(15072, 'Municipalidad de Jesús María', 'Jesús María'),
(7016, 'Municipalidad de Bellavista', 'Bellavista');

INSERT INTO Proveedor VALUES
(1, 'Julio', 'Soteldo', '920349184', 'Calle Córdova 275', 15076),
(2, 'Beatriz', 'Otiniano', '923214040', 'Av. Ejército 550', 15076),
(3, 'Jorge', 'Lopez', '998765432', 'Av. La Marina 1234', 15086),
(4, 'Roberto', 'Fernandez', '976543219', 'Calle Mantaro 456', 15086),
(5, 'Miguel', 'Salazar', '965432109', 'Av. Bolívar 678', 15084),
(6, 'Haydee', 'Ramirez', '956789432', 'Calle María Parado de Bellido 123', 15084),
(7, 'Lucia', 'Gomez', '912345678', 'Av. Salaverry 2345', 15072),
(8, 'Jordan', 'Rojas', '956789432', 'Jr. Nazca 456', 15072),
(9, 'Ana', 'Torres', '983203329', 'Av. Óscar R. Benavides 789', 7016),
(10, 'Elena', 'Perez', '932130394', 'Jr. Adolfo King 321', 7016);

INSERT INTO Producto VALUES
(180, 'Emoliente', '2024-01-02', '2024-01-05'),
(181, 'Emoliente', '2024-02-06', '2024-02-09'),
(182, 'Emoliente', '2024-02-10', '2024-02-13'),
(183, 'Emoliente', '2024-03-25', '2024-03-28'),
(184, 'Emoliente', '2024-04-08', '2024-04-11'),
(185, 'Emoliente', '2024-06-17', '2024-06-20'), 
(186, 'Emoliente', '2024-06-22', '2024-06-25'),
(187, 'Emoliente', '2024-07-15', '2024-07-18'),
(188, 'Emoliente', '2024-08-04', '2024-08-07'),
(189, 'Emoliente', '2024-10-09', '2024-10-12'),
(190, 'Emoliente', '2024-10-26', '2024-10-29'),
(191, 'Emoliente', '2024-11-02', '2024-11-05'),
(192, 'Emoliente', '2024-11-15', '2024-11-18'),
(193, 'Emoliente', '2024-11-20', '2024-11-23'),
(194, 'Pan con pollo', '2024-12-17', '2024-12-20'),
(195, 'Emoliente', '2024-12-25', '2024-12-28'),
(196, 'Pan con chicharron', '2024-12-29', '2024-12-31');

INSERT INTO Producto_Proveedor VALUES
(180, 1, 12), 
(181, 2, 5), 
(182, 3, 4), 
(183, 4, 1), 
(184, 5, 8), 
(185, 6, 2), 
(186, 7, 9), 
(187, 8, 7), 
(188, 9, 7);

INSERT INTO Tipo_Pago VALUES
(1, 'Efectivo'),
(2, 'Tarjeta de crédito'),
(3, 'Yape'),
(4, 'Plin');

INSERT INTO Orden_Pedido VALUES
(149, '2024-01-02', '13:05', 'Entregado', 9844, 10325, 1),
(150, '2024-02-06', '9:43', 'En proceso', 9846, 11520, 1),
(151, '2024-02-10', '10:18', 'En proceso', 9847, 11345, 2),
(152, '2024-03-25', '12:26', 'Entregado', 6388, 12345, 1),
(153, '2024-04-08', '15:37', 'En proceso', 7463, 13548, 1),
(154, '2024-06-17', '14:33', 'En proceso', 9850, 14758, 2),
(155, '2024-07-15', '11:43', 'En proceso', 6248, 19876, 1),
(156, '2024-08-04', '7:01', 'En proceso', 2856, 21354, 1),
(157, '2024-10-09', '8:47', 'En proceso', 7318, 21657, 3);

INSERT INTO Orden_Pedido_Producto VALUES
(149, 180, 120, 9), 
(150, 181, 103, 4), 
(151, 182, 25, 5), 
(152, 183, 13, 1), 
(153, 184, 32, 4), 
(154, 185, 15, 8), 
(155, 186, 84, 2), 
(156, 187, 19, 2), 
(157, 188, 168, 7);

INSERT INTO Puesto_Emoliente VALUES
(1, '6:00-10:00', 'Parque Leoncio Prado', 'Activo', 15076, 10001),
(2, '6:00-9:00', 'Mercado de Magdalena', 'Activo', 15076, 10002),
(3, '18:00-22:00', 'Parque Media Luna', 'Inactivo', 15086, 10003),
(4, '6:00-8:00', 'Shopping Center', 'Activo', 15086, 10004),
(5, '17:00-21:00', 'Parque El Carmen', 'Activo', 15084, 10005),
(6, '7:00-10:00', 'Campo de Marte', 'Inactivo', 15072, 10006),
(7, '18:00-21:00', 'Plaza Bolívar', 'Activo', 15084, 10007),
(8, '6:00-10:00', 'Shopping Center', 'Activo', 15086, 10008),
(9, '6:30-9:00', 'Parque Quiñones', 'Inactivo', 15086, 10009),
(10, '6:00-10:00', 'Malecón de Magdalena', 'Activo', 15076, 10010);

INSERT INTO Puesto_Producto VALUES
(180, 1, 48, 4), 
(181, 2, 50, 7), 
(182, 3, 4, 1), 
(183, 4, 12, 3), 
(184, 5, 80, 8), 
(185, 6, 20, 4), 
(186, 7, 9, 2), 
(187, 8, 21, 3), 
(188, 9, 37, 7);

INSERT INTO Tarjeta_de_Credito VALUES
('4111222233334444', 'María Fernández', '56789012', '06/2025', '101', 9844),
('5500550055005500', 'Pedro González', '43210987', '09/2024', '202', 9846),
('340034003400340', 'Laura Torres', '78901234', '12/2026', '303', 9847),
('6011601160116011', 'Andrés Castro', '34567890', '04/2027', '404', 6388),
('370037003700370', 'Carmen Rojas', '98765432', '08/2025', '505', 7463),
('3535353535353535', 'Luis Ramírez', '54321098', '11/2028', '606', 9850),
('4111000011110000', 'Sofía Martínez', '65432109', '01/2026', '707', 6248);
