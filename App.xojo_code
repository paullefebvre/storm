#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub Closing()
		  Var logFile As FolderItem = SpecialFolder.Desktop.Child("StormLog.txt")
		  
		  Call Storm.DBConnection.Default.SaveLog(logFile)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  App.AllowAutoQuit = True
		  
		  If ConnectToDatabase Then
		    AddDBObjectsToFactory
		    
		    TeamWindow.Show
		  End If
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function HelpStormonGithub() As Boolean Handles HelpStormonGithub.Action
		  System.GotoURL("https://github.com/paullefebvre/storm/wiki")
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub AddDBObjectsToFactory()
		  Var factory As New Storm.DBObjectFactory
		  
		  factory.AddClassToMap(GetTypeInfo(Team))
		  factory.AddClassToMap(GetTypeInfo(Player))
		  
		  Storm.DBObject.Factory = factory
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ConnectToDatabase() As Boolean
		  Storm.DBConnection.Default = New Storm.DBConnection
		  Storm.DBConnection.Default.Updater = New Updater
		  Storm.DBConnection.Default.EnableLogging = True
		  
		  If Not Storm.DBConnection.Default.Connect("Baseball.sqlite") Then
		    Return False
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
