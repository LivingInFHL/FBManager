{ Free DB Manager

  Copyright (C) 2005-2018 Lagunov Aleksey  alexs75 at yandex.ru

  This source is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free
  Software Foundation; either version 2 of the License, or (at your option)
  any later version.

  This code is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
  details.

  A copy of the GNU General Public License is available on the World Wide Web
  at <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing
  to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
  MA 02111-1307, USA.
}

unit fdbm_cf_DisplayDataParamsUnit;

{$I fbmanager_define.inc}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, fdbm_ConnectionAbstractUnit, SQLEngineAbstractUnit;

type

  { TfdbmCFDisplayDataParamsPage }

  TfdbmCFDisplayDataParamsPage = class(TConnectionDlgPage)
    cbFetchAllTableData: TCheckBox;
  private
    FSQLEngine:TSQLEngineAbstract;
  public
    procedure Localize;override;
    procedure LoadParams(ASQLEngine:TSQLEngineAbstract);override;
    procedure SaveParams;override;
    function PageName:string;override;
    constructor Create(ASQLEngine:TSQLEngineAbstract; AOwner:TForm);
  end;

var
  fdbmCFDisplayDataParamsPage: TfdbmCFDisplayDataParamsPage;

implementation
uses fbmStrConstUnit, fbmToolsUnit;

{$R *.lfm}

{ TfdbmCFDisplayDataParamsPage }

procedure TfdbmCFDisplayDataParamsPage.Localize;
begin
  inherited Localize;
  cbFetchAllTableData.Caption:=sFetchAllDataFromTable;
end;

procedure TfdbmCFDisplayDataParamsPage.LoadParams(ASQLEngine: TSQLEngineAbstract
  );
begin
  cbFetchAllTableData.Checked:=ASQLEngine.DisplayDataOptions.FetchAllData;
end;

procedure TfdbmCFDisplayDataParamsPage.SaveParams;
begin
  FSQLEngine.DisplayDataOptions.FetchAllData:=cbFetchAllTableData.Checked;
end;

function TfdbmCFDisplayDataParamsPage.PageName: string;
begin
  Result:=sDisplayTableDataProperties;
end;

constructor TfdbmCFDisplayDataParamsPage.Create(
  ASQLEngine: TSQLEngineAbstract; AOwner: TForm);
begin
  inherited Create(AOwner);
  FSQLEngine:=ASQLEngine;
end;

end.

