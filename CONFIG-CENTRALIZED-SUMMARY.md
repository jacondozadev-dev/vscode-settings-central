# 📁 Estructura de Configuración Centralizada VSCode

```
~/dev/
├── .vscode-settings-base.json           ← Configuración agnóstica (para TODOS)
├── .vscode-settings-by-stack.json       ← Configuraciones por tecnología
├── VSCODE-SETTINGS-TEMPLATE.json        ← Template lista para copiar/pegar
├── VSCODE-SETTINGS-README.md            ← Documentación completa
├── QUICK-APPLY.json                     ← Pasos rápidos por escenario
└── CONFIG-CENTRALIZED-SUMMARY.md        ← Este archivo
```

---

## 📦 Archivos Creados y Su Propósito

### 1. `.vscode-settings-base.json`
**¿Qué es?** Configuración agnóstica que funciona en cualquier máquina y proyecto.

**Contiene:**
- Fuente, ligaduras, word wrap
- Prettier como formateador
- ESLint + organize imports + sort members
- TypeScript/JavaScript base
- GitHub Copilot
- GitLens AI

**Uso:** Copia TODO este archivo a tu `settings.json` primero

---

### 2. `.vscode-settings-by-stack.json`
**¿Qué es?** Configuraciones específicas por tipo de proyecto/tecnología.

**Stacks incluidos:**
- **web-stack**: TypeScript, Angular, Ionic, Node.js (tu actual)
- **flutter-stack**: Flutter, Dart (tu nuevo proyecto)
- **debugging**: LLDB (macOS)
- **terminal-auto-approve**: Auto-ejecución de comandos

**Uso:** Agrega la sección del stack que necesites a tu `settings.json`

---

### 3. `VSCODE-SETTINGS-TEMPLATE.json`
**¿Qué es?** Template completo con comentarios, listo para copiar/pegar.

**Características:**
- Todo comentado y bien organizado
- Incluye secciones opcionales comentadas (Flutter, debugging)
- Instrucciones paso a paso
- Validación y troubleshooting incluido

**Uso:** 
```
1. Abre: Cmd+Shift+P → "Preferences: Open Settings (JSON)"
2. Copia TODO del template
3. Pega en tu settings.json
4. Descomenta lo que necesites
```

---

### 4. `VSCODE-SETTINGS-README.md`
**¿Qué es?** Documentación completa y detallada.

**Secciones:**
- Cómo usar en nuevas máquinas
- Cómo mantener centralizado (Git, Cloud, etc)
- Stacks soportados
- Rutas importantes por SO
- Troubleshooting

**Uso:** Referencia cuando necesites más detalles

---

### 5. `QUICK-APPLY.json`
**¿Qué es?** Guía rápida para diferentes escenarios.

**Escenarios:**
- Primera vez aplicando (5 min)
- Nueva máquina (3 min)
- Sincronización cloud
- Agregar nuevo stack
- Actualizar settings

**Uso:** Busca tu escenario y sigue los pasos

---

## 🎯 Cómo Empezar (3 Pasos Rápidos)

### Opción A: Copiar y Pegar (Más Rápido)
```
1. Abre: Cmd+Shift+P → "Preferences: Open Settings (JSON)"
2. Copia TODO de: VSCODE-SETTINGS-TEMPLATE.json
3. Pega en tu settings.json
4. Personaliza según necesites
```

### Opción B: Paso a Paso
```
1. Lee: QUICK-APPLY.json → scenario_1_first_time
2. Sigue los pasos
3. Listo
```

### Opción C: Sincronización Centralizada
```
1. Lee: VSCODE-SETTINGS-README.md → Cómo Mantenerlo Centralizado
2. Elige opción (Git, Cloud, etc)
3. Configura en todas tus máquinas
```

---

## 🔄 Flujo de Trabajo Recomendado

```
┌─────────────────────┐
│  Máquina 1 (Dev)    │
│  - Haces cambios    │
│  - Actualizar archivos .json
│  - git commit
│  - git push
└──────────┬──────────┘
           │
           ↓
┌─────────────────────┐
│   Repositorio Git   │
│  (Centralizado)     │
└──────────┬──────────┘
           │
           ↓ git pull
┌─────────────────────┐
│ Máquina 2, 3, N     │
│ - Aplica cambios    │
│ - Settings sincronizado
└─────────────────────┘
```

