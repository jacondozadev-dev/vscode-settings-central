# VSCode Settings Central

Repositorio para derivar configuraciones reutilizables desde `settingsMAC.json`.

`settingsMAC.json` es el snapshot original de una maquina macOS laboral. No se modifica.

## Archivos

| Archivo | Uso |
| --- | --- |
| `settings.base.jsonc` | Configuracion portable para macOS, Windows y Linux |
| `settings.ai.jsonc` | Preferencias de herramientas AI y auto-approve de URLs |
| `settings.web.jsonc` | Ajustes para TypeScript, JavaScript, Angular, Ionic o Node.js |
| `settings.flutter.jsonc` | Ajustes portables para Flutter/Dart |
| `settings.macos.jsonc` | Ajustes especificos de macOS, como LLDB/Xcode |
| `settings.windows.jsonc` | Ajustes especificos de Windows |
| `settings.linux.jsonc` | Ajustes especificos de Linux |
| `settings.work.jsonc` | Ajustes laborales o sensibles |
| `settingsMAC.json` | Fuente original; no editar como archivo normalizado |

## Como usar

1. Abre VS Code.
2. Abre `Preferences: Open User Settings (JSON)`.
3. Copia primero el contenido de `settings.base.jsonc`.
4. Agrega solo los archivos que apliquen a esa maquina o proyecto.
5. Si hay claves repetidas, gana la ultima que pegues en `settings.json`.

Ejemplos:

```text
Maquina personal Windows + web:
settings.base.jsonc
settings.ai.jsonc
settings.web.jsonc
settings.windows.jsonc
```

```text
Mac laboral + web:
settings.base.jsonc
settings.ai.jsonc
settings.web.jsonc
settings.macos.jsonc
settings.work.jsonc
```

```text
Linux + Flutter:
settings.base.jsonc
settings.flutter.jsonc
settings.linux.jsonc
```

## Reglas

- No copiar `settingsMAC.json` completo a nuevas maquinas.
- No poner rutas absolutas en `settings.base.jsonc`.
- No poner configuraciones laborales en `settings.base.jsonc`.
- Mantener `chat.tools.terminal.autoApprove` fuera de la base.
- Revisar `settings.ai.jsonc` antes de copiar auto-approve de URLs.
- Usar `.jsonc` porque estos archivos tienen comentarios.

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
