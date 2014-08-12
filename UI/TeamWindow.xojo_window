#tag Window
Begin Window TeamWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   616698986
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Teams"
   Visible         =   True
   Width           =   600
   Begin Listbox TeamList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   181
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Team"
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   199
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   172
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label FieldLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   204
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Name:"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   154
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label FieldLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   204
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   "Coach:"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   186
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin TextField NameField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   316
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   154
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   264
   End
   Begin TextField CoachField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   316
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   186
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   264
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   40804817
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   128
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   128
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   204
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      Text            =   "Storm"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   24.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   376
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   84
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   204
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      Text            =   "An easy-to-use object-relational manager library for Xojo and SQLite."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   58
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   370
   End
   Begin TeamToolbar WindowToolbar
      Enabled         =   True
      Height          =   70
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   9
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   "0"
      Top             =   471
      Visible         =   True
      Width           =   550
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   18
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      Text            =   "Filter:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   163
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   52
   End
   Begin TextField FilterField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   82
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   162
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   110
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  LoadTeams
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AllPlayers()
		  Dim playerWin As New AllPlayersWindow
		  playerWin.Show
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearFields()
		  NameField.Text = ""
		  CoachField.Text = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EnableFields()
		  NameField.Enabled = True
		  CoachField.Enabled = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadTeams(filter As String = "")
		  TeamList.DeleteAllRows
		  
		  Dim allTeams() As Storm.DBObject
		  
		  Dim t As New Team
		  allTeams = t.GetAll(filter, "Name") // Sort by Name
		  
		  For Each o As Storm.DBObject In allTeams
		    t = Team(o)
		    
		    TeamList.AddRow(t.Name.StringValue)
		    TeamList.RowTag(TeamList.LastIndex) = t
		  Next
		  
		  TeamList.ListIndex = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NewTeam()
		  mCurrentTeam = New Team
		  ShowTeam
		  
		  EnableFields
		  
		  NameField.SetFocus
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Players()
		  If mCurrentTeam <> Nil Then
		    Dim playerWin As New PlayerWindow
		    playerWin.CurrentTeam = mCurrentTeam
		    playerWin.Show
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Save()
		  mCurrentTeam.Name = NameField.Text
		  mCurrentTeam.Coach = CoachField.Text
		  
		  If mCurrentTeam.Save Then
		    ClearFields
		    
		    LoadTeams
		  Else
		    MsgBox("Error saving")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Serialize()
		  Dim allTeams() As Storm.DBObject
		  
		  Dim t As New Team
		  allTeams = t.GetAll
		  
		  Dim xmlDoc As New XmlDocument
		  Dim root As XmlNode
		  root = xmlDoc.AppendChild(xmlDoc.CreateElement("baseball.sqlite"))
		  
		  Dim teams As XmlNode
		  teams = Storm.DBObject.Serialize(allTeams, root, xmlDoc)
		  
		  root.AppendChild(teams)
		  
		  Dim allPlayers() As Storm.DBObject
		  Dim p As New Player
		  allPlayers = p.GetAll
		  
		  Dim players As XmlNode
		  players = Storm.DBObject.Serialize(allPlayers, root, xmlDoc)
		  
		  root.AppendChild(players)
		  
		  Dim baseballFile As FolderItem
		  baseballFile = SpecialFolder.Desktop.Child("baseball.xml")
		  
		  Dim formattedXML As String = xmlDoc.Format
		  
		  Dim baseballOutput As TextOutputStream
		  baseballOutput = TextOutputStream.Create(baseballFile)
		  baseballOutput.WriteLine(formattedXML)
		  baseballOutput.Close
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowTeam()
		  NameField.Text = mCurrentTeam.Name
		  CoachField.Text = mCurrentTeam.Coach
		  
		  WindowToolbar.SaveButton.Enabled = True
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCurrentTeam As Team
	#tag EndProperty


#tag EndWindowCode

#tag Events TeamList
	#tag Event
		Sub Change()
		  If Me.ListIndex >= 0 Then
		    mCurrentTeam = Team(Me.RowTag(Me.ListIndex))
		    ShowTeam
		    
		    EnableFields
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WindowToolbar
	#tag Event
		Sub Action(item As ToolItem)
		  Select Case item.Name
		  Case "NewTeamButton"
		    NewTeam
		    
		  Case "PlayersButton"
		    Players
		    
		  Case "SaveButton"
		    Save
		    
		  Case "AllPlayersButton"
		    AllPlayers
		    
		  Case "SerializeButton"
		    Serialize
		    
		  End Select
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SaveButton.Enabled = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FilterField
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Key = Chr(13) Then
		    LoadTeams("Name LIKE '%" + Me.Text + "%' OR Coach LIKE '%" + Me.Text + "%'")
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"10 - Drawer Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
