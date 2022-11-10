#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Leandro Moura

 Script Function:
	A simple code which provides a function to get value from key in section of Microsoft Windows INI files.

#ce ----------------------------------------------------------------------------

#include <StringConstants.au3>

Func _Config_GetValue($ini_file_path, $ini_section, $ini_key)
   ; Get value from config key in ini file
   Local $oFSO     = ObjCreate("Scripting.FileSystemObject")
   Local $file 	   = StringStripWS($ini_file_path, $STR_STRIPLEADING + $STR_STRIPTRAILING)
   Local $section  = StringLower(StringStripWS($ini_section, $STR_STRIPLEADING + $STR_STRIPTRAILING))
   Local $key      = StringLower(StringStripWS($ini_key, $STR_STRIPLEADING + $STR_STRIPTRAILING))
   Local $value    = Null
   Local $comment  = ';'

   If $oFSO.FileExists($file) Then
	  $oFile = $oFSO.OpenTextFile($file, 1, False)
	  $section_found = False

	  While $oFile.AtEndOfStream = False
		 $line = StringStripWS($oFile.ReadLine, $STR_STRIPLEADING + $STR_STRIPTRAILING)

		 if StringLeft($line, 1) = $comment Then
			ContinueLoop
		 EndIf

		 If StringLower($line) = "[" & $section & "]" Then
			$section_found = True
			ContinueLoop
		 EndIf

		 if $section_found Then
			$value_splitted = StringSplit($line, "=")

			if $value_splitted[0] = 2 Then
			   if StringStripWS(StringLower($value_splitted[1]), $STR_STRIPLEADING + $STR_STRIPTRAILING) = $key Then
				  $value = StringStripWS($value_splitted[2], $STR_STRIPLEADING + $STR_STRIPTRAILING)
				  ExitLoop
			   EndIf
			EndIf
		 EndIf
	  WEnd

	  $oFile.Close
   EndIf

   Return $value
EndFunc