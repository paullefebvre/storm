#tag Class
Protected Class DBConnection
	#tag Method, Flags = &h0
		Sub CancelTransaction()
		  If mInTransaction Then
		    mDatabase.RollbackTransaction
		    mInTransaction = False
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearLog()
		  mSQLLog.RemoveAll
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Connect(dbFile As FolderItem, password As String = "") As Boolean
		  mDatabase = New SQLiteDatabase
		  mDatabase.DatabaseFile = dbFile
		  If password <> "" Then
		    mDatabase.EncryptionKey = password
		  End If
		  
		  If dbFile = Nil Or Not dbFile.Exists Then
		    If SingleDatabase Then
		      // Create database in the system's application data folder
		      Var dbFolder As FolderItem = SpecialFolder.ApplicationData.Child(GetAppFolderName)
		      If Not dbFolder.Exists Then
		        dbFolder.CreateFolder
		      End If
		      
		      mDatabase.DatabaseFile = dbFolder.Child(dbFile.Name)
		    End If
		    
		    Try
		      mDatabase.CreateDatabase
		      mIsConnected = True
		    Catch e As DatabaseException
		      mIsConnected = False
		    End Try
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
		  Var dbFile As FolderItem
		  
		  If SingleDatabase Then
		    // Create database in the system's application data folder
		    Var dbFolder As FolderItem = SpecialFolder.ApplicationData.Child(GetAppFolderName)
		    If Not dbFolder.Exists Then
		      dbFolder.CreateFolder
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
		    mDatabase.CommitTransaction
		    mInTransaction = False
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetAppFolderName() As String
		  // Remove extension from App name
		  
		  Var appName As String
		  
		  Var extPos As Integer
		  extPos = App.ExecutableFile.Name.IndexOf(".")
		  
		  If extPos >= 0 Then
		    appName = App.ExecutableFile.Name.Left(extPos)
		  Else
		    appName = App.ExecutableFile.Name
		  End If
		  
		  If appName.Left(5) = "Debug" Then
		    appname = appName.Right(appName.Length - 5)
		  End If
		  
		  Return appName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LogSQL(sql As String)
		  If EnableLogging Then
		    Var log As New DBSQLLog
		    log.DateTime = DateTime.Now
		    log.SQL = sql
		    
		    mSQLLog.Add(log)
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
		    Var output As TextOutputStream
		    
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
		  
		  Try
		    mDatabase.ExecuteSQL(sqlCommand)
		    
		    If mInTransaction Then
		      mDatabase.CommitTransaction
		    End If
		    
		    Return True
		    
		  Catch e As DatabaseException
		    mLastErrorCode = e.ErrorNumber
		    mLastErrorMessage = e.Message
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLExecute(sqlCommand as String, values() as Variant) As Boolean
		  LogSQL(sqlCommand)
		  
		  Try
		    mDatabase.ExecuteSQL(sqlCommand, values)
		    
		    If mInTransaction Then
		      mDatabase.CommitTransaction
		    End If
		    
		    Return True
		    
		  Catch e As DatabaseException
		    mLastErrorCode = e.ErrorNumber
		    mLastErrorMessage = e.Message
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelect(sqlQuery As String) As RowSet
		  LogSQL(sqlQuery)
		  
		  Return mDatabase.SelectSQL(sqlQuery)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelect(sqlQuery as String, values() as Variant) As RowSet
		  LogSQL(sqlQuery)
		  
		  Return mDatabase.SelectSQL(sqlQuery, values)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartTransaction() As Boolean
		  If Not mInTransaction Then
		    Try
		      mDatabase.BeginTransaction
		      mInTransaction = True
		    Catch e As DatabaseException
		      MessageBox("Error starting transaction: " + e.Message)
		      Return False
		    End Try
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
			  Return mLastErrorCode
			End Get
		#tag EndGetter
		LastErrorCode As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mLastErrorMessage
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

	#tag Property, Flags = &h21
		Private mLastErrorCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastErrorMessage As String
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
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InTransaction"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsConnected"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastErrorMessage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="SingleDatabase"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
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
			Name="LastRowID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Int64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastErrorCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
