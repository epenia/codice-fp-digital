import { defineConfig } from 'astro/config';

import mdx from '@astrojs/mdx';

const myShikiConfig = {
      // Choose from Shiki's built-in themes (or add your own)
      // https://shiki.style/themes
      theme: 'material-theme',
      // Alternatively, provide multiple themes
      // See note below for using dual light/dark themes
      themes: {
        light: 'material-theme-lighter',
        dark: 'material-theme-darker',
      },
      // Disable the default colors
      // https://shiki.style/guide/dual-themes#without-default-color
      // (Added in v4.12.0)
      defaultColor: "light",
      // Add custom languages
      // Note: Shiki has countless langs built-in, including .astro!
      // https://shiki.style/languages
      langs: ['javascript', 'xml', 'html'],
      // Add custom aliases for languages
      // Map an alias to a Shiki language ID: https://shiki.style/languages#bundled-languages
      // https://shiki.style/guide/load-lang#custom-language-aliases
      langAlias: {
        cjs: "javascript"
      },
      // Enable word wrap to prevent horizontal scrolling
      wrap: true,
      // Add custom transformers: https://shiki.style/guide/transformers
      // Find common transformers: https://shiki.style/packages/transformers
      transformers: [],
    }

export default defineConfig({
  base: './', 
  
  build: {
    // 2. Genera "archivo.html" en lugar de "archivo/index.html"
    // Esto evita problemas de rutas con los niveles de carpetas
    format: 'file' 
  },
  markdown: {
    shikiConfig: myShikiConfig
  },

  integrations: [mdx(
    {ItshikiConfig: myShikiConfig}
  )],
});