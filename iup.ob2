<*+O2EXTENSIONS*>
MODULE Iup;
IMPORT SYSTEM;
CONST
    NAME = "IUP - Portable User Interface";
    COPYRIGHT = "Copyright (C) 1994-2012 Tecgraf, PUC-Rio.";
    DESCRIPTION = "Multi-platform toolkit for building graphical user interfaces.";
    VERSION = "3.7";  (* bug fixes are reported only by IupVersion functions *)
    VERSION_NUMBER = 307000;
    VERSION_DATE = "2012/11/29";  (* does not include bug fix releases *)

TYPE
    Ihandle*      = POINTER TO RECORD END;
    IhandleList*  = ARRAY OF Ihandle;
    Istring*      = POINTER ["C"] TO CHAR;
    IstringList*  = ARRAY OF Istring;
    Ipointer*     = POINTER TO RECORD END;
    IpointerList* = ARRAY OF Ipointer;
    Icallback*    = PROCEDURE ["C"] (self: Ihandle);
    Iparamcb*     = PROCEDURE ["C"] (dialog: Ihandle; param_index: LONGINT; user_data: Ipointer);

(* MAIN API *)

PROCEDURE ["C"] / Open*          (VAR argc: LONGINT; VAR argv: IstringList): LONGINT;
PROCEDURE ["C"] / Close*        ;
PROCEDURE ["C"] / ImageLibOpen* ;
PROCEDURE ["C"] / MainLoop*      (): LONGINT;
PROCEDURE ["C"] / LoopStep*      (): LONGINT;
PROCEDURE ["C"] / LoopStepWait*  (): LONGINT;
PROCEDURE ["C"] / MainLoopLevel* (): LONGINT;
PROCEDURE ["C"] / Flush*        ;
PROCEDURE ["C"] / ExitLoop*     ;

PROCEDURE ["C"] / RecordInput* (filename: Istring; mode: LONGINT): LONGINT;
PROCEDURE ["C"] / PlayInput*   (filename: Istring): LONGINT;

PROCEDURE ["C"] / Update*          (ih: Ihandle);
PROCEDURE ["C"] / UpdateChildren*  (ih: Ihandle);
PROCEDURE ["C"] / Redraw*          (ih: Ihandle; children: LONGINT);
PROCEDURE ["C"] / Refresh*         (ih: Ihandle);
PROCEDURE ["C"] / RefreshChildren* (ih: Ihandle);

PROCEDURE ["C"] / MapFont*    (iupfont:    Istring): Istring;
PROCEDURE ["C"] / UnMapFont*  (driverfont: Istring): Istring;
PROCEDURE ["C"] / Help*       (url:        Istring): LONGINT;
PROCEDURE ["C"] / Load*       (filename:   Istring): Istring;
PROCEDURE ["C"] / LoadBuffer* (buffer:      Istring): Istring;

PROCEDURE ["C"] / Version*       (): Istring;
PROCEDURE ["C"] / VersionDate*   (): Istring;
PROCEDURE ["C"] / VersionNumber* (): LONGINT;
PROCEDURE ["C"] / SetLanguage*   (lng: Istring);
PROCEDURE ["C"] / GetLanguage*   (): Istring;

PROCEDURE ["C"] / Destroy*        (ih:    Ihandle);
PROCEDURE ["C"] / Detach*         (child: Ihandle);
PROCEDURE ["C"] / Append*         (ih, child: Ihandle): Ihandle;
PROCEDURE ["C"] / Insert*         (ih, ref_child, child: Ihandle): Ihandle;
PROCEDURE ["C"] / GetChild*       (ih: Ihandle; pos: LONGINT): Ihandle;
PROCEDURE ["C"] / GetChildPos*    (ih, child: Ihandle): LONGINT;
PROCEDURE ["C"] / GetChildCount*  (ih: Ihandle): LONGINT;
PROCEDURE ["C"] / GetNextChild*   (ih, child: Ihandle): Ihandle;
PROCEDURE ["C"] / GetBrother*     (ih: Ihandle): Ihandle;
PROCEDURE ["C"] / GetParent*      (ih: Ihandle): Ihandle;
PROCEDURE ["C"] / GetDialog*      (ih: Ihandle): Ihandle;
PROCEDURE ["C"] / GetDialogChild* (ih: Ihandle; name: Istring): Ihandle;
PROCEDURE ["C"] / Reparent*       (ih, new_parent, ref_child: Ihandle): LONGINT;

