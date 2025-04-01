CREATE TABLE Cliente (
    Cliente_id INT NOT NULL PRIMARY KEY,
    Nombres VARCHAR(50),
    Apellidos VARCHAR(50),
    Direccion VARCHAR(50),
    Numero_Telefono VARCHAR(20),
    Correo_Electronico VARCHAR(50)
);
CREATE TABLE Encargado (
    Encargado_id INT NOT NULL PRIMARY KEY,
    Nombres_Apellidos VARCHAR(50),
    Numero_Documento VARCHAR(20)
);
CREATE TABLE Motorizado (
    Motorizado_id INT NOT NULL PRIMARY KEY,
    Nombres_Apellidos VARCHAR(50),
    Numero_Telefono VARCHAR(20),
    Estado VARCHAR(50)
);
CREATE TABLE Municipalidad (
    Municipalidad_id INT NOT NULL PRIMARY KEY,
    Nombres VARCHAR(50),
    Ubicacion VARCHAR(50)
);
CREATE TABLE Proveedor (
    Proveedor_id INT NOT NULL PRIMARY KEY,
    Nombres VARCHAR(50),
    Apellidos VARCHAR(50),
    Numero_Telefono VARCHAR(20),
    Direccion VARCHAR(50),
    Municipalidad_id INT NOT NULL

);
CREATE TABLE Producto (
    Producto_id INT NOT NULL PRIMARY KEY,
    Descripcion VARCHAR(50),
    Fecha_Emision DATE,
    Fecha_Vencimiento DATE
);

CREATE TABLE Producto_Proveedor (
    Producto_id INT NOT NULL,
    Proveedor_id INT NOT NULL,
    Stock INT,
    PRIMARY KEY (Producto_id, Proveedor_id)
 
);
CREATE TABLE Tipo_Pago (
    Tipo_Pago_id INT NOT NULL PRIMARY KEY,
    Descripcion VARCHAR(50)
);

CREATE TABLE Orden_Pedido (
    Orden_Pedido_id INT NOT NULL PRIMARY KEY,
    Fecha_Orden DATE,
    Hora_Orden VARCHAR(10),
    Estado_Orden VARCHAR(20),
    Cliente_id INT NOT NULL,
    Motorizado_id INT NOT NULL,
    Tipo_Pago_id INT NOT NULL
);
CREATE TABLE Orden_Pedido_Producto (
    Orden_Pedido_id INT NOT NULL,
    Producto_id INT NOT NULL,
    Precio NUMERIC(8, 2),
    Cantidad INT,
    PRIMARY KEY (Orden_Pedido_id, Producto_id)
);
CREATE TABLE Puesto_Emoliente (
    Puesto_id INT NOT NULL PRIMARY KEY,
    Horario VARCHAR(20),
    Ubicacion VARCHAR(50),
    Estado VARCHAR(20),
    Municipalidad_id INT NOT NULL,
    Encargado_id INT NOT NULL
);
CREATE TABLE Puesto_Producto (
    Producto_id INT NOT NULL,
    Puesto_id INT NOT NULL,
    Precio NUMERIC(8, 2),
    Cantidad INT,
    PRIMARY KEY (Producto_id, Puesto_id)
);
CREATE TABLE Tarjeta_de_Credito (
    Numero_Tarjeta VARCHAR(100) NOT NULL PRIMARY KEY,
    Titular_Tarjeta VARCHAR(100),
    Documento_Identidad_T VARCHAR(20),
    Fecha_Vencimiento VARCHAR(50),
    CCI VARCHAR(10),
    Cliente_id INT NOT NULL
);

ALTER TABLE Tarjeta_de_Credito
ADD CONSTRAINT FK_Tarjeta_de_Credito_Cliente
FOREIGN KEY (Cliente_id) REFERENCES Cliente(Cliente_id);

ALTER TABLE Proveedor
ADD CONSTRAINT FK_Proveedor_Municipalidad
FOREIGN KEY (Municipalidad_id) REFERENCES Municipalidad(Municipalidad_id);

ALTER TABLE Orden_Pedido
ADD CONSTRAINT FK_Orden_Pedido_Cliente
FOREIGN KEY (Cliente_id) REFERENCES Cliente(Cliente_id);

ALTER TABLE Orden_Pedido
ADD CONSTRAINT FK_Orden_Pedido_Motorizado
FOREIGN KEY (Motorizado_id) REFERENCES Motorizado(Motorizado_id);

ALTER TABLE Orden_Pedido
ADD CONSTRAINT FK_Orden_Pedido_Tipo_Pago
FOREIGN KEY (Tipo_Pago_id) REFERENCES Tipo_Pago(Tipo_Pago_id);


ALTER TABLE Orden_Pedido_Producto
ADD CONSTRAINT FK_Orden_Pedido_Producto_Orden_Pedido
FOREIGN KEY (Orden_Pedido_id) REFERENCES Orden_Pedido(Orden_Pedido_id);

ALTER TABLE Orden_Pedido_Producto
ADD CONSTRAINT FK_Orden_Pedido_Producto_Producto
FOREIGN KEY (Producto_id) REFERENCES Producto(Producto_id);

ALTER TABLE Puesto_Emoliente
ADD CONSTRAINT FK_Puesto_Emoliente_Municipalidad
FOREIGN KEY (Municipalidad_id) REFERENCES Municipalidad(Municipalidad_id);

ALTER TABLE Puesto_Emoliente
ADD CONSTRAINT FK_Puesto_Emoliente_Encargado
FOREIGN KEY (Encargado_id) REFERENCES Encargado(Encargado_id);

ALTER TABLE Puesto_Producto
ADD CONSTRAINT FK_Puesto_Producto_Producto
FOREIGN KEY (Producto_id) REFERENCES Producto(Producto_id);

ALTER TABLE Puesto_Producto
ADD CONSTRAINT FK_Puesto_Producto_Puesto
FOREIGN KEY (Puesto_id) REFERENCES Puesto_Emoliente(Puesto_id);

ALTER TABLE Producto_Proveedor
ADD CONSTRAINT FK_Producto_Proveedor_Producto
FOREIGN KEY (Producto_id) REFERENCES Producto(Producto_id);

ALTER TABLE Producto_Proveedor
ADD CONSTRAINT FK_Producto_Proveedor_Proveedor
FOREIGN KEY (Proveedor_id) REFERENCES Proveedor(Proveedor_id);