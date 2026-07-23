; --- RaddawiOS Installer Script ---
!define APPNAME "RaddawiOS"
!define EXENAME "raddawios.exe"
!define COMPANY "RaddawiSoft"

OutFile "${APPNAME}_Setup.exe"
InstallDir "$PROGRAMFILES\\${APPNAME}"
InstallDirRegKey HKLM "Software\\${COMPANY}\\${APPNAME}" "Install_Dir"

!include MUI2.nsh

; --- Branding ---
Name "RaddawiOS Setup"
Caption "RaddawiOS Setup Wizard"
!define MUI_ICON "RaddawiOS_multi.ico"
!define MUI_UNICON "RaddawiOS_multi.ico"

; --- Banner on the left ---
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "raddawios_logo.bmp"
!define MUI_HEADERIMAGE_LEFT

; --- Custom Page Text ---
!define MUI_WELCOMEPAGE_TITLE "Welcome to the RaddawiOS Setup Wizard"
!define MUI_WELCOMEPAGE_TEXT "This wizard will install RaddawiOS on your computer."
!define MUI_FINISHPAGE_TITLE "RaddawiOS Installation Complete"
!define MUI_FINISHPAGE_TEXT "Setup has finished installing RaddawiOS. Click Finish to exit."

; --- Finish Page Options ---
!define MUI_FINISHPAGE_RUN "$INSTDIR\\${EXENAME}"
!define MUI_FINISHPAGE_RUN_TEXT "Launch RaddawiOS now"
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\\readme.txt"
!define MUI_FINISHPAGE_SHOWREADME_TEXT "View ReadMe"
!define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
!define MUI_FINISHPAGE_NOAUTOCLOSE

; --- Installer Pages ---
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; --- Uninstaller Pages ---
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; --- Sections ---
Section "Main Program"
  SetOutPath $INSTDIR
  File "dist\\${EXENAME}"

  ; Registry entries for uninstall
  WriteRegStr HKLM "Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\${APPNAME}" "DisplayName" "${APPNAME}"
  WriteRegStr HKLM "Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\${APPNAME}" "UninstallString" "$INSTDIR\\Uninstall.exe"
  WriteRegStr HKLM "Software\\${COMPANY}\\${APPNAME}" "Install_Dir" "$INSTDIR"

  ; Shortcuts
  CreateDirectory "$SMPROGRAMS\\${APPNAME}"
  CreateShortCut "$SMPROGRAMS\\${APPNAME}\\${APPNAME}.lnk" "$INSTDIR\\${EXENAME}"
  CreateShortCut "$DESKTOP\\${APPNAME}.lnk" "$INSTDIR\\${EXENAME}"

  ; ReadMe file
  File "readme.txt"
SectionEnd

Section "Uninstall"
  Delete "$INSTDIR\\${EXENAME}"
  Delete "$DESKTOP\\${APPNAME}.lnk"
  Delete "$SMPROGRAMS\\${APPNAME}\\${APPNAME}.lnk"
  RMDir "$SMPROGRAMS\\${APPNAME}"
  RMDir "$INSTDIR"

  DeleteRegKey HKLM "Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\${APPNAME}"
  DeleteRegKey HKLM "Software\\${COMPANY}\\${APPNAME}"
SectionEnd
