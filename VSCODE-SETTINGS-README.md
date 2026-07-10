# VSCode Settings Central

Repositorio para centralizar configuraciones reutilizables de VS Code y Windows Terminal.

`settingsMAC.json` es un archivo compuesto para macOS. No es la base ni el snapshot historico.
Si existe `archive/settingsMAC original.json`, tratelo solo como referencia historica.

## Archivos VS Code

| Archivo | Uso |
| --- | --- |
| `vscode/settings.base.jsonc` | Configuracion portable para macOS, Windows y Linux |
| `vscode/settings.ai.jsonc` | Preferencias AI portables entre maquinas |
| `vscode/settings.web.jsonc` | Ajustes para TypeScript, JavaScript, Angular, Ionic o Node.js |
| `vscode/settings.flutter.jsonc` | Ajustes portables para Flutter/Dart |
| `vscode/settings.macos.jsonc` | Ajustes especificos de macOS, como LLDB/Xcode |
| `vscode/settings.windows.jsonc` | Ajustes especificos de Windows |
| `vscode/settings.linux.jsonc` | Ajustes especificos de Linux |
| `vscode/settings.context.work.jsonc` | Ajustes laborales o sensibles |
| `vscode/settings.context.personal.jsonc` | Ajustes personales |
| `vscode/settings.auto-approve.jsonc` | Auto-aprobaciones explicitas de terminal |
| `vscode/settingsMAC.json` | Composicion generada para macOS |

## Archivos Windows Terminal

| Archivo | Uso |
| --- | --- |
| `windows-terminal/settings.jsonc` | Plantilla para Windows Terminal |

Los archivos de VS Code y Windows Terminal no son intercambiables. Aunque ambos se llaman `settings.json` en sus aplicaciones reales, usan esquemas distintos.

## Archivos Shell

| Archivo | Uso |
| --- | --- |
| `shell/windows-powershell/Microsoft.PowerShell_profile.ps1` | Copia de referencia del perfil PowerShell de Windows |
| `shell/windows-powershell/profile.common.ps1` | Funciones y configuracion comun cargada por el perfil PowerShell |

Los archivos de shell son copias. No se aplican automaticamente ni modifican el perfil real.

## Como generar settings de VS Code

Para generar un `settings.json` final, copia los archivos indicados en el mismo orden.
Si una clave se repite, debe prevalecer el ultimo archivo de la lista.

### Base para cualquier maquina

Usar siempre:

```text
vscode/settings.base.jsonc
vscode/settings.ai.jsonc
```

Luego agrega solo los archivos que correspondan al sistema operativo, stack y contexto.

### Windows

Destino:

```text
%APPDATA%\Code\User\settings.json
```

Windows personal:

```text
vscode/settings.base.jsonc
vscode/settings.ai.jsonc
vscode/settings.windows.jsonc
vscode/settings.context.personal.jsonc
```

Windows laboral:

```text
vscode/settings.base.jsonc
vscode/settings.ai.jsonc
vscode/settings.windows.jsonc
vscode/settings.context.work.jsonc
```

### macOS

Destino:

```text
~/Library/Application Support/Code/User/settings.json
```

macOS personal:

```text
vscode/settings.base.jsonc
vscode/settings.ai.jsonc
vscode/settings.macos.jsonc
vscode/settings.context.personal.jsonc
```

macOS laboral:

```text
vscode/settings.base.jsonc
vscode/settings.ai.jsonc
vscode/settings.macos.jsonc
vscode/settings.context.work.jsonc
```

### Linux

Destino:

```text
~/.config/Code/User/settings.json
```

Linux personal:

```text
vscode/settings.base.jsonc
vscode/settings.ai.jsonc
vscode/settings.linux.jsonc
vscode/settings.context.personal.jsonc
```

Linux laboral:

```text
vscode/settings.base.jsonc
vscode/settings.ai.jsonc
vscode/settings.linux.jsonc
vscode/settings.context.work.jsonc
```

### Agregados por stack o flujo

Agregar despues del sistema operativo y contexto, solo si aplica:

```text
vscode/settings.web.jsonc
vscode/settings.flutter.jsonc
vscode/settings.auto-approve.jsonc
```

`vscode/settings.auto-approve.jsonc` no es personal ni laboral por si mismo. Usarlo solo si quieres permitir esas auto-aprobaciones de terminal en esa maquina.

### Ejemplos de composicion

Windows personal con proyectos web:

```text
vscode/settings.base.jsonc
vscode/settings.ai.jsonc
vscode/settings.windows.jsonc
vscode/settings.context.personal.jsonc
vscode/settings.web.jsonc
```

macOS con contexto laboral y proyectos web:

```text
vscode/settings.base.jsonc
vscode/settings.ai.jsonc
vscode/settings.macos.jsonc
vscode/settings.context.work.jsonc
vscode/settings.web.jsonc
vscode/settings.auto-approve.jsonc
```

Linux personal con Flutter:

```text
vscode/settings.base.jsonc
vscode/settings.ai.jsonc
vscode/settings.linux.jsonc
vscode/settings.context.personal.jsonc
vscode/settings.flutter.jsonc
```

## Como aplicar en VS Code

1. Abre VS Code.
2. Abre `Preferences: Open User Settings (JSON)`.
3. Copia los archivos de la seccion anterior segun la maquina.
4. Quita comentarios si VS Code los deja marcados como error.
5. Guarda y recarga la ventana.

## Reglas

- No copiar `vscode/settingsMAC.json` completo a nuevas maquinas.
- No poner rutas absolutas en `vscode/settings.base.jsonc`.
- No poner configuraciones laborales en `vscode/settings.base.jsonc`.
- Mantener `chat.tools.terminal.autoApprove` fuera de la base.
- No usar archivos de contexto personal o laboral en otra maquina salvo decision explicita.
- Usar `.jsonc` porque estos archivos tienen comentarios.
- No copiar configuracion de Windows Terminal dentro de VS Code, ni al reves.

## Como usar Windows Terminal

1. Abre Windows Terminal.
2. Abre `Settings`.
3. Usa `Open JSON file`.
4. Usa `windows-terminal/settings.jsonc` como referencia.

Ruta normal:

```text
%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
```

## Como usar el perfil PowerShell

Los archivos en `shell/windows-powershell/` son una copia del perfil actual y su archivo comun.
No los ejecutes como instalador. Usalos como referencia para copiar manualmente lo que quieras conservar en una nueva maquina.

Ruta normal del perfil en PowerShell:

```text
$PROFILE
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
