#tag Class
Protected Class DBUpdater
	#tag Method, Flags = &h21
		Private Function GetPragmaDBVersion() As Integer
		  If UsePragmaUserVersion Then
		    Dim version As Integer
		    
		    Dim result As RecordSet
		    result = mDBConn.Database.SQLSelect("PRAGMA user_version")
		    
		    If result <> Nil Then
		      version = result.IdxField(1).IntegerValue
		    Else
		      version = -1
		    End If
		    
		    Return version
		  Else
		    Return GetDBVersion(mDBConn)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ProcessSQLCommands(sqlCommands() As String) As Boolean
		  For Each command As String In sqlCommands
		    command = command.Trim
		    mDBConn.Database.SQLExecute(command)
		    
		    If mDBConn.Database.Error Then
		      MsgBox("Databasebase Error:" + mDBConn.Database.ErrorMessage + EndOfLine + EndOfLine + "Command: " + command)
		      Return False
		    End If
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ProcessUpdate(updateSQL As String, dbVersion As Integer)
		  Dim sql() As String
		  sql = updateSQL.Split(";")
		  
		  mDBConn.Database.SQLExecute("BEGIN TRANSACTION")
		  If Not ProcessSQLCommands(sql) Then
		    mDBConn.Database.Rollback
		    Return
		  End If
		  
		  mDBConn.Database.Commit
		  
		  UpdatePragmaDBVersion(dbVersion)
		  
		  UpdateDatabase
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateDatabase()
		  Update(mDBConn, GetPragmaDBVersion)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateDatabase(dbConn As DBConnection)
		  mDBConn = dbConn
		  
		  Update(dbConn, GetPragmaDBVersion)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdatePragmaDBVersion(version As Integer)
		  // Update DB version
		  If UsePragmaUserVersion Then
		    mDBConn.Database.SQLExecute("PRAGMA user_version = " + Str(version))
		    mDBConn.Database.Commit
		  Else
		    UpdateDBVersion(mDBConn, version)
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event GetDBVersion(dbConn As DBConnection) As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Update(dbConn As DBConnection, dbVersion As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UpdateDBVersion(dbConn As DBConnection, dbVersion As Integer)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mDBConn As DBConnection
	#tag EndProperty

	#tag Property, Flags = &h0
		UsePragmaUserVersion As Boolean = True
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UsePragmaUserVersion"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
