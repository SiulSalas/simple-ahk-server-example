#include, %A_ScriptDir%\lib\AHKhttp.ahk
#include, %A_ScriptDir%\lib\AHKsock.ahk
#Persistent
#SingleInstance, force
SetBatchLines, -1

paths := {}
paths["/"] := Func("HelloWorld")
paths["404"] := Func("NotFound")
paths["/turn_off"] := Func("TurnOff")
paths["/notify"] := Func("Notify")

server := new HttpServer()
server.SetPaths(paths)
server.Serve(8080)
return

NotFound(ByRef req, ByRef res) {
    res.SetBodyText("Page not found")
}

HelloWorld(ByRef req, ByRef res) {
    res.SetBodyText("Hello World")
    res.status := 200
}

TurnOff(ByRef req, ByRef res) {
  res.SetBodyText("OK")
  res.status := 200
  Run Shutdown /S /T 1
}

Notify(ByRef req, ByRef res) {
  res.SetBodyText("OK")
  res.status := 200
  MsgBox Your phone is lost!
}