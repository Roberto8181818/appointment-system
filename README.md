# Prueba Técnica: Sistema de Agendamiento de Citas (ASP.NET Web Forms)

Sistema simplificado para el agendamiento de citas médicas en una clínica

## Requisitos

- Visual Studio 2022 con soporte para ASP.NET
- SQL Server Developer o Express
- .NET Framework 4.8.1
- (Opcional) SQL Server Management Studio (SSMS) para administrar la base de datos

## Instalación

### 1. Clonar el repositorio

- ```bash
  git clone https://github.com/Roberto8181818/appointment-system.git
  
- Abrir la solución en Visual Studio **Abrir el archivo .sln del proyecto.**

### 3. Configuración de la base de datos

Este proyecto utiliza Entity Framework y requiere la base de datos ClinicaDB.

Para configurarla en tu máquina local, sigue estos pasos:

- Conéctate a tu servidor SQL local usando SQL Server Management Studio (SSMS) con los siguientes datos:

  - Server Name: localhost

  - Authentication: Windows Authentication

  - Trust Server Certificate: Activar el check

- Ejecuta el script de la base de datos:

  - Abre el archivo ClinicaDB.sql en SQL Server Management Studio.

  - Pulsa Execute.

  - Esto creará la base de datos con la misma estructura que utilicé en el proyecto.

- Verifica la cadena de conexión:

  - Abre App.config o Web.config.

  - Asegúrate de que la propiedad connectionString apunte a tu servidor local:
```bash
<connectionStrings>
  <add name="ClinicaDBEntities" connectionString="metadata=res://*/ClinicaModel.csdl|res://*/ClinicaModel.ssdl|res://*/ClinicaModel.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=localhost;initial catalog=ClinicaDB;integrated security=True;trustservercertificate=True;MultipleActiveResultSets=True;App=EntityFramework&quot;" providerName="System.Data.EntityClient" />
</connectionStrings>
```
Si usas el mismo nombre de servidor (localhost) que en el proyecto original, no necesitas cambiar nada.

5. Restaurar paquetes NuGet
En Visual Studio, haz clic derecho sobre la solución → Restore NuGet Packages.

6. Ejecutar el proyecto
Presiona F5 o Ctrl+F5 para iniciar la aplicación.

La aplicación se abrirá en el navegador predeterminado.

### 4. Uso
En la página Listado de citas se pueden observar todas las citas registradas en la base de datos, a su vez se pueden cancelar las citas programadas dando click en "Cancelar" al lado de la cita que se desea cancelar (siempre que tenga 24h de antelación)

Desde la página de listado se puede navegar a la página de agendamiendo dando click en "Agendar cita", una vez ahí se deben diligenciar los datos requeridos y clickear "Guardar Cita" si los datos fueron proporcionados correctamente se agendará la cita y se redirigirá al listado de citas

### 5. Autor

Roberto Padilla Mendoza
[robertopadillapadilla9@gmail.com] | [+57 301 4315902] 
