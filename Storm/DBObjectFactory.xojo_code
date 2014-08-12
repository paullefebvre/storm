#tag Class
Protected Class DBObjectFactory
	#tag Method, Flags = &h0
		Sub AddClassToMap(dbo As DBObject)
		  Dim info As Introspection.TypeInfo = Introspection.GetType(dbo)
		  mClassMap.Value(info.Name) = info
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddClassToMap(ti as Introspection.TypeInfo)
		  mClassMap.Value(ti.Name) = ti
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mClassMap = New Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateNewInstance(type as String, ID As Int64, dbConn As DBConnection = Nil) As DBObject
		  Dim typeFo As Introspection.TypeInfo = mClassMap.Lookup(type, Nil)
		  If typeFo <> Nil Then
		    // Get the constructors for the type
		    Dim info() As Introspection.ConstructorInfo = typeFo.GetConstructors
		    
		    // If we have no default constructor, then we cannot create
		    // this class, and that is an error.  So look for a default constructor,
		    // and call it if we can
		    For i As Integer = 0 To UBound(info)
		      'If UBound(info(i).GetParameters) = -1 Then
		      '// Found one!
		      'Return info(i).Invoke
		      'End If
		      
		      If UBound(info(i).GetParameters) = 0 And ID = -1 Then
		        // Instantiate the class
		        Dim params() As Variant
		        params.Append(dbConn)
		        Return info(i).Invoke(params)
		      End If
		      
		      If UBound(info(i).GetParameters) = 1 Then
		        // Instantiate the class
		        Dim params() As Variant
		        params.Append(ID)
		        params.Append(dbConn)
		        Return info(i).Invoke(params)
		      End If
		      
		    Next i
		    
		    // If we got here, then we couldn't find a default constructor, and
		    // we need to bail out
		    Raise New RuntimeException
		  End If
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mClassMap As Dictionary
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
	#tag EndViewBehavior
End Class
#tag EndClass
