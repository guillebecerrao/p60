# Arquitectura multi-idioma (reference)

> Detalle de la Rama B del Paso 6 (`multi_language_enabled`). Se carga solo cuando el artefacto tiene traducciones habilitadas.

## Principio

Generar el HTML con las tres variantes de idioma embebidas. **Un solo archivo HTML** con todo el contenido traducido almacenado como objetos JavaScript. El archivo es autónomo: no depende de recursos externos para las traducciones, y funciona offline.

## Estructura del sistema de idiomas

```javascript
const translations = {
  es: {
    // todos los textos visibles en español
  },
  en: {
    // todos los textos visibles en inglés
  },
  pt: {
    // todos los textos visibles en portugués
  }
};
```

## Auto-detección y switcher

- Al cargar el documento: detectar `navigator.language`, normalizar al código base (`es-AR` → `es`, `en-US` → `en`, `pt-BR` → `pt`). Si el idioma detectado no es `es`, `en` ni `pt`, usar `es` como fallback.
- Incluir un switcher visual `ES | EN | PT` en el header con el idioma activo destacado. El usuario puede sobreescribir la detección automática con este switcher.
- El cambio de idioma debe ser instantáneo (sin recarga de página).

## Traducciones a incluir

- Todo el contenido textual del artefacto.
- Labels de UI (títulos de sección, encabezados de tabla, etiquetas de estado).
- Footer: "Documentos relacionados" y nombres de los documentos linkeados.
- Fecha de generación: mantener en formato numérico universal (`YYYY-MM-DD`) para no necesitar traducción.

En artefactos tipo OST, los labels de los nodos del árbol se traducen junto con el resto del contenido.

## Advertencia al usuario al generar por primera vez con multi-language

> "HTML generado con traducciones en ES, EN y PT. Revisá los términos de dominio en las versiones en inglés y portugués — especialmente: [listar términos clave del artefacto, ej. 'Opportunity Solution Tree', 'touchpoint', 'squad', nombres propios del producto]."

## Estados de idioma (referencia cruzada)

El `estado_idiomas` del artefacto (columna `Estado idiomas` en `_presentaciones-config.md`) puede ser:

| Estado | Comportamiento de generación |
|---|---|
| `single_language` | Rama A. Idioma base del artefacto. |
| `multi_language_enabled` | Rama B. Tres idiomas embebidos. |
| `multi_language_paused` | Rama A. Traducciones temporalmente en pausa (se generó en un solo idioma para iterar rápido). |

Las transiciones entre estados (activar, pausar, reactivar) las dispara el Paso 4. Detalle de los triggers en `process-steps.md`; la fuente de verdad del estado vive en la config (`config-and-history.md`).
