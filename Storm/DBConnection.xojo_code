#tag Class
Protected Class DBConnection
	#tag Method, Flags = &h0
		Sub CancelTransaction()
		  If mInTransaction Then
		    mDatabase.Rollback
		    mInTransaction = False
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearLog()
		  Redim mSQLLog(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Connect(dbFile As FolderItem, password As String = "") As Boolean
		  If Not DebugBuild Then
		    ShowDemoMessage
		    Return False
		  End If
		  
		  mDatabase = New SQLiteDatabase
		  mDatabase.DatabaseFile = dbFile
		  If password <> "" Then
		    mDatabase.EncryptionKey = password
		  End If
		  
		  If dbFile = Nil Or Not dbFile.Exists Then
		    If SingleDatabase Then
		      // Create database in the system's application data folder
		      Dim dbFolder As FolderItem = SpecialFolder.ApplicationData.Child(GetAppFolderName)
		      If Not dbFolder.Exists Then
		        dbFolder.CreateAsFolder
		      End If
		      
		      mDatabase.DatabaseFile = dbFolder.Child(dbFile.Name)
		    End If
		    
		    If mDatabase.CreateDatabaseFile Then
		      mIsConnected = True
		    End If
		    
		  Else
		    If mDatabase.Connect Then
		      mIsConnected = True
		    Else
		      mIsConnected = False
		    End If
		  End If
		  
		  If mIsConnected Then
		    If Updater <> Nil Then
		      Updater.UpdateDatabase(Self)
		    End If
		    Return True
		  Else
		    Return False
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Connect(fileName As String, password As String = "") As Boolean
		  Dim dbFile As FolderItem
		  
		  If SingleDatabase Then
		    // Create database in the system's application data folder
		    Dim dbFolder As FolderItem = SpecialFolder.ApplicationData.Child(GetAppFolderName)
		    If Not dbFolder.Exists Then
		      dbFolder.CreateAsFolder
		    End If
		    
		    dbFile = dbFolder.Child(fileName)
		  End If
		  
		  If dbFile Is Nil Then
		    Return False
		  End If
		  
		  Return Connect(dbFile, password)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndTransaction()
		  If mInTransaction Then
		    mDatabase.Commit
		    mInTransaction = False
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetAppFolderName() As String
		  // Remove extension from App name
		  
		  Dim appName As String
		  
		  Dim extPos As Integer
		  extPos = App.ExecutableFile.Name.InStr(".")
		  
		  If extPos > 0 Then
		    appName = App.ExecutableFile.Name.Left(extPos-1)
		  Else
		    appName = App.ExecutableFile.Name
		  End If
		  
		  If appName.Left(5) = "Debug" Then
		    appname = appName.Right(appName.Len - 5)
		  End If
		  
		  Return appName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LogSQL(sql As String)
		  If EnableLogging Then
		    Dim log As New DBSQLLog
		    Dim now As New Date
		    log.DateTime = now
		    log.SQL = sql
		    
		    mSQLLog.Append(log)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Prepare(query As String) As PreparedSQLStatement
		  LogSQL(query)
		  
		  Return mDatabase.Prepare(query)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveLog(logFile As FolderItem) As Boolean
		  If logFile <> Nil And EnableLogging Then
		    Dim output As TextOutputStream
		    
		    output = TextOutputStream.Create(logFile)
		    
		    For Each log As DBSQLLog In mSQLLog
		      output.Write(log.DateTime.SQLDateTime)
		      output.Write(Chr(9))
		      output.WriteLine(log.SQL)
		    Next
		    output.Close
		    
		    Return True
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLExecute(sqlCommand As String) As Boolean
		  LogSQL(sqlCommand)
		  
		  mDatabase.SQLExecute(sqlCommand)
		  
		  If Not mDatabase.Error Or mDatabase.ErrorCode = 0 Then
		    If Not mInTransaction Then
		      mDatabase.Commit
		    End If
		    Return True
		  Else
		    Return False // Error
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelect(sqlQuery As String) As RecordSet
		  LogSQL(sqlQuery)
		  
		  Return mDatabase.SQLSelect(sqlQuery)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartTransaction() As Boolean
		  If Not mInTransaction Then
		    mDatabase.SQLExecute("BEGIN TRANSACTION")
		    
		    If Not mDatabase.Error Then
		      mInTransaction = True
		    Else
		      MsgBox("Error starting transaction: " + mDatabase.ErrorMessage)
		      Return False
		    End If
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Vacuum()
		  Call SQLExecute("VACUUM DATABASE")
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mDatabase
			End Get
		#tag EndGetter
		Database As SQLiteDatabase
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Shared Default As DBConnection
	#tag EndProperty

	#tag Property, Flags = &h0
		EnableLogging As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Return mInTransaction
		#tag EndNote
		#tag Getter
			Get
			  Return mInTransaction
			  
			End Get
		#tag EndGetter
		InTransaction As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIsConnected
			End Get
		#tag EndGetter
		IsConnected As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Return mDatabase.ErrorCode
		#tag EndNote
		#tag Getter
			Get
			  Return Database.ErrorCode
			End Get
		#tag EndGetter
		LastErrorCode As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mDatabase.ErrorMessage
			End Get
		#tag EndGetter
		LastErrorMessage As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mDatabase.LastRowID
			End Get
		#tag EndGetter
		LastRowID As Int64
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mDatabase As SQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInTransaction As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsConnected As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		mSQLLog() As DBSQLLog
	#tag EndProperty

	#tag Property, Flags = &h0
		SingleDatabase As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		Updater As Storm.DBUpdater
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="EnableLogging"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InTransaction"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsConnected"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastErrorCode"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastErrorMessage"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="SingleDatabase"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
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
	#tag EndViewBehavior
End Class
#tag EndClass
