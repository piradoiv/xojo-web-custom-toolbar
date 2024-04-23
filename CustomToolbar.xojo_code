#tag WebContainerControl
Begin WebContainer CustomToolbar
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   60
   Indicator       =   0
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   ScrollDirection =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   600
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebRectangle Rectangle1
      BackgroundColor =   &c59A02700
      ControlCount    =   0
      ControlID       =   ""
      Enabled         =   True
      HasBackgroundColor=   True
      Height          =   60
      Index           =   -2147483648
      Indicator       =   ""
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   600
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebLabel Label1
         Bold            =   True
         ControlID       =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   24.0
         Height          =   60
         Index           =   -2147483648
         Indicator       =   0
         Italic          =   False
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         Parent          =   "Rectangle1"
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Title"
         TextAlignment   =   0
         TextColor       =   &cFFFFFF00
         Tooltip         =   ""
         Top             =   0
         Underline       =   False
         Visible         =   True
         Width           =   115
         _mPanelIndex    =   -1
      End
      Begin WebSearchField SearchField1
         ControlID       =   ""
         Enabled         =   True
         Height          =   38
         Hint            =   "Search"
         Index           =   -2147483648
         Indicator       =   0
         Left            =   100
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   True
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         LockVertical    =   True
         Parent          =   "Rectangle1"
         Scope           =   2
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         Tooltip         =   ""
         Top             =   11
         Visible         =   True
         Width           =   401
         _mPanelIndex    =   -1
      End
   End
   Begin WebButton Button1
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "≡"
      ControlID       =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   535
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   True
      Parent          =   "nil"
      Scope           =   2
      TabIndex        =   1
      TabStop         =   True
      Tooltip         =   ""
      Top             =   11
      Visible         =   True
      Width           =   45
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub ToolbarMenuItemPressed(menu As ToolbarMenu, menuItem As ToolbarMenuItem)
		  RaiseEvent ToolbarMenuItemPressed(menuItem)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event SearchTextChanged(search As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TitlePressed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ToolbarMenuItemPressed(menuItem As ToolbarMenuItem)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Label1.Text
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Label1.Text = value
			End Set
		#tag EndSetter
		Title As String
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events Rectangle1
	#tag Event
		Sub Opening()
		  Me.Style.Value("border-radius") = "0"
		  Me.Style.BorderThickness = 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label1
	#tag Event
		Sub Pressed()
		  RaiseEvent TitlePressed
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Style.Cursor = WebStyle.Cursors.Pointer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SearchField1
	#tag Event
		Sub Pressed()
		  RaiseEvent SearchTextChanged(Me.Text)
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChanged()
		  RaiseEvent SearchTextChanged(Me.Text)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button1
	#tag Event
		Sub Pressed()
		  Var c As New ToolbarMenu
		  AddHandler c.Pressed, WeakAddressOf ToolbarMenuItemPressed
		  c.ShowPopover(Me)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
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
		Name="Width"
		Visible=false
		Group="Position"
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=false
		Group="Position"
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ScrollDirection"
		Visible=true
		Group="Behavior"
		InitialValue="ScrollDirections.None"
		Type="WebContainer.ScrollDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - None"
			"1 - Horizontal"
			"2 - Vertical"
			"3 - Both"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Title"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="View"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="View"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
	#tag EndViewProperty
#tag EndViewBehavior
