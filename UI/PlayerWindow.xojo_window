#tag Window
Begin Window PlayerWindow
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
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Players"
   Visible         =   True
   Width           =   600
   Begin Listbox PlayerList
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
      Height          =   333
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Player"
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   True
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   185
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
      Left            =   240
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Name:"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   37
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
      Left            =   240
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Age:"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   69
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
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   240
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Positions"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   101
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
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   240
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Email:"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   133
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton SaveButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Save"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   500
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   165
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin TextField NameField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   
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
      Left            =   363
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   36
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   217
   End
   Begin TextField AgeField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   
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
      Left            =   363
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   68
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   217
   End
   Begin TextField PositionsField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   
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
      Left            =   363
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   100
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   217
   End
   Begin TextField EmailField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   
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
      Left            =   363
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   132
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   217
   End
   Begin BevelButton NewPlayerButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "New Player"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   0
      Scope           =   "0"
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   359
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   185
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub EnableFields()
		  NameField.Enabled = True
		  AgeField.Enabled = True
		  PositionsField.Enabled = True
		  EmailField.Enabled = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadPlayers()
		  PlayerList.DeleteAllRows
		  
		  Dim allPlayers() As Storm.DBObject
		  
		  allPlayers = mCurrentTeam.Children("Players")
		  
		  Dim p As Player
		  For Each o As Storm.DBObject In allPlayers
		    p = Player(o)
		    
		    PlayerList.AddRow(p.Name.StringValue)
		    PlayerList.RowTag(PlayerList.LastIndex) = p
		  Next
		  
		  PlayerList.ListIndex = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NewPlayer()
		  mCurrentPlayer = New Player
		  
		  NameField.Text = ""
		  AgeField.Text = ""
		  PositionsField.Text = ""
		  EmailField.Text = ""
		  
		  mCurrentPlayer.TeamID = mCurrentTeam.ID
		  
		  EnableFields
		  
		  ShowPlayer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Save()
		  mCurrentPlayer.Name = NameField.Text
		  mCurrentPlayer.Age = AgeField.Text
		  mCurrentPlayer.Positions = PositionsField.Text
		  mCurrentPlayer.Email = EmailField.Text
		  
		  If mCurrentPlayer.Save Then
		    LoadPlayers
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowPlayer()
		  NameField.Text = mCurrentPlayer.Name
		  AgeField.Text = mCurrentPlayer.Age
		  PositionsField.Text = mCurrentPlayer.Positions
		  EmailField.Text = mCurrentPlayer.Email
		  
		  NameField.SetFocus
		  
		  SaveButton.Enabled = True
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCurrentTeam
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCurrentTeam = value
			  
			  LoadPlayers
			  
			  Self.Title = "Players on the " + value.Name
			End Set
		#tag EndSetter
		CurrentTeam As Team
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCurrentPlayer As Player
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentTeam As Team
	#tag EndProperty


#tag EndWindowCode

#tag Events PlayerList
	#tag Event
		Sub Change()
		  If Me.ListIndex >= 0 Then
		    mCurrentPlayer = Me.RowTag(Me.ListIndex)
		    
		    ShowPlayer
		    
		    EnableFields
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SaveButton
	#tag Event
		Sub Action()
		  Save
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NewPlayerButton
	#tag Event
		Sub Action()
		  NewPlayer
		End Sub
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
