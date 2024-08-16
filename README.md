# Aplicaión Buscador de personajes de Rick and Morty 

## Descripción

Esta es una aplicación de Flutter diseñada para buscar y visualizar detalles de personajes de la popular serie "Rick and Morty". La aplicación ofrece una interfaz de usuario amigable, con soporte para temas claro y oscuro, y está optimizada para una experiencia fluida en dispositivos móviles.

### Características principales:

- **Búsqueda de Personajes:** Filtra la lista de personajes en tiempo real a medida que escribes.
- **Paginación:** Carga de 20 personajes a la vez, con la opción de cargar más.
- **Detalles de Personajes:** Visualización detallada de cada personaje, incluyendo una imagen ampliada y más información.
- **Modo Claro/Oscuro:** Cambia entre temas claro y oscuro desde cualquier parte de la aplicación.
- **Gestión de Estado:** Utiliza Bloc y Cubit para la gestión eficiente del estado.
- **Llamadas a API:** Interactúa con la API de Rick and Morty usando Dio.

## Tecnologías Utilizadas

- **Flutter 3.24.0**
- **Dart 3.5.0**
- **Bloc (8.1.4):** Gestión de estado reactiva.
- **flutter_bloc (8.1.6):** Integración de Bloc con Flutter.
- **Dio:** Cliente HTTP para Flutter.
- **GoRouter (14.2.3):** Gestión de rutas.
- **Bloc Test (9.1.7):** Herramienta para pruebas de Bloc.
- **Mocktail (1.0.4):** Herramienta de mocks para pruebas.
- **Material Symbols Icons (4.2780.0):** Íconos de Material Design.

## Estructura del Proyecto

```plaintext
lib/
│
├── app/
│   └── app.dart
│
├── config/
│   └── routes.dart
│
├── domain/
│   ├── bloc/
│   │   ├── character_detail_cubit.dart
│   │   ├── character_list_cubit.dart
|   |   └── theme_cubit.dart
│   ├── models/
│   │   ├── character_model.dart
│   │   ├── info_response_model.dart
│   │   ├── location_model.dart
│   │   └── response_model.dart
│   └── services/
│       ├── character_services.dart
│       ├── episodes_service.dart
│       └── locations_services.dart
│
├── infraestructura/
│   ├── constants.dart
│   ├── extensions.dart
│   ├── utils.dart
│   └── identifiers.dart
│
└── ui/
    ├── pages/
    │   ├── character_detail_page.dart
    │   └── character_list_page.dart
    └── widgets/
        ├── message_component.dart
        ├── search_component.dart
        └── spinner_component.dart
```

## Requisitos Previos

- **Flutter SDK**: Versión 3.24.0
- **Dart**: Versión 3.5.0
- **Git**: Para clonar el repositorio
- **Conexión a Internet**: Para descargar dependencias y realizar llamadas a la API

### Verificar la instalación de Flutter

Para asegurarte de que Flutter está instalado correctamente, puedes ejecutar el siguiente comando:

```bash
flutter doctor
```

## Instalación

Para configurar y ejecutar este proyecto en tu entorno local, sigue estos pasos:

1. **Clona este repositorio:**

   Utiliza el comando `git clone` para clonar el repositorio en tu máquina local:

   ```bash
   git clone https://github.com/caes1996/buscadorRickAndMorty.git
   cd buscadorRickAndMorty
   ````
2. **Instala las dependencias:**

   Una vez clonado el repositorio, instala todas las dependencias necesarias utilizando el siguiente comando:

   ```bash
   flutter pub get
   ````
3. **Ejecuta la aplicación:**

   Para iniciar la aplicación en un dispositivo emulado o físico, ejecuta el siguiente comando:

   ```bash
   flutter run
   ````
4. **Ejecuta las pruebas:**

   Para ejecutar las pruebas unitarias incluidas en el proyecto, utiliza el siguiente comando:

   ```bash
   flutter test
   ````
