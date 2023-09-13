# db-clubsocial
### Documentación sobre el desarrollo de la base de datos clubsocial

##### 1. Introducción

En el presente documento se expone de manera exhaustiva el modelo de negocio abordado, se identifica la problemática subyacente, y se establece el propósito fundamental de este trabajo.
Asimismo, se incluirá información relevante de naturaleza técnica relacionada con su desarrollo, englobando aspectos como los Diagramas de Entidad-Relación, las tablas, funciones, procedimientos, vistas y disparadores que desempeñan un papel esencial en el proceso.
La base tiene una composición actual que puede ser variable y escalable de acuerdo con la evolución del modelo de negocio.

##### 2. Objetivo

El objetivo consiste en establecer un sistema de gestión y almacenamiento digital de datos generados diariamente por los miembros y las actividades del club, con un enfoque en la organización y robustez de la información. Además, se busca emplear de manera eficiente estos datos con fines productivos para contribuir al desarrollo de la organización.

##### 3. Modelo de negocio

##### 4. Uso

El repositorio está compuesto de archivos que permitirán entender y utilizar la base de datos. 
- Vistas:
  Las vistas nos permiten consultar y presentar información de una manera específica, sin modificar la estructura de la base de datos subyacente. 
  Ej.: socios_por_estado_vw -> Con esta vista podremos consultar el estado de morosidad relacionado al pago de cada socio
- Funciones:
  Las siguientes funciones están preestablecidas para solicitudes frecuentes.
  Ej.: obtener_socio_dni -> Con esta funcion, podremos consultar los datos relacionado a un socio a traves de su DNI
- Triggers:
  Con los triggers establecidos, llevaremos la auditoría de ciertos eventos
  Ej.: tr_agregar_nuevo_socio -> Con este trigger podremos agregar un nuevo socio en la base

##### Creditos:
Quiero agradecer especialmente a mi profesor César Aracena por sus claros conceptos y de quien aprendí a cada paso de mi cursada, y a Juan Martin Almada Ortiz quien fuera mi tutor por su acompañamiento para evolucionar constantemente esta DB.

##### Contacto:
Ezequiel Izquierdo
ezequielizquierdo@hotmail.com
https://www.linkedin.com/in/ezequielizquierdo/

##### Perfil:
Soy desarrollador front-end y diseñador gráfico queriendo hacer experiencia en bases de datos relacionales y no relacionales. Mi enfoque une la creatividad del diseño con la funcionalidad del desarrollo, creando interfaces atractivas y usables. Trabajo con HTML, CSS, JavaScript, React y he implementado soluciones interactivas en entornos ágiles. Mi destreza en bases de datos agrega profundidad a mis proyectos, permitiendo una gestión eficiente de la información. Mi mayor interés es aportar esta combinación interesante a proyectos desafiantes y colaborativos.