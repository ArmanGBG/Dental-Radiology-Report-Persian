; Script generated for Inno Setup
#define MyAppName "Radiology Report"
#define MyAppVersion "1.0"
#define MyAppPublisher "Dr. Arman"
#define MyAppExeName "RadiologyReport.exe"

[Setup]
AppId={{A1B2C3D4-E5F6-7890-ABCD-1234567890AB}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=Radiology_Full_Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; فایل برنامه اصلی
Source: "dist\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
; فایل پیش‌نیاز (Visual C++)
Source: "vc_redist.x64.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
; نصب اتوماتیک پیش‌نیاز (بدون اینکه از کاربر سوالی بپرسد)
Filename: "{tmp}\vc_redist.x64.exe"; Parameters: "/install /passive /norestart"; StatusMsg: "Installing Microsoft Visual C++ Redistributable..."; Flags: waituntilterminated
; اجرای برنامه بعد از نصب
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#MyAppName}}"; Flags: nowait postinstall skipifsilent
