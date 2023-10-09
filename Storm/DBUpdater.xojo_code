#tag Class
Protected Class DBUpdater
	#tag Method, Flags = &h21
		Private Function GetPragmaDBVersion() As Integer
		  If UsePragmaUserVersion Then
		    Var version As Integer
		    
		    Var result As RowSet
		    result = mDBConn.Database.SelectSQL("PRAGMA user_version")
		    
		    If result <> Nil Then
		      version = result.ColumnAt(0).IntegerValue
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
		    
		    Try
		      mDBConn.Database.ExecuteSQL(command)
		    Catch e As DatabaseException
		      MessageBox("Databasebase Error:" + e.Message + EndOfLine + EndOfLine + "Command: " + command)
		      Return False
		    End Try
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ProcessUpdate(updateSQL As String, dbVersion As Integer)
		  Var sql() As String
		  sql = updateSQL.Split(";")
		  
		  mDBConn.Database.BeginTransaction
		  If Not ProcessSQLCommands(sql) Then
		    mDBConn.Database.RollbackTransaction
		    Return
		  End If
		  
		  mDBConn.Database.CommitTransaction
		  
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
		    mDBConn.Database.ExecuteSQL("PRAGMA user_version = " + Str(version))
		    mDBConn.Database.CommitTransaction
		  Else
		    UpdateDBVersion(mDBConn, version)
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event GetDBVersion(dbConn As DBConnection) As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Update(dbConn As Storm.DBConnection, dbVersion As Integer)
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
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UsePragmaUserVersion"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
