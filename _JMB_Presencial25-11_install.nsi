; Merge.nsi
     ;
     ; Este instalador toma todos los archivos los instala en archivos de programas o en un directorio
     ; que el usuario seleccione, luego crea un desintalador además de crear en el menú de inicio
     ; crea accesos directos uno para el programa y otro para el desinstalado.
     ;
     ;--------------------------------
     
     ; Nombre del instalador
     Name "JMB_Presencial_install"
     
     ; El Archivo de Salida
     OutFile "JMB_Presencial_install.exe"
     
     ; El directorio default para la instalación
     InstallDir $DESKTOP\Presencial_JMB
     
     ; Clave en el registro de Windows chequeado para el directorio (Si existe, Este 
     ; se sobre escribirá en el viejo)
     InstallDirRegKey HKLM "Software\JMB_Presencial_install" "Install_Dir"
     
     ; Requerir permisos para Windows Vista
     RequestExecutionLevel admin
     
     ;--------------------------------
     
     ; Paginas
     
     Page components
     Page directory
     Page instfiles
     
     UninstPage uninstConfirm
     UninstPage instfiles
     
     ;--------------------------------
     
     ; El material para la instalación
     Section "JMB_Presencial_install (requerido)"
     
       SectionIn RO
       
       ; Toma el directorio de que se selecciona para la instalación.
     
       SetOutPath $INSTDIR
       
       ; Poner los Archivos a instalar
        File "DI_UT7_PresencialJMB.bat"
	    File "DI_UT7_PresencialJMB.jar"
        SetOutPath $INSTDIR\lib
		File "lib\*.*"
		SetOutPath $INSTDIR\src\help
		File "src\help\*.*"
		SetOutPath $INSTDIR\src\help\JavaHelpSearch
		File "src\help\JavaHelpSearch\*.*"
	    SetOutPath $INSTDIR\src\help\html
		File "src\help\html\*.*"
		SetOutPath $INSTDIR\src\help\html\imagenes
		File "src\help\html\imagenes\*.*"
	   
	   ;File "Listas.class"
       ;File "numero.class"
       ;File "Tranformaciones.class"
       ;File "VentanaPrincipal.class"
       ;File "VentanaPrincipal.exe"
     
       
       ; Escribimos los registros de instalación dentro del directorio del registro
       WriteRegStr HKLM SOFTWARE\JMB_Presencial_install "Install_Dir" "$INSTDIR"
       
       ; Escribimos las claves de desinstalación de Windows
     
       WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\JMB_Presencial_install" "DisplayName" "Merge"
       WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\JMB_Presencial_install" "UninstallString" '"$INSTDIR\uninstall.exe"'
       WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\JMB_Presencial_install" "NoModify" 1
       WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\JMB_Presencial_install" "NoRepair" 1
       WriteUninstaller "uninstall.exe"
       
     SectionEnd
     
     ; Sección opcional (Pudiera ser deshabilitada pero en este caso necesitamos crear todo.)
     Section "Start Menu Shortcuts"
     
      ; CreateDirectory "$SMPROGRAMS\JMB_Presencial_install" 
	  ; CreateShortCut "$SMPROGRAMS\JMB_Presencial_install\Uninstall.lnk"
	   ;"$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
       ;CreateShortCut 
	   ;SetOutPath
	   CreateShortCut "$DESKTOP\Presencial_JMB\Uninstall.lnk" "$INSTDIR\Uninstall.exe"  
	  ;CreateShortCut "$SMPROGRAMS\JMB_Presencial_install\${APPNAME}.lnk" "$INSTDIR\${APPNAME}.exe"  
	   CreateShortCut "$DESKTOP\Presencial_JMB\Uninstall.lnk" "$INSTDIR\Uninstall.exe"  
	   
	   ;"$SMPROGRAMS\JMB_Presencial_install\Uninstall.lnk" 
	   ;"$INSTDIR\DI_UT7_PresencialJMB.jar" "" 
	   ;"$INSTDIR\DI_UT7_PresencialJMB.jar" 0
       # Show Success message.
		MessageBox MB_OK "INSTALACION CORRECTA"
     SectionEnd 
     

	 
     ; Desinstalador
     
     Section "Uninstall"
       
  ; Remover las claves del Registro
     DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\JMB_install"
     DeleteRegKey HKLM SOFTWARE\JMB_Presencial_install

     
       ; Eliminados los archivos y los desinstalamos
       ;Delete $INSTDIR\ClaseVector.class
       ;Delete $INSTDIR\Listas.class
       ;Delete $INSTDIR\numero.class
	   
       Delete $INSTDIR\DI_UT7_PresencialJMB.jar
	   Delete $INSTDIR\DI_UT7_PresencialJMB.bat
       Delete $INSTDIR\lib\*.*      
	   Delete $INSTDIR\src\help\JavaHelpSearch\*.*
	   Delete $INSTDIR\src\help\html\*.*
	   Delete $INSTDIR\src\help\html\imagenes\*.*
	    Delete $INSTDIR\src\help\*.*	
       Delete $INSTDIR\uninstall.exe
     
	 
	 
       ; Eliminamos todos los accesos directos del menú de inicio
       Delete "$DESKTOP\Presencial_JMB\*.*"
     
       ; Eliminamos las carpetas creadas
       RMDir "$INSTDIR\src\help\html\imagenes"
	   RMDir "$INSTDIR\src\help\html"
	   RMDir "$INSTDIR\src\help\JavaHelpSearch"
	   RMDir "$INSTDIR\src\help"
	   RMDir "$INSTDIR\src"	
	   RMDir "$INSTDIR\lib"	   
	   RMDir "$INSTDIR\Presencial_JMB"
       RMDir "$INSTDIR"
	   ;RMDir "$INSTDIR"
     
     SectionEnd