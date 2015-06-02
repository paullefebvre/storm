#tag Class
Protected Class Updater
Inherits Storm.DBUpdater
	#tag Event
		Sub Update(dbConn As Storm.DBConnection, dbVersion As Integer)
		  Select Case dbVersion
		  Case Is < 1
		    ProcessUpdate(BaseballSQL, 1) // Set up initial DB schema
		    
		  End Select
		End Sub
	#tag EndEvent


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
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
