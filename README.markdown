# registrame0.2
registrame0.2 es la segunda version de mi app para llevar el registro de asistentes a una expo o evento. Originalmente escrita en Rails 2.3, esta nueva version se actualiza usando Rails 3.

## Que hay dentro?
- Rails 3
- jQuery
- algunas gemas

## Como esta relacionada?
La app es un trabajo en proceso aun, este README se actualizara conforme se vaya necesitando. Por el primer paso, hay que popular varios modelos:
- Interest regisra los intereses que pudieran tener los asistentes al evento.
- Promotion registra los medios de promocion a traves de los cuales los asistentes pudieron enterarse del evento.
- Registration lleva cuenta de los tipos de registro que pueden existir, ejemplo: Expositor, Visitante, Patrocinador, etc, etc.
- Company registra las empresas para las que un visitante puede trabajar.
- Sector registra los sectores a los cuales pueden pertenecer las empresas registradas.
- Person lleva registro de los visitantes.
- NameBadge almacena los datos del gafete en donde se imprimiran los datos de los asistentes.

## Cual es el plan?
- Tener dos areas: admin para configuracion y reportes, y publica para capturistas durante el evento.
- Area publica:
	- Menu simple de acceso a las opciones comunes: registrar asistente, registrar empresa, lista de asistentes, lista de empresas. La idea es que a traves de la lista de asistentes, se localice un registro para imprimir su respectivo gafete.
- Area admin:
	- Menu de acceso a toda la aplicacion para configurar los distintos modelos de la app.
	- Acceso a crear reportes con la info recolectada durante el registro.