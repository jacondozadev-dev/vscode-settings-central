# VSCode Settings - Guía Centralizada y Reutilizable

## 📋 Archivos de Configuración

- **`.vscode-settings-base.json`**: Configuración agnóstica (válida para cualquier proyecto)
- **`.vscode-settings-by-stack.json`**: Configuraciones específicas por stack tecnológico
- **`README.md`**: Esta guía

## 🚀 Cómo Usarla en Nuevas Máquinas

### Paso 1: Clonar o Copiar Esta Carpeta
```bash
# Opción A: Si está en un repositorio git
git clone <repo> ~/.vscode-centralized-settings

# Opción B: Copiar manualmente
cp -r ~/dev/.vscode-settings-* ~/.vscode-centralized-settings/
```

### Paso 2: Aplicar la Configuración Base
1. Abre VSCode
2. Presiona `Cmd+Shift+P` (macOS) / `Ctrl+Shift+P` (Linux/Windows)
3. Busca "Preferences: Open Settings (JSON)"
4. Copia el contenido de `.vscode-settings-base.json`
5. Pégalo en tu `settings.json`

### Paso 3: Agregar Configuraciones por Stack
Según el proyecto, agrega las secciones relevantes:

**Para proyectos Web (Angular, Ionic, Node, TypeScript):**
```json
// De .vscode-settings-by-stack.json → web-stack
```

**Para proyectos Flutter:**
```json
// De .vscode-settings-by-stack.json → flutter-stack
// Asegúrate de ajustar las rutas SDK
```

### Paso 4: Instalar Extensiones
Las extensiones recomendadas por stack están listadas en `.vscode-settings-by-stack.json`

Instala desde terminal:
```bash
# Web Stack
code --install-extension Angular.ng-template
code --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint

# Flutter Stack
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter
```

## 📦 Stacks Soportados

### 1. **Web Stack** (Actual)
- TypeScript, Angular, Ionic, Node.js
- Formateador: Prettier
- Linting: ESLint
- Tamaño tab: 2 espacios

### 2. **Flutter Stack** (Nuevo)
- Dart, Flutter
- Formateador: Dart Code
- Line length: 100 caracteres
- Snippets habilitados

### 3. **Debugging** (macOS)
- LLDB (Xcode)
- Expresiones nativas
- Notificaciones deshabilitadas

## 🔧 Cómo Mantenerlo Centralizado

### Opción 1: Repositorio Git (Recomendado)
```bash
# Crear repositorio
mkdir ~/dev/vscode-settings-central
cd ~/dev/vscode-settings-central
git init
git add .
git commit -m "Initial VSCode centralized settings"
git remote add origin <tu-repo>
git push -u origin main

# En otra máquina
git clone <tu-repo> ~/.vscode-settings
# Y copiar configs al settings.json
```

### Opción 2: Sincronización con Cloud
- Usa **Settings Sync** de VSCode (built-in desde v1.48)
- Presiona `Cmd+Shift+P` → "Settings: Turn on Settings Sync"
- Se sincroniza automáticamente entre máquinas

### Opción 3: Archivo Manual
- Guarda en Google Drive, Dropbox, iCloud
- Sincroniza manualmente cuando hagas cambios

## 📝 Cómo Agregar Nuevas Configuraciones

1. **Configuración General**: Edita `.vscode-settings-base.json`
2. **Configuración por Stack**: Edita `.vscode-settings-by-stack.json`
3. Haz commit con mensaje claro:
   ```bash
   git commit -m "Add Prettier config for Flutter projects"
   ```

## ✅ Configuraciones Incluidas

### General (Base)
- ✅ Fuente: FiraCode Nerd Font + Ligaduras
- ✅ Editor: Word wrap, 2 espacios, importaciones auto
- ✅ Prettier como formateador por defecto
- ✅ ESLint fix y organize imports on save
- ✅ GitHub Copilot y GitLens AI
- ✅ Diff side-by-side

### TypeScript/JavaScript (Web Stack)
- ✅ Auto-close tags
- ✅ Format on type
- ✅ TSDK from node_modules

### Dart/Flutter (Flutter Stack)
- ✅ Format on save
- ✅ Dart Code formateador
- ✅ Snippets + Tab completion
- ✅ Line length 100

### Debugging
- ✅ LLDB para Xcode (macOS)
- ✅ Expresiones nativas
- ✅ Sin notificaciones de actualización

## 🔗 Rutas Importantes

**macOS:**
- Settings: `~/Library/Application Support/Code/User/settings.json`
- Extensions: `~/.vscode/extensions/`

**Linux:**
- Settings: `~/.config/Code/User/settings.json`

**Windows:**
- Settings: `%APPDATA%\Code\User\settings.json`

## 💡 Tips

1. **Personalización por Workspace**: Algunos proyectos necesitan `.vscode/settings.json` local
   ```bash
   mkdir .vscode
   echo '{ "dart.lineLength": 80 }' > .vscode/settings.json
   ```

2. **Conflictos de Extensiones**: Si hay problemas, desinstala versiones antiguas
   ```bash
   code --uninstall-extension <publisher>.<extension>
   ```

3. **Validación**: Después de cambios, reinicia VSCode
   ```bash
   Cmd+Shift+P → "Developer: Reload Window"
   ```

## 🐛 Solución de Problemas

| Problema | Solución |
|----------|----------|
| Prettier no formatea | Instala `esbenp.prettier-vscode` |
| ESLint no funciona | Instala `dbaeumer.vscode-eslint` |
| Flutter no reconoce SDK | Ajusta rutas en flutter-stack settings |
| Configuración no se aplica | Reinicia VSCode (Reload Window) |

---

**Última actualización:** 2026-07-08  
**Mantenedor:** Julilond  
**Versión:** 1.0.0
