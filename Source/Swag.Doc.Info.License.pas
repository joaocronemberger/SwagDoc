{******************************************************************************}
{                                                                              }
{  Delphi SwagDoc Library                                                      }
{  Copyright (c) 2018 Marcelo Jaloto                                           }
{  https://github.com/marcelojaloto/SwagDoc                                    }
{                                                                              }
{******************************************************************************}
{                                                                              }
{  Licensed under the Apache License, Version 2.0 (the "License");             }
{  you may not use this file except in compliance with the License.            }
{  You may obtain a copy of the License at                                     }
{                                                                              }
{      http://www.apache.org/licenses/LICENSE-2.0                              }
{                                                                              }
{  Unless required by applicable law or agreed to in writing, software         }
{  distributed under the License is distributed on an "AS IS" BASIS,           }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.    }
{  See the License for the specific language governing permissions and         }
{  limitations under the License.                                              }
{                                                                              }
{******************************************************************************}
unit Swag.Doc.Info.License;

interface

uses
  System.JSON;

type
  TSwagInfoLicense = class(TObject)
  private
    fName: string;
    fEmail: string;
    fUrl: string;
  public
    function GenerateJsonObject: TJSONObject;
    procedure Load(pJson : TJSONObject);
    function isEmpty: Boolean;

    property Name: string read fName write fName;
    property Email: string read fEmail write fEmail;
    property Url: string read fUrl write fUrl;
  end;

implementation

uses System.SysUtils;

const
  c_SwagInfoLicenseName = 'name';
  c_SwagInfoLicenseUrl = 'url';

{ TSwagInfoLicense }

function TSwagInfoLicense.GenerateJsonObject: TJSONObject;
begin
  Result := TJsonObject.Create;
  Result.AddPair(c_SwagInfoLicenseName, fName);
  Result.AddPair(c_SwagInfoLicenseUrl, fUrl);
end;

function TSwagInfoLicense.isEmpty: Boolean;
begin
  Result := fName.IsEmpty and fUrl.IsEmpty;
end;

procedure TSwagInfoLicense.Load(pJson: TJSONObject);
begin
  if not Assigned(pJson) then
    Exit;

  if Assigned(pJson.Values[c_SwagInfoLicenseName]) then
    fName := pJson.Values[c_SwagInfoLicenseName].Value;

  if Assigned(pJson.Values[c_SwagInfoLicenseUrl]) then
    fUrl := pJson.Values[c_SwagInfoLicenseUrl].Value;
end;

end.