PROCEDURE ["C"] / Popup*  (ih: Ihandle; x, y: LONGINT): LONGINT;
PROCEDURE ["C"] / Show*   (ih: Ihandle): LONGINT;
PROCEDURE ["C"] / ShowXY* (ih: Ihandle; x, y: LONGINT): LONGINT;
PROCEDURE ["C"] / Hide*   (ih: Ihandle): LONGINT;
PROCEDURE ["C"] / Map*    (ih: Ihandle): LONGINT;
PROCEDURE ["C"] / Unmap*  (ih: Ihandle);

PROCEDURE ["C"] / SetAttribute*   (ih: Ihandle; name, value: Istring);
PROCEDURE ["C"] / StoreAttribute* (ih: Ihandle; name, value: Istring);
PROCEDURE ["C"] / SetAttributes*  (ih: Ihandle; str:  Istring): Ihandle;
PROCEDURE ["C"] / GetAttribute*   (ih: Ihandle; name: Istring): Istring;
PROCEDURE ["C"] / GetAttributes*  (ih: Ihandle): Istring;
PROCEDURE ["C"] / GetInt*         (ih: Ihandle; name: Istring): LONGINT;
PROCEDURE ["C"] / GetInt2*        (ih: Ihandle; name: Istring): LONGINT;
PROCEDURE ["C"] / GetIntInt*      (ih: Ihandle; name: Istring; i1, i2: LONGINT): LONGINT;
PROCEDURE ["C"] / GetFloat*       (ih: Ihandle; name: Istring): REAL;
PROCEDURE ["C"] / SetfAttribute*    (ih: Ihandle; name, format: Istring; SEQ args: SYSTEM.BYTE);
PROCEDURE ["C"] / ResetAttribute*   (ih: Ihandle; name: Istring);
PROCEDURE ["C"] / GetAllAttributes* (ih: Ihandle; names: IstringList; n: LONGINT): LONGINT;
PROCEDURE ["C"] / SetAtt*           (handle_name: Istring; ih: Ihandle; name: Istring; SEQ args: SYSTEM.BYTE): Ihandle;

PROCEDURE ["C"] / SetAttributeId*   (ih: Ihandle; name: Istring; id: LONGINT; value: Istring);
PROCEDURE ["C"] / StoreAttributeId* (ih: Ihandle; name: Istring; id: LONGINT; value: Istring);
PROCEDURE ["C"] / GetAttributeId*   (ih: Ihandle; name: Istring; id: LONGINT);
PROCEDURE ["C"] / GetFloatId*       (ih: Ihandle; name: Istring; id: LONGINT);
PROCEDURE ["C"] / GetIntId*         (ih: Ihandle; name: Istring; id: LONGINT);
PROCEDURE ["C"] / SetfAttributeId*  (ih: Ihandle; name: Istring; id: LONGINT; format: Istring; SEQ args: SYSTEM.BYTE);

PROCEDURE ["C"] / SetAttributeId2*   (ih: Ihandle; name: Istring; lin, col: LONGINT; value: Istring);
PROCEDURE ["C"] / StoreAttributeId2* (ih: Ihandle; name: Istring; lin, col: LONGINT; value: Istring);
PROCEDURE ["C"] / GetAttributeId2*   (ih: Ihandle; name: Istring; lin, col: LONGINT);
PROCEDURE ["C"] / GetIntId2*         (ih: Ihandle; name: Istring; lin, col: LONGINT);
PROCEDURE ["C"] / GetFloatId2*       (ih: Ihandle; name: Istring; lin, col: LONGINT);
PROCEDURE ["C"] / SetfAttributeId2*  (ih: Ihandle; name: Istring; lin, col: LONGINT; format: Istring; SEQ args: SYSTEM.BYTE);

