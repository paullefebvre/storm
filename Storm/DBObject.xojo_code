#tag Class
Protected Class DBObject
	#tag Method, Flags = &h0
		Function Children(name As String) As DBObject()
		  // Get all related children for the item
		  // Also need to determine the correct table name and key.  For example, if the transactions table has a
		  // key of TransactionID accounts.Child(transactions) should not strip off the "s"
		  
		  Dim childName As String
		  If name.Right(2) = "es" Then
		    childName = name.Left(name.Len-2)
		  ElseIf name.Right(1) = "s" Then
		    childName = name.Left(name.Len-1)
		  Else
		    childName = name
		  End If
		  
		  Dim child As DBObject
		  child = Factory.CreateNewInstance(childName, -1, mDatabaseConnection)
		  
		  Dim fk As String
		  fk = Self.TableName + kPrimaryKey
		  If child.HasColumn(fk) Then
		    Dim query As String
		    query = "SELECT ID FROM " + childName + " WHERE " + fk + " = " + Self.GetColumn(kPrimaryKey).StringValue
		    
		    Dim results As RecordSet
		    results = mDatabaseConnection.SQLSelect(query)
		    
		    Dim all() As DBObject
		    Dim one As DBObject
		    
		    If results <> Nil Then
		      While Not results.EOF
		        one = Factory.CreateNewInstance(childName, results.IdxField(1).Int64Value, mDatabaseConnection)
		        all.Append(one)
		        results.MoveNext
		      Wend
		    End If
		    
		    Return all
		  Else
		    Return Nil
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnNames() As String()
		  Dim cols() As String
		  
		  For Each key As Variant In mColumn.Keys
		    cols.Append(key.StringValue)
		  Next
		  
		  Return cols
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(dbConn As DBConnection = Nil)
		  If Initialize(dbConn) Then
		    
		    mIsNew = True
		    
		    // Fill dictionary with names of columns on the table so that we won't throw
		    // exceptions if they are accessed before they have a value
		    If dbConn <> Nil And dbConn.Database <> Nil Then
		      Dim cols As RecordSet
		      cols = dbConn.Database.FieldSchema(TableName)
		      
		      If cols <> Nil Then
		        While Not cols.EOF
		          mColumn.Value(cols.IdxField(1).StringValue) = ""
		          cols.MoveNext
		        Wend
		        cols.Close
		      Else
		        Raise New TableNotFoundException(Self)
		      End If
		    End If
		    
		    SetColumnTypes
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ID As Int64, dbConn As DBConnection = Nil)
		  If Initialize(dbConn) Then
		    
		    Dim query As String = "SELECT * FROM " + TableName + " WHERE " + PrimaryKey + " = ?"
		    
		    Dim sqlStatement As PreparedSQLStatement
		    sqlStatement = mDatabaseConnection.Prepare(query)
		    
		    sqlStatement.BindType(0, SQLitePreparedStatement.SQLITE_INT64)
		    sqlStatement.Bind(0, ID)
		    
		    Dim row As RecordSet
		    row = sqlStatement.SQLSelect()
		    
		    If row <> Nil Then
		      If Not row.EOF Then
		        For i As Integer = 1 To row.FieldCount
		          mColumn.Value(row.IdxField(i).Name) = row.IdxField(i).Value
		        Next
		        mIsDirty = False
		        SetColumn(PrimaryKey) = ID
		      Else
		        // Since the row was not in the database, then this is a new row
		        mIsNew = True
		        
		        // Populate Dictionary with empty values
		        For i As Integer = 1 To row.FieldCount
		          mColumn.Value(row.IdxField(i).Name) = ""
		        Next
		        mIsDirty = False
		        SetColumn(PrimaryKey) = ID
		        
		      End If
		      row.Close
		    Else
		      Raise New TableNotFoundException(Self)
		      
		      Return
		      
		    End If
		    
		    SetColumnTypes
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ID As String, dbConn As DBConnection = Nil)
		  If Initialize(dbConn) Then
		    
		    Dim query As String = "SELECT * FROM " + TableName + " WHERE " + PrimaryKey + " = " + ID.Quote
		    
		    Dim row As RecordSet
		    row = mDatabaseConnection.SQLSelect(query)
		    
		    If row <> Nil Then
		      If Not row.EOF Then
		        For i As Integer = 1 To row.FieldCount
		          mColumn.Value(row.IdxField(i).Name) = row.IdxField(i).Value
		        Next
		        mIsDirty = False
		        SetColumn(PrimaryKey) = ID
		      Else
		        // Since the row was not in the database, then this is a new row
		        mIsNew = True
		        
		        // Populate Dictionary with empty values
		        For i As Integer = 1 To row.FieldCount
		          mColumn.Value(row.IdxField(i).Name) = ""
		        Next
		        mIsDirty = False
		        SetColumn(PrimaryKey) = ID
		        
		      End If
		    Else
		      Raise New TableNotFoundException(Self)
		      
		      Return
		    End If
		    
		    SetColumnTypes
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(column As String, value As Variant, dbConn As DBConnection = Nil)
		  If Initialize(dbConn) Then
		    
		    Dim query As String = "SELECT * FROM " + TableName + " WHERE " + column + " = " + SqlValue(value)
		    
		    Dim row As RecordSet
		    row = mDatabaseConnection.SQLSelect(query)
		    
		    If row <> Nil Then
		      If Not row.EOF Then
		        For i As Integer = 1 To row.FieldCount
		          mColumn.Value(row.IdxField(i).Name) = row.IdxField(i).Value
		        Next
		        mIsDirty = False
		        SetColumn(PrimaryKey) = row.Field(PrimaryKey).Int64Value
		      Else
		        // Since the row was not in the database, then this is a new row
		        mIsNew = True
		        
		        PopulateDictionary(row)
		      End If
		      
		      row.Close
		    Else
		      Raise New TableNotFoundException(Self)
		      
		      Return
		      
		    End If
		    
		    SetColumnTypes
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Create(table As String, ID As Int64, dbConn As DBConnection = Nil) As DBObject
		  If sCache Is Nil Then
		    sCache = New Dictionary
		  End If
		  
		  // If the ID is already in the cache, then return that instance rather than creating a new instance
		  Dim cacheKey As String
		  cacheKey = table + Str(ID)
		  
		  If sCache.HasKey(cacheKey) Then
		    Return sCache.Value(cacheKey)
		  Else
		    // Load an instance and add it to the cache
		    Dim dbo As DBObject
		    dbo = Factory.CreateNewInstance(table, ID, dbConn)
		    
		    sCache.Value(cacheKey) = dbo
		    
		    Return dbo
		    
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Delete() As Boolean
		  Dim deleted As Boolean
		  deleted = DBObject.Delete(TableName, PrimaryKey, GetColumn(PrimaryKey).IntegerValue)
		  
		  If deleted Then
		    // Reset instance so that it acts as if it is new
		    mIsNew = True
		    
		    // Clear all column values
		    
		    // Remove PK value
		  End If 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Delete(table As String, primaryKey As String, id As Integer, dbConn As DBConnection = Nil) As Boolean
		  If dbConn = Nil Then
		    dbConn = DBConnection.Default
		  End If
		  
		  If id > 0 Then
		    Dim command AS String = "DELETE FROM " + table + " WHERE " + primaryKey + " = " + Str(id)
		    
		    If dbConn.SQLExecute(command) Then
		      Return True
		    Else
		      break
		      MsgBox "Error deleting from '" + table + "' table: " + dbConn.LastErrorMessage + EndOfLine + "Command:" + EndOfLine + command
		      
		      Return False
		    End If
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Deserialize(xml As XmlNode, usePrimaryKey As Boolean = True)
		  // Parse the supplied XML and populate this instance
		  // with its values
		  If xml = Nil Then Return
		  
		  Dim rowCount As Integer
		  rowCount = xml.ChildCount
		  
		  Dim timestamp As String
		  Dim dbTimestamp As String
		  Dim primaryKeyValue As Int64
		  Dim serverIDValue As String
		  
		  Dim tsNode As XmlNode
		  For i As Integer = 0 To rowCount-1
		    // Find the timestamp column
		    For j As Integer = 0 To xml.Child(i).ChildCount-1
		      If xml.Child(i).Child(j).Name = "timestamp" Then
		        tsNode = xml.Child(i).Child(j).FirstChild
		        
		        If tsNode <> Nil Then
		          timestamp = tsNode.Value
		        Else
		          timestamp = ""
		        End If
		      ElseIf xml.Child(i).Child(j).Name = PrimaryKey Then
		        primaryKeyValue = Val(xml.Child(i).Child(j).FirstChild.Value)
		      ElseIf xml.Child(i).Child(j).Name = "serverID" Then
		        serverIDValue = xml.Child(i).Child(j).FirstChild.Value
		      End If
		    Next
		    
		    // Need to get instance for the actual type
		    Dim dbo As DBObject
		    dbo = Factory.CreateNewInstance(TableName, primaryKeyValue, mDatabaseConnection)
		    
		    // If XML timestamp is after the DB timestamp we have for this row (or this is a new row) then
		    // apply the XML values to the DB
		    If dbo.IsNew Then
		      dbTimestamp = ""
		    Else
		      dbTimestamp = dbo.GetColumn("timestamp")
		    End If
		    If timestamp > dbTimestamp Then
		      // Process each column in XML and set its value in the class
		      
		      Dim dbValue As String
		      Dim colValue As String
		      Dim colName As String
		      Dim colNode As XmlNode
		      Dim pkValue As String
		      
		      For j As Integer = 0 To xml.Child(i).ChildCount-1
		        colName = xml.Child(i).Child(j).Name
		        
		        colNode = xml.Child(i).Child(j).FirstChild
		        If colNode <> Nil Then
		          colValue = colNode.Value
		        Else
		          colValue = ""
		        End If
		        
		        Select Case colName
		        Case PrimaryKey
		          'pkValue = colValue
		          Continue
		        Else
		          If mColumnType.Lookup(colName, "") <> "" Then
		            Select Case mColumnType.Value(colName)
		            Case 10 // Timestamp
		              dbValue = colValue
		            Case 12 // Boolean
		              If colValue = "T" Then
		                dbValue = "1"
		              Else
		                dbValue = "0"
		              End If
		            Case Else
		              Select Case colName
		              Case "date"
		                dbValue = colValue
		              Else
		                dbValue = DecodeURLComponent(colValue)
		              End Select
		            End Select
		          End If
		        End Select
		        
		        If mColumnType.Lookup(colName, "") <> "" Then
		          dbo.SetColumn(colName) = dbValue
		        End If
		        
		      Next
		      
		      Call dbo.Save
		      pkValue = dbo.GetColumn(PrimaryKey)
		      
		    End If
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Duplicate() As DBObject
		  Dim newObj As DBObject
		  newObj = Factory.CreateNewInstance(TableName, -1, mDatabaseConnection)
		  
		  // Assign all values of the current object to the new object except for the primary key
		  
		  Dim cols() As String
		  cols = ColumnNames
		  
		  For Each c As String In cols
		    If c <> PrimaryKey Then
		      newObj.SetColumn(c) = Self.GetColumn(c)
		    End If
		  Next
		  
		  Return newObj
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAll(where As String = "", sort As String = "") As DBObject()
		  // Return array of all rows for this table
		  
		  Dim query As String
		  query = "SELECT " + PrimaryKey + " FROM " + TableName
		  If where <> "" Then
		    query = query + " WHERE " + where
		  End If
		  
		  If sort <> "" Then
		    query = query + " ORDER BY " + sort
		  End If
		  
		  Dim results As RecordSet
		  results = mDatabaseConnection.SQLSelect(query)
		  
		  Dim all() As DBObject
		  Dim one As DBObject
		  
		  If results <> Nil Then
		    While Not results.EOF
		      one = Factory.CreateNewInstance(TableName, results.IdxField(1).Int64Value, mDatabaseConnection)
		      all.Append(one)
		      results.MoveNext
		    Wend
		  Else
		    Raise New InvalidSQLException(query)
		  End If
		  
		  Return all
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetColumn(columnName As String) As Variant
		  If mColumn.HasKey(columnName) Then
		    Return mColumn.Value(columnName)
		  Else
		    Dim fkName As String = columnName + kPrimaryKey // For example, TeamID
		    If mColumn.HasKey(fkName) Then
		      // We have a foreign key, so let's see if we can get an instance to the actual data
		      Dim ID As Int64
		      ID = mColumn.Value(fkName).Int64Value
		      
		      Dim fkDBObject As DBObject
		      fkDBObject = Factory.CreateNewInstance(columnName, ID, mDatabaseConnection) // Try to instantiate Team using TeamID as the key
		      
		      Return fkDBObject
		    End If
		    
		    Raise New ColumnNotFoundException(Self, columnName)
		  End If
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetColumnType(columnName As String) As String
		  // Return the type of the specified column
		  
		  Return mColumnType.Value(columnName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasColumn(columnName As String) As Boolean
		  Return mColumn.HasKey(columnName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Initialize(ByRef dbConn As DBConnection) As Boolean
		  If Not DebugBuild Then
		    ShowDemoMessage
		    Return False
		  End If
		  
		  If sCache Is Nil Then
		    sCache = New Dictionary
		  End If
		  
		  If dbConn = Nil Then
		    dbConn = DBConnection.Default
		  End If
		  
		  If Not dbConn.IsConnected Then
		    Raise New DatabaseNotConnectedException(Self)
		  End If
		  
		  mDatabaseConnection = dbConn
		  
		  mColumn = New Dictionary
		  mColumnType = New Dictionary
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Lookup(columnName As String) As Variant
		  // Any attempt to access a property/column that doesn't exist is referred here,
		  // where we return the column value from the Dictionary (if there is one)
		  
		  Return GetColumn(columnName)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Lookup(name As String, x As Boolean) As DBObject
		  // The x parameter is only there to allow you to refer to a FK as a DBObject and thus do
		  // syntax like this: myTable.RelatedTable(True).MyColumn
		  
		  // Syntax like this myTable.RelatedTable.Column won't work because myTable.RelatedTable is actually returned as a Variant
		  // and Variants cannot use Operator_Lookup
		  #Pragma Unused x
		  
		  Return Parent(name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Lookup(columnName As String, Assigns value As Variant)
		  SetColumn(columnName) = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parent(columnName As String) As DBObject
		  // Get the parent for this item
		  
		  Dim fkName As String = columnName + kPrimaryKey
		  If mColumn.HasKey(fkName) Then
		    // We have a foreign key, so let's see if we can get an instance to the actual data
		    Dim ID As Int64
		    ID = mColumn.Value(fkName).Int64Value
		    
		    Dim fkDBObject As DBObject
		    fkDBObject = Factory.CreateNewInstance(columnName, ID, mDatabaseConnection)
		    
		    Return fkDBObject
		  End If
		  
		  Raise New ColumnNotFoundException(Self, columnName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PopulateDictionary(row As RecordSet)
		  'Dim colRS As RecordSet
		  'colRS = mDatabaseConnection.Database.FieldSchema(TableName)
		  '
		  'If colRS <> Nil Then
		  'While Not colRS.EOF
		  'mColumn.Value(colRS.IdxField(1).StringValue) = ""
		  '
		  'colRS.MoveNext
		  'Wend
		  'End If
		  '
		  'mIsDirty = False
		  
		  For i As Integer = 1 To row.FieldCount
		    mColumn.Value(row.IdxField(i).Name) = ""
		  Next
		  mIsDirty = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Save() As Boolean
		  // Save the data in the Dictionary back to the database
		  
		  If Not mIsDirty Then Return True
		  
		  Dim command As String
		  Dim comma As String
		  
		  If mIsNew Then
		    // Insert data
		    command = "INSERT INTO " + TableName + " ("
		    
		    For Each colName As Variant In mColumn.Keys
		      If colName <> PrimaryKey Or mPrimaryKeyIsString Or UsePrimaryKeyValue Then
		        command = command + comma + colName.StringValue
		        comma = ","
		      End If
		    Next
		    
		    command = command + ") VALUES ("
		    comma = ""
		    
		    For Each colName As Variant In mColumn.Keys
		      If colName <> PrimaryKey Or mPrimaryKeyIsString Or UsePrimaryKeyValue Then
		        If colName = TimeStamp Then
		          command = command + comma + Now.SQLDateTime.Quote
		        Else
		          command = command + comma + sqlValue(mColumn.Value(colName))
		        End If
		        
		        comma = ","
		      End If
		    Next
		    
		    command = command + ")"
		    
		  Else
		    command = "UPDATE " + TableName + " SET "
		    
		    Dim now As Date
		    For Each colName As Variant In mColumn.Keys
		      If colName <> PrimaryKey And colName <> "serverID" Then
		        If colName = TimeStamp Then
		          command = command + comma + colName + " = " + Now.SQLDateTime.Quote
		        Else
		          command = command + comma + colName + " = " + sqlValue(mColumn.Value(colName))
		        End If
		        
		        comma = ","
		      End If
		    Next
		    
		    command = command + " WHERE " + PrimaryKey + " = " + SqlValue(GetColumn(PrimaryKey).StringValue)
		    
		  End If
		  
		  command = ReplaceAll(command, "0.0e+", "0") // Windows hack, apparently it's converting 0 to be 0.0e+ which is messing up the SQL
		  If mDatabaseConnection.SQLExecute(command) Then
		    mIsDirty = False
		    
		    If mIsNew Then
		      // Get last inserted ID
		      SetColumn(PrimaryKey) = mDatabaseConnection.LastRowID
		      mIsNew = False
		      
		      // Add this to the cache
		      sCache.Value(TableName + GetColumn(PrimaryKey).StringValue) = Self
		    End If
		    
		    Return True
		  Else
		    break
		    MsgBox "Error saving data to '" + TableName + "' table: " + mDatabaseConnection.LastErrorMessage + EndOfLine + "Command:" + EndOfLine + command
		    
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Serialize(objects() As DBObject, parentNode As XmlNode = Nil, xml As XmlDocument = Nil) As XmlNode
		  // Serialize a set of data by calling
		  // Serialize for each object and then combine all the nodes into one large node
		  
		  Dim setNode As XmlNode
		  
		  If objects.Ubound >= 0 Then
		    If xml = Nil Then
		      xml = New XmlDocument
		    End If
		    
		    Dim setElement As XmlElement
		    setElement = xml.CreateElement(objects(0).TableName + "s")
		    
		    If parentNode = Nil Then
		      setNode = xml.AppendChild(setElement)
		    Else
		      setNode = parentNode.AppendChild(setElement)
		    End If
		    
		    Dim objectNode As XmlNode
		    Dim childNode As XmlNode
		    
		    Try
		      For Each o As Storm.DBObject In objects
		        objectNode = o.Serialize(setNode, xml)
		        childNode = setNode.AppendChild(objectNode)
		      Next
		    Catch e As XmlException
		      MsgBox(e.Message)
		    End Try
		  End If
		  
		  Return setNode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Serialize(parentNode As XmlNode = Nil, xml As XmlDocument = Nil) As XMLNode
		  // Convert the data in this instance to an XML node
		  // Note that the table name needs to be converted to singular
		  
		  // <table>
		  //    <primaryKey>value</PrimaryKey>
		  //    <col1>value</col1>
		  //    <colX>value</colX>
		  // </table>
		  
		  Dim row As XmlNode
		  
		  Try
		    If xml = Nil Then
		      xml = New XmlDocument
		    End If
		    
		    Dim rowElement As XmlElement
		    
		    // Create the XML row for this data
		    rowElement = xml.CreateElement(SingularizeName)
		    
		    If parentNode = Nil Then
		      row = xml.AppendChild(rowElement)
		    Else
		      row = parentNode.AppendChild(rowElement)
		    End If
		    
		    Dim columnElement As XmlElement
		    Dim column As XmlNode
		    
		    // Add Primary Key as first column
		    'columnElement = xml.CreateElement(PrimaryKey)
		    'column = row.AppendChild(columnElement)
		    'column.AppendChild(xml.CreateTextNode(Self.GetColumn(PrimaryKey)))
		    
		    // Create an XML column for for each column in the data (skip the primary key)
		    Dim xmlValue As String
		    For Each c As String In Self.ColumnNames
		      If c <> Self.PrimaryKey Then
		        columnElement = xml.CreateElement(c)
		        column = row.AppendChild(columnElement)
		        
		        Select Case mColumnType.Value(c)
		        Case 10 // Timestamp
		          xmlValue = Self.GetColumn(c)
		        Case 12 // Boolean
		          If Self.GetColumn(c).BooleanValue Then
		            xmlValue = "T"
		          Else
		            xmlValue = "F"
		          End If
		        Case Else
		          xmlValue = EncodeURLComponent(Self.GetColumn(c))
		        End Select
		        
		        // Convert data values to ISO861 format
		        Select Case c
		        Case "timestamp", "date", "dateFrom", "dateTo", "expirationDate"
		          xmlValue = Self.GetColumn(c)
		        End Select
		        
		        column.AppendChild(xml.CreateTextNode(xmlValue))
		      End If
		    Next
		    
		  Catch e As XmlException
		    MsgBox(e.Message)
		  End Try
		  
		  Return row
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetColumn(columnName As String, Assigns value As Variant)
		  // Look up the column in the dictionary and return the value
		  
		  If mColumn.HasKey(columnName) Then
		    If mColumn.Value(columnName) <> value Then
		      mColumn.Value(columnName) = value
		      mIsDirty = True
		    End If
		  Else
		    Raise New ColumnNotFoundException(Self, columnName)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetColumnTypes()
		  Dim cols As RecordSet
		  cols = mDatabaseConnection.Database.FieldSchema(TableName)
		  
		  If cols <> Nil Then
		    While Not cols.EOF
		      mColumnType.Value(cols.IdxField(1).StringValue) = cols.IdxField(2).StringValue
		      cols.MoveNext
		    Wend
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SingularizeName() As String
		  Dim singularTableName As String
		  
		  If TableName.Right(3) = "ies" Then
		    singularTableName = TableName.Left(TableName.Len-3) + "y"
		  ElseIf TableName.Right(3) = "ees" Then
		    singularTableName = TableName.Left(TableName.Len-1)
		  ElseIf TableName.Right(2) = "es" Then
		    singularTableName = TableName.Left(TableName.Len-2)
		  ElseIf TableName.Right(1) = "s" Then
		    singularTableName = TableName.Left(TableName.Len-1)
		  Else
		    singularTableName = TableName
		  End If
		  
		  Return singularTableName
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SqlValue(value As Variant) As String
		  // Return the value as a string to add to an SQL statement
		  
		  Dim sqlString As String
		  
		  Select Case VarType(value)
		  Case 0
		    sqlString = "''"
		  Case 2, 3, 4 // Integer
		    sqlString = Format(value.DoubleValue, "#")
		  Case 5, 6 // Double
		    sqlString = Str(value.CurrencyValue)
		  Case 8 // String
		    sqlString = ReplaceAll(value.StringValue, "'", "''").Quote
		  Case 11 // Boolean
		    'sqlString = "'" + value + "'"
		    If value.BooleanValue Then
		      sqlString = "1"
		    Else
		      sqlString = "0"
		    End If
		  End Select
		  
		  Return sqlString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TableName() As String
		  // Use Introspection to get the table name.
		  
		  If mTableName = "" Then
		    Dim t As Introspection.TypeInfo = Introspection.GetType(Self)
		    
		    mTableName = t.Name
		  End If
		  
		  Return mTableName
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mDatabaseConnection <> Nil Then
			    If mDatabaseConnection.Database <> Nil Then
			      If mDatabaseConnection.Database.DatabaseFile <> Nil Then
			        Return mDatabaseConnection.Database.DatabaseFile.Name
			      End If
			    End If
			  End If
			End Get
		#tag EndGetter
		DatabaseName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Shared Factory As DBObjectFactory
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIsNew
			End Get
		#tag EndGetter
		IsNew As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mColumn As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mColumnType As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mDatabaseConnection As DBConnection
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mIsDirty As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mIsNew As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPrimaryKey As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPrimaryKeyIsString As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTableName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimeStamp As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // For for primary keys that are not simply called "ID"
			  // If the user specifies an attribute for the subclass, then we'll use that as the primary key name
			  // Otherwise we use kPrimaryKey
			  
			  // If we cannot check the attribute, then instead have the constructor save the name of the primary
			  // key when it is loading all the column names (IsPrimary in FieldSchema)
			  
			  // Checks the PrimaryKey attribute of the class to get the name of the primary key to use
			  // for this object (instead of just defaulting to "ID")
			  
			  If mPrimaryKey = "" Then
			    Dim attribs() As Introspection.AttributeInfo
			    attribs = Introspection.GetType(Self).GetAttributes
			    
			    For Each attrib As Introspection.AttributeInfo In attribs
			      If attrib.Name = "PrimaryKey" Then
			        Dim key As String = attrib.Value.StringValue
			        
			        mPrimaryKey = key
			        Return key
			      End If
			    Next
			    
			    If mPrimaryKey = "" Then
			      mPrimaryKey = kPrimaryKey
			    End If
			    
			  End If
			  
			  Return mPrimaryKey
			End Get
		#tag EndGetter
		PrimaryKey As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared sCache As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  // Checks the TimeStamp attribute of the class to get the name of the timestamp field to use
			  // for this object when saving
			  
			  If mTimeStamp = "" Then
			    Dim attribs() As Introspection.AttributeInfo
			    attribs = Introspection.GetType(Self).GetAttributes
			    
			    For Each attrib As Introspection.AttributeInfo In attribs
			      If attrib.Name = "TimeStamp" Then
			        mTimeStamp = attrib.Value
			        Exit For
			      End If
			    Next
			    
			    If mTimeStamp = "" Then
			      mTimeStamp = "n/a"
			    End If
			    
			  End If
			  
			  Return mTimeStamp
			End Get
		#tag EndGetter
		Private TimeStamp As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		UsePrimaryKeyValue As Boolean
	#tag EndProperty


	#tag Constant, Name = kPrimaryKey, Type = String, Dynamic = False, Default = \"ID", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="DatabaseName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsNew"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
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
			Name="PrimaryKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="UsePrimaryKeyValue"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
