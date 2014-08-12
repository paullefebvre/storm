#tag Module
Protected Module XMLExtensions
	#tag Method, Flags = &h0
		Function Format(Extends xml As XmlDocument) As String
		  Return xml.Transform(kIndentXML)
		End Function
	#tag EndMethod


	#tag Constant, Name = kIndentXML, Type = String, Dynamic = False, Default = \"<\?xml version\x3D\"1.0\" encoding\x3D\"UTF-8\"\?>\r<xsl:transform version\x3D\"1.0\" xmlns:xsl\x3D\"http://www.w3.org/1999/XSL/Transform\">\r\t<xsl:output method\x3D\"xml\" indent\x3D\"yes\" />\r\t<xsl:template match\x3D\"/\">\r\t\t<xsl:copy-of select\x3D\"/\" />\r\t</xsl:template>\r</xsl:transform>", Scope = Private
	#tag EndConstant


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
End Module
#tag EndModule