PROCEDURE ["C"] / SetGlobal*   (name, value: Istring);
PROCEDURE ["C"] / StoreGlobal* (name, value: Istring);
PROCEDURE ["C"] / GetGlobal*   (name: Istring): Istring;

PROCEDURE ["C"] / SetFocus*      (ih: Ihandle): Ihandle;
PROCEDURE ["C"] / GetFocus*      (): Ihandle;
PROCEDURE ["C"] / PreviousField* (ih: Ihandle): Ihandle;
PROCEDURE ["C"] / NextField*     (ih: Ihandle): Ihandle;

PROCEDURE ["C"] / GetCallback*  (ih: Ihandle; name: Istring): Icallback;
PROCEDURE ["C"] / SetCallback*  (ih: Ihandle; name: Istring; func: Icallback): Icallback;
PROCEDURE ["C"] / SetCallbacks* (ih: Ihandle; name: Istring; func: Icallback; SEQ args: SYSTEM.BYTE): Ihandle;

PROCEDURE ["C"] / GetFunction*   (name: Istring): Icallback;
PROCEDURE ["C"] / SetFunction*   (name: Istring; func: Icallback): Icallback;
PROCEDURE ["C"] / GetActionName* (): Istring;

PROCEDURE ["C"] / GetHandle*     (name: Istring): Ihandle;
PROCEDURE ["C"] / SetHandle*     (name: Istring; ih: Ihandle): Ihandle;
PROCEDURE ["C"] / GetAllNames*   (names: IstringList; n: LONGINT): LONGINT;
PROCEDURE ["C"] / GetAllDialogs* (names: Istring; n: LONGINT): LONGINT;
PROCEDURE ["C"] / GetName*       (ih: Ihandle): Istring;

PROCEDURE ["C"] / SetAttributeHandle*       (ih: Ihandle; name: Istring; ih_named: Ihandle);
PROCEDURE ["C"] / GetAttributeHandle*       (ih: Ihandle; name: Istring): Ihandle;

PROCEDURE ["C"] / GetClassName*             (ih: Ihandle): Istring;
PROCEDURE ["C"] / GetClassType*             (ih: Ihandle): Istring;
PROCEDURE ["C"] / GetAllClasses*            (names: IstringList; n: LONGINT): LONGINT;
PROCEDURE ["C"] / GetClassAttributes*       (classname: Istring; names: IstringList; n: LONGINT): LONGINT;

PROCEDURE ["C"] / GetClassCallbacks*        (classname: Istring; names: IstringList; n: LONGINT): LONGINT;
PROCEDURE ["C"] / SaveClassAttributes*      (ih: Ihandle);
PROCEDURE ["C"] / CopyClassAttributes*      (src_ih, dst_ih: Ihandle);
PROCEDURE ["C"] / SetClassDefaultAttribute* (classname, name, value: Istring);
PROCEDURE ["C"] / ClassMatch*               (ih: Ihandle; classname: Istring): LONGINT;
PROCEDURE ["C"] / Create*                   (classname: Istring): Ihandle;
PROCEDURE ["C"] / Createv*                  (classname: Istring; params: IpointerList): Ihandle;
PROCEDURE ["C"] / Createp*                  (classname: Istring; first: Ipointer; SEQ args: SYSTEM.BYTE): Ihandle;

(* ELEMENTS *)

