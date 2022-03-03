import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import VuePlugin from '@vitejs/plugin-vue'
import { brotliCompressSync } from "zlib"
import gzipPlugin from "rollup-plugin-gzip"

export default defineConfig({
  plugins: [
    RubyPlugin(),
    VuePlugin(),
    gzipPlugin(),
    gzipPlugin({
      customCompression: (content) => brotliCompressSync(Buffer.from(content)),
      fileName: ".br",
    })
  ],
})
