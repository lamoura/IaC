#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Leandro Moura

 Script Function:
	User Defined Functions to use Google Workspace services.

#ce ----------------------------------------------------------------------------


Func _GoogleChat_SendMsg($gc_url, $gc_text)
   ; Send a text message to Google Chat
   Local $message = "{'text': '" & $gc_text & "'}"
   Local $wHTTP = ObjCreate("WinHttp.WinHttpRequest.5.1")

   With $wHTTP
	  .Open("POST", $gc_url, 0)
	  .SetRequestHeader("Content-Type","application/json; charset=UTF-8")
	  .Send($message)
   EndWith

   Return($wHTTP.Status)
EndFunc


