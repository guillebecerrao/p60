# Template — shell HTML multi-idioma

> Esqueleto de referencia para la Rama B del Paso 6 (`multi_language_enabled`). Un solo archivo autónomo. Adaptar estilos al design system y la visualización al tipo de artefacto. Para single-language, omitir el bloque `translations`, el switcher y la lógica de detección.

```html
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>[Título del artefacto]</title>
<style>
  /* Tokens del design system: paleta, tipografía, spacing, componentes (Paso 2) */
  /* Guías visuales del artefacto (Paso 3) */
</style>

<!-- Navegación al home (omitir si no existe home.html) -->
<a class="home-link" href="./home.html">← Inicio</a>

<header>
  <h1 data-i18n="title"></h1>
  <span class="fecha">[YYYY-MM-DD]</span>
  <!-- Switcher de idioma; idioma activo destacado -->
  <nav class="lang-switch">
    <button data-lang="es">ES</button>
    <button data-lang="en">EN</button>
    <button data-lang="pt">PT</button>
  </nav>
</header>

<main>
  <!-- Visualización apropiada al tipo de artefacto -->
  <!-- Nodos/celdas con texto vía data-i18n="clave" -->
</main>

<footer>
  <p data-i18n="fuente"></p>
  <!-- "Documentos relacionados": links relativos a docs permanentes,
       excluyendo el propio y home.html. Omitir sección si el registro está vacío. -->
  <section class="relacionados">
    <h2 data-i18n="relacionados_title"></h2>
    <ul><!-- <li><a href="./otro-doc.html" data-i18n="doc_otro"></a></li> --></ul>
  </section>
</footer>

<script>
  const translations = {
    es: { title: "", fuente: "", relacionados_title: "Documentos relacionados" /* … */ },
    en: { title: "", fuente: "", relacionados_title: "Related documents" /* … */ },
    pt: { title: "", fuente: "", relacionados_title: "Documentos relacionados" /* … */ }
  };

  function normalizeLang(l) {
    const base = (l || "es").slice(0, 2).toLowerCase();
    return ["es", "en", "pt"].includes(base) ? base : "es";
  }
  function applyLang(lang) {
    const t = translations[lang];
    document.querySelectorAll("[data-i18n]").forEach(el => {
      const k = el.getAttribute("data-i18n");
      if (t[k] != null) el.textContent = t[k];
    });
    document.querySelectorAll(".lang-switch button").forEach(b =>
      b.classList.toggle("active", b.dataset.lang === lang));
  }
  document.querySelectorAll(".lang-switch button").forEach(b =>
    b.addEventListener("click", () => applyLang(b.dataset.lang)));
  applyLang(normalizeLang(navigator.language));
</script>
```

**Recordatorios:**
- La fecha va en formato numérico universal `YYYY-MM-DD` (no requiere traducción).
- En OST: renderizar el árbol completo; destacar `on_selected_path: true` (ruta) y `selected: true` (hoja); traducir labels de nodos.
- Al generar por primera vez con multi-language, emitir la advertencia de revisar términos de dominio (ver `references/multi-language.md`).
