# VSCode Settings Central

Repositorio para derivar configuraciones reutilizables desde `settingsMAC.json`.

`settingsMAC.json` es el snapshot original de una maquina macOS laboral. No se modifica.

## Archivos VS Code

| Archivo | Uso |
| --- | --- |
| `settings.base.jsonc` | Configuracion portable para macOS, Windows y Linux |
| `settings.ai.base.jsonc` | Preferencias AI portables entre maquinas |
| `settings.ai.windows-personal.jsonc` | Preferencias AI de Windows personal |
| `settings.web.jsonc` | Ajustes para TypeScript, JavaScript, Angular, Ionic o Node.js |
| `settings.flutter.jsonc` | Ajustes portables para Flutter/Dart |
| `settings.macos.jsonc` | Ajustes especificos de macOS, como LLDB/Xcode |
| `settings.windows.jsonc` | Ajustes especificos de Windows |
| `settings.linux.jsonc` | Ajustes especificos de Linux |
| `settings.work.jsonc` | Ajustes laborales o sensibles |
| `settingsMAC.json` | Fuente original; no editar como archivo normalizado |

## Archivos Windows Terminal

| Archivo | Uso |
| --- | --- |
| `windows-terminal.settings.jsonc` | Plantilla para Windows Terminal |

Los archivos de VS Code y Windows Terminal no son intercambiables. Aunque ambos se llaman `settings.json` en sus aplicaciones reales, usan esquemas distintos.

## Como generar settings de VS Code

Para generar un `settings.json` final, copia los archivos indicados en el mismo orden.
Si una clave se repite, debe prevalecer el ultimo archivo de la lista.

### Base para cualquier maquina

Usar siempre:

```text
settings.base.jsonc
settings.ai.base.jsonc
```

Luego agrega solo los archivos que correspondan al sistema operativo, stack y contexto.

### Windows

Destino:

```text
%APPDATA%\Code\User\settings.json
```

Usar:

```text
settings.base.jsonc
settings.ai.base.jsonc
settings.windows.jsonc
```

Opcional segun el caso:

```text
settings.ai.windows-personal.jsonc
settings.web.jsonc
settings.flutter.jsonc
settings.work.jsonc
```

### macOS

Destino:

```text
~/Library/Application Support/Code/User/settings.json
```

Usar:

```text
settings.base.jsonc
settings.ai.base.jsonc
settings.macos.jsonc
```

Opcional segun el caso:

```text
settings.web.jsonc
settings.flutter.jsonc
settings.work.jsonc
```

### Linux

Destino:

```text
~/.config/Code/User/settings.json
```

Usar:

```text
settings.base.jsonc
settings.ai.base.jsonc
settings.linux.jsonc
```

Opcional segun el caso:

```text
settings.web.jsonc
settings.flutter.jsonc
settings.work.jsonc
```

### Ejemplos de composicion

Windows con proyectos web:

```text
settings.base.jsonc
settings.ai.base.jsonc
settings.windows.jsonc
settings.web.jsonc
```

macOS con contexto laboral y proyectos web:

```text
settings.base.jsonc
settings.ai.base.jsonc
settings.macos.jsonc
settings.web.jsonc
settings.work.jsonc
```

Linux con Flutter:

```text
settings.base.jsonc
settings.ai.base.jsonc
settings.linux.jsonc
settings.flutter.jsonc
```

## Como aplicar en VS Code

1. Abre VS Code.
2. Abre `Preferences: Open User Settings (JSON)`.
3. Copia los archivos de la seccion anterior segun la maquina.
4. Quita comentarios si VS Code los deja marcados como error.
5. Guarda y recarga la ventana.

## Reglas

- No copiar `settingsMAC.json` completo a nuevas maquinas.
- No poner rutas absolutas en `settings.base.jsonc`.
- No poner configuraciones laborales en `settings.base.jsonc`.
- Mantener `chat.tools.terminal.autoApprove` fuera de la base.
- No usar archivos de un contexto especifico en otra maquina salvo decision explicita.
- Usar `.jsonc` porque estos archivos tienen comentarios.
- No copiar configuracion de Windows Terminal dentro de VS Code, ni al reves.

## Como usar Windows Terminal

1. Abre Windows Terminal.
2. Abre `Settings`.
3. Usa `Open JSON file`.
4. Usa `windows-terminal.settings.jsonc` como referencia.

Ruta normal:

```text
%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
```

## Extensiones sugeridas

Web:

```bash
code --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint
code --install-extension Angular.ng-template
```

Flutter:

```bash
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter
```

Utilidades:

```bash
code --install-extension eamodio.gitlens
code --install-extension GitHub.copilot
```

## Rutas de settings.json

| Sistema | Ruta |
| --- | --- |
| macOS | `~/Library/Application Support/Code/User/settings.json` |
| Linux | `~/.config/Code/User/settings.json` |
| Windows | `%APPDATA%\Code\User\settings.json` |
