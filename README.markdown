# registrame0.2
registrame0.2 es la segunda version de mi app para llevar el registro de asistentes a una expo o evento. Originalmente escrita en Rails 2.3, esta nueva version se actualiza usando Rails 3.
No solo he actualizado la version de Rails en la que funciona, se ha desarrollado lo siguiente:
+ La configuracion puede ser hecha solo por el usuario admin via login/password.
+ El gafete del asistente incluye los datos de la persona en formato QRCode.

## Que hay dentro?
+ Rails 3 (3.0.7)
+ jQuery (1.4.4)
+ Gemas
	+ devise (para autenticacion/autorizacion de usuario admin)
	+ prawn (para generar gafete de asistente en PDF listo para impresion)
	+ rqr (genera QRCode con los datos del asistente y se imprime en el gafete)


## Cual es el plan?
Tener tres areas: __admin__ para configuracion y reportes; __data__ para los capturistas en sitio durante un evento; y __publica__ para que los interesados se pre-registren online.

+ Area admin:
	+ Menu de acceso a toda la aplicacion para configurar los distintos modelos de la app.
	+ Dashboard para crear reportes con la info recolectada durante el registro en formato CSV y PDF.
	
+ Area data:
	+ Acceso a las operaciones basicas de registro, revision de datos e impresion de gafete de asistentes.
	+ Dashboard con vision general de la cantidad de registros y gafetes impresos, clasificados en los distintos tipos de registro que se especifique en la configuracion.
	
+ Area publica:
	+ Los interesados pueden pre-registrarse a traves de esta interfaz.
	+ Al completar el registro, la aplicacion envia un correo de confirmacion al asistente.
	+ Usando los enlaces en el correo que recibe, el asistente puede ver/modificar su registro.
		
## Como configurarla?
La app es un trabajo en proceso aun, este README se actualizara conforme se vaya necesitando.

Pasos:
+ Crear archivo config/app_config.yml tomando como base config/sample_app_config.yml
+ Ejecutar $ rake db:setup (esto creara la base de datos y cargara el contenido de seed.rb para crear la info basica necesaria.)
+ Ahora podemos entrar con las credenciales del usuario admin (__IMPORTANTE__: cambiar las credenciales del usuario para evitar dolores de cabeza, especialmente si tendra la aplicacion en linea para pre-registro.)
+ Popular varios modelos via las siguientes entradas en el menu:
	Config >
		+ Event Info: configura los datos del evento en que se usa para desplegarlos a las personas que se preregistran en linea.
		+ Interests: regisra los intereses que pudieran tener los asistentes al evento.
		+ Promotions: registra los medios de promocion a traves de los cuales los asistentes pudieron enterarse del evento.
		+ Registration Types: lleva cuenta de los tipos de registro que pueden existir, ejemplo: Expositor, Visitante, Patrocinador, etc, etc.
		+ Sectors: registra los sectores a los cuales pueden pertenecer las empresas registradas.
		+ NameBadge: almacena los datos del gafete en donde se imprimiran los datos de los asistentes.
	+ Attendees: lleva registro de los visitantes.