5. **Configura el entorno (opcional):**

   Si necesitas configurar algún detalle adicional del entorno de desarrollo, asegúrate de que todo esté correctamente configurado ejecutando:

   ```bash
   flutter doctor
   ````

## Uso

1. **Pantalla Principal:**
   - Al iniciar la aplicación, verás una lista de los primeros 20 personajes de Rick and Morty.
   - Puedes buscar un personaje utilizando la barra de búsqueda en la parte superior. La lista se actualizará en tiempo real a medida que escribes.
   - Para cargar más personajes, desplázate hasta el final de la lista y presiona el botón de "Cargar más".

2. **Cambiar de Tema:**
   - En la esquina superior derecha, hay un botón para alternar entre el tema claro y oscuro.

3. **Detalle de Personajes:**
   - Haz clic en cualquier personaje de la lista para ver su información detallada en una nueva pantalla.
   - En la pantalla de detalles, podrás ver una imagen más grande del personaje y una descripción completa.
   - Desde la pantalla de detalles, también puedes cambiar el tema de la aplicación.

4. **Interacción con la API:**
   - La aplicación se conecta a la [API de Rick and Morty](https://rickandmortyapi.com/api) para obtener datos sobre los personajes.
   - Asegúrate de tener una conexión a Internet activa para realizar las búsquedas y cargar la información de los personajes.

## Contribuciones

Las contribuciones son bienvenidas. Si deseas contribuir al proyecto, sigue estos pasos:

1. **Haz un fork del repositorio:**

   Ve a la página del repositorio en GitHub y haz clic en el botón "Fork" para crear una copia del proyecto en tu cuenta de GitHub.

2. **Crea una nueva rama:**

   Clona tu fork en tu máquina local y crea una nueva rama para tus cambios:

   ```bash
   git clone https://github.com/tu-usuario/buscadorRickAndMorty.git
   cd buscadorRickAndMorty
   git checkout -b feature/nueva-funcionalidad
   ````

3. **Realiza tus cambios:**

    Haz tus modificaciones en la nueva rama. Asegúrate de probar tus cambios localmente.
4. **Haz commit de tus cambios:**

    Una vez que hayas realizado los cambios, haz commit de ellos con un mensaje descriptivo:
    ```bash
    git add .
    git commit -m 'Agregar nueva funcionalidad'
    ```
5. **Sube tus cambios:**

    Sube tus cambios a tu fork en GitHub:
    ```
    git push origin feature/nueva-funcionalidad
    ```

6. **Abre un Pull Request:**

    Ve a la página de tu fork en GitHub y abre un Pull Request para que tus cambios sean revisados e integrados en el repositorio principal.


## Problemas Conocidos

- **Estructura del Proyecto:**
    Aunque se creó una estructura modular, algunas carpetas permanecen vacías debido al tamaño reducido del proyecto. Esta estructura está diseñada para facilitar el mantenimiento y la escalabilidad en proyectos más grandes.

- **Nuevas Herramientas:**
    Bloc y Dio se utilizaron por primera vez en este proyecto. Aunque la documentación de estas herramientas es clara, la implementación podría mejorarse con base en futuras experiencias.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Puedes ver el archivo de licencia completo a continuación:

---

**Licencia MIT**

Copyright (c) [año] [tu nombre o el nombre de tu organización]

Se concede por la presente, sin costo alguno, a cualquier persona que obtenga una copia del software y los archivos de documentación asociados (el "Software"), el derecho a usar el Software sin restricción, incluyendo sin limitación los derechos para usar, copiar, modificar, fusionar, publicar, distribuir, sublicenciar y/o vender copias del Software, siempre que se incluya el aviso de copyright y el aviso de permiso en todas las copias o partes sustanciales del Software.

EL SOFTWARE SE OFRECE "TAL CUAL", SIN GARANTÍA DE NINGÚN TIPO, EXPRESA O IMPLÍCITA, INCLUYENDO PERO NO LIMITADO A LAS GARANTÍAS IMPLÍCITAS DE COMERCIABILIDAD, IDONEIDAD PARA UN PROPÓSITO PARTICULAR Y NO INFRACCIÓN. EN NINGÚN CASO LOS AUTORES O TITULARES DEL COPYRIGHT SERÁN RESPONSABLES POR CUALQUIER RECLAMO, DAÑO O OTRA RESPONSABILIDA
