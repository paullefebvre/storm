#tag Module
Protected Module Storm
	#tag Method, Flags = &h0
		Function Now() As DateTime
		  Return DateTime.Now
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Quote(Extends s As String) As String
		  Return "'" + s.ReplaceAll("'", "''") + "'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Version() As String
		  Return kStormVersion
		End Function
	#tag EndMethod


	#tag Note, Name = Change History
		
		== v1.1 ==
		Initial release by Paul Lefebvre
		https://github.com/paullefebvre/storm
		
		== v1.2 == 2024-05-25
		Update by Jeremie Leroy
		- Fixed a possible SQL Injection
		- Added SerializeJSON Method
		- Added DBObject.kUseNilValues Constant to initialize columns with Nil values instead of an empty string
	#tag EndNote

	#tag Note, Name = Storm License
		Copyright (c) 2014, Paul Lefebvre
		All rights reserved.
		
		Redistribution and use in source and binary forms, with or without
		modification, are permitted provided that the following conditions are met:
		
		* Redistributions of source code must retain the above copyright notice, this
		list of conditions and the following disclaimer.
		
		* Redistributions in binary form must reproduce the above copyright notice,
		this list of conditions and the following disclaimer in the documentation
		and/or other materials provided with the distribution.
		
		THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
		AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
		IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
		DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
		FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
		DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
		SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
		CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
		OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
		OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
		
		
		
	#tag EndNote


	#tag Constant, Name = kStormVersion, Type = String, Dynamic = False, Default = \"1.2.0", Scope = Private
	#tag EndConstant


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
	#tag EndViewBehavior
End Module
#tag EndModule
