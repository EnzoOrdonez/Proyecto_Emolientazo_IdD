-- Trigger 1: Prevenir duplicados en Correo_Electronico en Cliente
CREATE TRIGGER trg_PrevenirCorreoDuplicado
ON Cliente
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted i
        INNER JOIN Cliente c ON i.Correo_Electronico = c.Correo_Electronico
    )
    BEGIN
        RAISERROR('El correo electrónico ya existe.', 16, 1);
    END
    ELSE
    BEGIN
        INSERT INTO Cliente (Cliente_id, Nombres, Apellidos, Direccion, Numero_Telefono, Correo_Electronico)
        SELECT Cliente_id, Nombres, Apellidos, Direccion, Numero_Telefono, Correo_Electronico
        FROM inserted;
    END
END
GO
-- Trigger 2: Prevenir inserción de Orden_Pedido con Fecha_Orden en el pasado
CREATE TRIGGER trg_PrevenirFechaOrdenPasada
ON Orden_Pedido
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted WHERE Fecha_Orden < CAST(GETDATE() AS DATE)
    )
    BEGIN
        RAISERROR('No se puede insertar una orden con fecha en el pasado.', 16, 1);
    END
    ELSE
    BEGIN
        INSERT INTO Orden_Pedido (Orden_Pedido_id, Fecha_Orden, Hora_Orden, Estado_Orden, Cliente_id, Motorizado_id, Tipo_Pago_id)
        SELECT Orden_Pedido_id, Fecha_Orden, Hora_Orden, Estado_Orden, Cliente_id, Motorizado_id, Tipo_Pago_id
        FROM inserted;
    END
END
GO
-- Trigger 3: Prevenir eliminación de Producto asociado a Orden_Pedido_Producto
CREATE TRIGGER trg_PrevenirEliminacionProductoConPedidos
ON Producto
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM deleted d
        INNER JOIN Orden_Pedido_Producto opp ON d.Producto_id = opp.Producto_id
    )
    BEGIN
        RAISERROR('No se puede eliminar el producto porque está asociado a pedidos.', 16, 1);
    END
    ELSE
    BEGIN
        DELETE FROM Producto WHERE Producto_id IN (SELECT Producto_id FROM deleted);
    END
END
GO
-- Trigger 4: Prevenir actualización de Precio negativo en Puesto_Producto
CREATE TRIGGER trg_PrevenirPrecioNegativo
ON Puesto_Producto
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted WHERE Precio < 0
    )
    BEGIN
        RAISERROR('El precio no puede ser negativo.', 16, 1);
    END
    ELSE
    BEGIN
        UPDATE Puesto_Producto
        SET Precio = i.Precio,
            Cantidad = i.Cantidad
        FROM inserted i
        WHERE Puesto_Producto.Producto_id = i.Producto_id AND Puesto_Producto.Puesto_id = i.Puesto_id;
    END
END
GO
-- Trigger 5: Prevenir inserción de Proveedor con Número de Teléfono inválido
CREATE TRIGGER trg_PrevenirTelefonoInvalidoProveedor
ON Proveedor
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted WHERE LEN(Numero_Telefono) <> 9 OR Numero_Telefono LIKE '%[^0-9]%'
    )
    BEGIN
        RAISERROR('El número de teléfono del proveedor es inválido.', 16, 1);
    END
    ELSE
    BEGIN
        INSERT INTO Proveedor (Proveedor_id, Nombres, Apellidos, Numero_Telefono, Direccion, Municipalidad_id)
        SELECT Proveedor_id, Nombres, Apellidos, Numero_Telefono, Direccion, Municipalidad_id
        FROM inserted;
    END
END
GO
-- Trigger 6: Prevenir actualización de Estado del Motorizado a 'Inactivo' si tiene pedidos en proceso
CREATE TRIGGER trg_PrevenirEstadoMotorizadoInactivoConPedidos
ON Motorizado
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted i
        INNER JOIN Orden_Pedido op ON i.Motorizado_id = op.Motorizado_id
        WHERE op.Estado_Orden = 'En proceso' AND i.Estado = 'Inactivo'
    )
    BEGIN
        RAISERROR('No se puede cambiar el estado a Inactivo porque el motorizado tiene pedidos en proceso.', 16, 1);
    END
    ELSE
    BEGIN
        UPDATE Motorizado
        SET Nombres_Apellidos = i.Nombres_Apellidos,
            Numero_Telefono = i.Numero_Telefono,
            Estado = i.Estado
        FROM inserted i
        WHERE Motorizado.Motorizado_id = i.Motorizado_id;
    END
END
GO
-- Trigger 7: Prevenir inserción de Orden_Pedido_Producto con Cantidad mayor al Stock disponible

CREATE TRIGGER trg_PrevenirExcesoDeStock
ON Orden_Pedido_Producto
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted i
        INNER JOIN Producto_Proveedor pp ON i.Producto_id = pp.Producto_id
        WHERE i.Cantidad > pp.Stock
    )
    BEGIN
        RAISERROR('La cantidad solicitada excede el stock disponible.', 16, 1);
    END
    ELSE
    BEGIN
        INSERT INTO Orden_Pedido_Producto (Orden_Pedido_id, Producto_id, Precio, Cantidad)
        SELECT Orden_Pedido_id, Producto_id, Precio, Cantidad FROM inserted;
    END
END
GO
-- Trigger 8: Prevenir eliminación de Cliente con pedidos pendientes
CREATE TRIGGER trg_PrevenirEliminacionClienteConPedidos
ON Cliente
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM deleted d
        INNER JOIN Orden_Pedido op ON d.Cliente_id = op.Cliente_id
        WHERE op.Estado_Orden = 'En proceso'
    )
    BEGIN
        RAISERROR('No se puede eliminar el cliente porque tiene pedidos en proceso.', 16, 1);
    END
    ELSE
    BEGIN
        DELETE FROM Cliente WHERE Cliente_id IN (SELECT Cliente_id FROM deleted);
    END
END
GO
-- Trigger 9: Prevenir inserción de Producto con Fecha_Vencimiento anterior a Fecha_Emision
CREATE TRIGGER trg_PrevenirFechaVencimientoInvalida
ON Producto
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted WHERE Fecha_Vencimiento < Fecha_Emision
    )
    BEGIN
        RAISERROR('La fecha de vencimiento no puede ser anterior a la fecha de emisión.', 16, 1);
    END
    ELSE
    BEGIN
        INSERT INTO Producto (Producto_id, Descripcion, Fecha_Emision, Fecha_Vencimiento)
        SELECT Producto_id, Descripcion, Fecha_Emision, Fecha_Vencimiento FROM inserted;
    END
END
GO
-- Trigger 10: Prevenir eliminación de un Puesto con productos asociados
CREATE TRIGGER trg_PrevenirEliminacionPuestoConProductos
ON Puesto_Emoliente
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM deleted d
        INNER JOIN Puesto_Producto pp ON d.Puesto_id = pp.Puesto_id
    )
    BEGIN
        RAISERROR('No se puede eliminar el puesto porque tiene productos asociados.', 16, 1);
    END
    ELSE
    BEGIN
        DELETE FROM Puesto_Emoliente WHERE Puesto_id IN (SELECT Puesto_id FROM deleted);
    END
END
GO