PROCEDURE ["C"] / Fill*        (): Ihandle;
PROCEDURE ["C"] / Radio*       (child: Ihandle): Ihandle;
PROCEDURE ["C"] / Vbox*        (child: Ihandle; SEQ args: SYSTEM.BYTE): Ihandle;
PROCEDURE ["C"] / Vboxv*       (children: IhandleList): Ihandle;
PROCEDURE ["C"] / Zbox*        (child: Ihandle; SEQ args: SYSTEM.BYTE): Ihandle;
PROCEDURE ["C"] / Zboxv*       (children: IhandleList): Ihandle;
PROCEDURE ["C"] / Hbox*        (child: Ihandle; SEQ args: SYSTEM.BYTE): Ihandle;
PROCEDURE ["C"] / Hboxv*       (children: IhandleList): Ihandle;
PROCEDURE ["C"] / Normalizer*  (ih_first: Ihandle; SEQ args: SYSTEM.BYTE): Ihandle;
PROCEDURE ["C"] / Normalizerv* (ih_list: IhandleList): Ihandle;

PROCEDURE ["C"] / Cbox*        (child: Ihandle; SEQ args: SYSTEM.BYTE): Ihandle;
PROCEDURE ["C"] / Cboxv*       (children: IhandleList): Ihandle;
PROCEDURE ["C"] / Sbox*        (child: Ihandle): Ihandle;
PROCEDURE ["C"] / Split*       (child1, child2: Ihandle): Ihandle;
PROCEDURE ["C"] / ScrollBox*   (child: Ihandle): Ihandle;

PROCEDURE ["C"] / Frame*       (child: Ihandle): Ihandle;

PROCEDURE ["C"] / Image*       (width, height: LONGINT; pixmap: Istring): Ihandle;
PROCEDURE ["C"] / ImageRGB*    (width, height: LONGINT; pixmap: Istring): Ihandle;
PROCEDURE ["C"] / ImageRGBA*   (width, height: LONGINT; pixmap: Istring): Ihandle;

PROCEDURE ["C"] / Item*        (title, action: Istring): Ihandle;
PROCEDURE ["C"] / Submenu*     (title: Istring; child: Ihandle): Ihandle;
PROCEDURE ["C"] / Separator*   (): Ihandle;
PROCEDURE ["C"] / Menu*        (child: Ihandle; SEQ args: SYSTEM.BYTE): Ihandle;
PROCEDURE ["C"] / Menuv*       (children: IhandleList): Ihandle;

PROCEDURE ["C"] / Button*      (title, action: Istring): Ihandle;
PROCEDURE ["C"] / Canvas*      (action: Istring): Ihandle;
PROCEDURE ["C"] / Dialog*      (child: Ihandle): Ihandle;
PROCEDURE ["C"] / User*        (): Ihandle;
PROCEDURE ["C"] / Label*       (title: Istring): Ihandle;
PROCEDURE ["C"] / List*        (action: Istring): Ihandle;
PROCEDURE ["C"] / Text*        (action: Istring): Ihandle;
PROCEDURE ["C"] / MultiLine*   (action: Istring): Ihandle;
PROCEDURE ["C"] / Toggle*      (title, action: Istring): Ihandle;
PROCEDURE ["C"] / Timer*       (): Ihandle;
PROCEDURE ["C"] / Clipboard*   (): Ihandle;
PROCEDURE ["C"] / ProgressBar* (): Ihandle;
PROCEDURE ["C"] / Val*         (type: Istring): Ihandle;
PROCEDURE ["C"] / Tabs*        (child: Ihandle; SEQ args: SYSTEM.BYTE): Ihandle;
PROCEDURE ["C"] / Tabsv*       (children: IhandleList): Ihandle;
PROCEDURE ["C"] / Tree*        (): Ihandle;

(* Deprecated controls use SPIN attribute of IupText *)
PROCEDURE ["C"] / Spin*    (): Ihandle;
PROCEDURE ["C"] / Spinbox* (child: Ihandle): Ihandle;

(* IupImage utility *)
PROCEDURE ["C"] / SaveImageAsText* (ih: Ihandle; file_name, format, name: Istring): LONGINT;