---

## 📱 Para tu Nuevo Proyecto Flutter

### Paso 1: Mantén la Configuración Base
Tu configuración base sigue siendo válida.

### Paso 2: Agrega la Configuración Flutter
```json
// De: .vscode-settings-by-stack.json → flutter-stack
"[dart]": {
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "Dart-Code.dart-code",
  ...
},
"dart.lineLength": 100,
"flutter.sdkPath": "/opt/flutter"
```

### Paso 3: Instala Extensiones Flutter
```bash
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter
```

### Paso 4: Verifica
- Dart analyzer reconoce el SDK
- Formato automático funciona
- Autocomplete de Flutter

---

## 🛠️ Cambios Frecuentes Esperados

| Evento | Qué Hacer |
|--------|-----------|
| Nuevo proyecto | Agrega stack a `settings.json` |
| Nuevo stack | Copia de `.vscode-settings-by-stack.json` |
| Cambio en config base | Actualiza `.vscode-settings-base.json` + git push |
| Nueva máquina | Lee `QUICK-APPLY.json` → scenario_2 |
| Sincronizar cambios | git pull + copiar a settings.json |

---

## 💾 Opciones de Almacenamiento

### 1. **Repositorio Git** (Mi recomendación)
```bash
# Crear repo local
cd ~/dev
git init vscode-settings-central
cd vscode-settings-central

git add .vscode-settings-*.json *.md *.json
git commit -m "Initial VSCode centralized settings"

# Antes de agregar el remoto:
# 1. Crear el repositorio vacío en GitHub
# 2. Asegurarte de que ya exista al menos 1 commit local
# 3. Opcional: renombrar la rama a main

git branch -M main

git remote add origin <tu-repo>
git push -u origin main

# Si el remoto ya existe, usa:
# git remote set-url origin <tu-repo>

# En otra máquina
git clone <tu-repo> ~/.vscode-settings-central
```

### 2. **Settings Sync de VSCode** (Automático)
```
Cmd+Shift+P → "Settings: Turn on Settings Sync"
Sign in with GitHub/Microsoft
→ Se sincroniza automáticamente
```

### 3. **Google Drive / Dropbox** (Simple)
```
1. Copia archivos .json a Drive/Dropbox
2. Sincroniza entre máquinas
3. Manual pero simple
```

---

## ✅ Checklist de Instalación

- [ ] Copiaste `.vscode-settings-base.json` a tu `settings.json`
- [ ] Agregaste el stack que usas (web-stack o flutter-stack)
- [ ] Instalaste extensiones recomendadas
- [ ] Reiniciaste VSCode (Reload Window)
- [ ] Verificaste que Prettier formatea
- [ ] Verificaste que ESLint muestra errores
- [ ] Para Flutter: Verificaste que Dart analyzer funciona

---

## 📚 Referencias Rápidas

| Necesito... | Archivo |
|------------|---------|
| Aplicar rápido | `VSCODE-SETTINGS-TEMPLATE.json` |
| Pasos para mi caso | `QUICK-APPLY.json` |
| Documentación completa | `VSCODE-SETTINGS-README.md` |
| Configuración base | `.vscode-settings-base.json` |
| Por tecnología | `.vscode-settings-by-stack.json` |

---

## 🎓 Resumen

✨ **Ya tienes:**
- ✅ Configuración base reutilizable
- ✅ Stacks para Web y Flutter
- ✅ Template listo para copiar
- ✅ Guía de aplicación rápida
- ✅ Documentación completa
- ✅ Ejemplos de sincronización

🚀 **Próximos pasos:**
1. Elige cómo sincronizar (Git, Cloud, manual)
2. Aplica la configuración base
3. Agrega el stack de Flutter cuando empieces el proyecto
4. Comparte estos archivos con tu equipo (opcional)

---

**Última actualización:** 2026-07-08  
**Versión:** 1.0.0  
**Estado:** Listo para usar en múltiples máquinas
