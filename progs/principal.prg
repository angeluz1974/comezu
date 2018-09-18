_Screen.Caption="Reconversion Monetaria 2018"
_Screen.Visible= .F.
_Screen.Icon= 'icono.ICO'
_Screen.WindowState= 2
_Screen.ControlBox= .F.
Set Sysmenu To
Set Talk Off
Set Date BRITISH
Set Deleted On
Set Exclusive On
Set Century On
Set ENGINEBEHAVIOR 90
On Shutdown
Set Status Bar Off
On Error errHandler(Message( ))
*!*	agrego un objeto imagen
*!*	asignamos una imagen
_Screen.AddObject("imgFondo","image")
_Screen.imgFondo.Picture= 'C:\COMEZU\BOLIVARSOBERANO.JPG'
_Screen.imgFondo.Visible= .T.
_Screen.imgFondo.Width=_Screen.Width-2
_Screen.imgFondo.Height=_Screen.Height-2
_Screen.imgFondo.Top=(_Screen.Height-_Screen.imgFondo.Height)/2
_Screen.imgFondo.Left=(_Screen.Width-_Screen.imgFondo.Width)/2
_Screen.imgFondo.Anchor=240
_Screen.imgFondo.Stretch = 2
*!*	_screen.imgFondo.zorder(1)
Set Path To Data;Forms;PROGS;Menus;GRAPHICS;LIBS
Open Database Locfile("datosmedico.dbc")
_Screen.Visible= .T.
If File("reconversion.mem")
	Restore From reconversion
	If rec_proceso='S'
		Messagebox("Reconversion relaizada "+Transform(rec_fecha),0+48,"Aviso")
		Cancel
	Endif
Endif
Do Form reconversion
Read Events
Close All
Return
Function errHandler(Mess)
Messagebox(Mess,0+32,"Error")
Cancel
Return
