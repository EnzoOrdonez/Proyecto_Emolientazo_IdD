# Proyecto Emolientazo - Integrador 2024

_Aplicativo web para la gestión de ventas de emolientes en la municipalidad de San Miguel, que permite a los clientes realizar pedidos, consultar disponibilidad de productos y gestionar inventarios de manera eficiente._

---

## Comenzando 🚀
Estas instrucciones te permitirán obtener una copia del proyecto en funcionamiento en tu máquina local para propósitos de desarrollo y pruebas.

### Pre-requisitos 📋

_Que cosas necesitas para instalar el software y como instalarlas_

- Tener instalado **Microsoft SQL Server 2022** y **Microsoft SQL Server Management Studio (SSMS)**.
- Tener configurado un entorno compatible con **ASP.NET Maker 2024**.
- Conexión estable a la base de datos local.

### Instalación 🔧

1. **Crear la base de datos en SQL Server**
   - Abre **Microsoft SQL Server Management Studio (SSMS)** y conéctate a tu instancia local (localhost).
   - Ejecuta el siguiente comando para crear la base de datos:
     ```sql
     CREATE DATABASE DB_Emol;
     USE DB_Emol;
     ```

2. **Ejecutar scripts SQL**
   - Primero, ejecuta el script `Tablas_DDL.sql` para crear las tablas necesarias.
   ```sql
   USE DB_Emol;
   -- Pega aquí el contenido de Tablas_DDL.sql
   ```
   
   - Luego, ejecuta el script `Carga_Datos_DML.sql` para cargar los datos iniciales.
   ```sql
   USE DB_Emol;
   -- Pega aquí el contenido de Carga_Datos_DML.sql
   ```
   
   - Finalmente, ejecuta el script `Triggers_PL_SQL.sql` para aplicar los triggers y procedimientos.
   ```sql
   USE DB_Emol;
   -- Pega aquí el contenido de Triggers_PL_SQL.sql
   ```

3. **Configurar ASP.NET Maker 2024**
   - Instala y configura **ASP.NET Maker 2024**.
   - Conéctalo a la base de datos `DB_Emol` creada en tu servidor local.
   - Genera el sitio web de acuerdo a las configuraciones establecidas.

4. **Lanzar la aplicación**
   - Ejecuta el proyecto generado por ASP.NET Maker 2024.
   - Accede a la interfaz web desde tu navegador preferido.

## Construido con 🛠️

* [Microsoft SQL Server 2022](https://www.microsoft.com/es-es/sql-server) - Base de datos
* [Microsoft SQL Server Management Studio (SSMS)](https://learn.microsoft.com/es-es/sql/ssms/download-sql-server-management-studio-ssms) - Herramienta de gestión
* [ASP.NET Maker 2024](https://www.hkvstore.com/aspnetmaker/) - Generador de Aplicaciones Web
* [HTML, CSS, JavaScript, Node.js](https://developer.mozilla.org/) - Desarrollo Frontend

## Autores ✒️

- **Patrick Fabricio Cornejo Huanca** (20192642) 
- **Renato Antonio Cuadrado Guzman** (20182495)
- **Jose Francisco Del Busto Fabian** (20215549) 
- **Enzo Fabrizio Ordoñez Flores** (20221789)
- **Fiorella Suhail Portella Valdez** (20204797) 