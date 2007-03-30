unit ki_web_ui;

interface

uses
  system.web.ui;

type
  page_class = class(System.Web.UI.Page)
  strict protected
    procedure Alert
      (
      key: string;
      value: string
      );
    procedure OnInit(e: eventargs); override;
  public
    constructor Create;
  end;
  //
  usercontrol_class = class(system.web.ui.usercontrol)
  strict protected
    procedure Alert
      (
      key: string;
      value: string
      );
    procedure OnInit(e: eventargs); override;
  public
    constructor Create;
  end;

implementation

uses
  ki;

//
// PAGE_CLASS
//

constructor page_class.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

procedure page_class.Alert
  (
  key: string;
  value: string
  );
begin
  ki.Alert(page,key,value);
end;

procedure page_class.OnInit(e: system.eventargs);
var
  cookie_header: string;
begin
  inherited OnInit(e);
  if context.session <> nil then begin
    if session.IsNewSession then begin
      cookie_header := request.headers['cookie'];
      if (cookie_header <> nil) and (cookie_header.IndexOf('ASP.NET_SessionId') >= 0) then begin
        server.Transfer('~/timeout.aspx');
      end;
    end;
  end;
end;

//
// USERCONTROL_CLASS
//

constructor usercontrol_class.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

procedure usercontrol_class.Alert
  (
  key: string;
  value: string
  );
begin
  ki.Alert(page,key,value);
end;

procedure usercontrol_class.OnInit(e: system.eventargs);
begin
  inherited OnInit(e);
end;

end.