(* IupText utilities *)
PROCEDURE ["C"] / TextConvertLinColToPos* (ih: Ihandle; lin, col: LONGINT; VAR pos: LONGINT);
PROCEDURE ["C"] / TextConvertPosToLinCol* (ih: Ihandle; pos: LONGINT; VAR lin, col: LONGINT);

(* IupText, IupList and IupTree utility *)
PROCEDURE ["C"] / ConvertXYToPos* (ih: Ihandle; x, y: LONGINT): LONGINT;

(* IupTree utilities *)
PROCEDURE ["C"] / TreeSetUserId* (ih: Ihandle; id: LONGINT; userid: Ipointer): LONGINT;
PROCEDURE ["C"] / TreeGetUserId* (ih: Ihandle; id: LONGINT): Ipointer;
PROCEDURE ["C"] / TreeGetId*     (ih: Ihandle; userid: Ipointer): LONGINT;

(* Deprecated IupTree utilities, use Iup*AttributeId functions *)
PROCEDURE ["C"] / TreeSetAttribute*   (ih: Ihandle; name: Istring; id: LONGINT; value: Istring);
PROCEDURE ["C"] / TreeStoreAttribute* (ih: Ihandle; name: Istring; id: LONGINT; value: Istring);
PROCEDURE ["C"] / TreeGetAttribute*   (ih: Ihandle; name: Istring; id: LONGINT): Istring;
PROCEDURE ["C"] / TreeGetInt*         (ih: Ihandle; name: Istring; id: LONGINT): LONGINT;
PROCEDURE ["C"] / TreeGetFloat*       (ih: Ihandle; name: Istring; id: LONGINT): REAL;
PROCEDURE ["C"] / TreeSetfAttribute*      (ih: Ihandle; name: Istring; id: LONGINT; format: Istring; SEQ args: SYSTEM.BYTE);
PROCEDURE ["C"] / TreeSetAttributeHandle* (ih: Ihandle; a: Istring; id: LONGINT; ih_named: Ihandle);

(* PRE-DEFINIDED DIALOGS *)

PROCEDURE ["C"] / FileDlg*    (): Ihandle;
PROCEDURE ["C"] / MessageDlg* (): Ihandle;
PROCEDURE ["C"] / ColorDlg*   (): Ihandle;
PROCEDURE ["C"] / FontDlg*    (): Ihandle;

PROCEDURE ["C"] / GetFile*    (arg: Istring): LONGINT;
PROCEDURE ["C"] / Message*    (title, msg: Istring);
PROCEDURE ["C"] / Messagef*   (title, format: Istring; SEQ args: SYSTEM.BYTE): LONGINT;
PROCEDURE ["C"] / Alarm*      (title, msg, b1, b2, b3: Istring): LONGINT;
PROCEDURE ["C"] / Scanf*      (format: Istring; SEQ args: SYSTEM.BYTE): LONGINT;
PROCEDURE ["C"] / ListDialog* (type: LONGINT; title: Istring; size: LONGINT; list: IstringList; op, max_col, max_lin: LONGINT; VAR marks: LONGINT): LONGINT;
PROCEDURE ["C"] / GetText*    (title, text: Istring): LONGINT;
PROCEDURE ["C"] / GetColor*   (x,y: LONGINT; r, g, b: Istring): LONGINT;

PROCEDURE ["C"] / GetParam*  (title: Istring; action: Iparamcb; user_data: Ipointer; format: Istring; SEQ args: SYSTEM.BYTE): LONGINT;
PROCEDURE ["C"] / GetParamv* (title: Istring; action: Iparamcb; user_data: Ipointer; format: Istring; param_count, param_extra: LONGINT; param_data: IpointerList): LONGINT;

PROCEDURE ["C"] / LayoutDialog*            (dialog: Ihandle): Ihandle;
PROCEDURE ["C"] / ElementPropertiesDialog* (elem: Ihandle): Ihandle;

BEGIN
END Iup.