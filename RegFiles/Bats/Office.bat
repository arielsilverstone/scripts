@Echo On
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCU\Changes" /v "OfficeFile" /t REG_SZ /d "14JAN25" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Common" /v "LinkedIn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Common" /v "sendcustomerdata" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Common" /v "UpdateReliabilityData" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Common" /v "UpdateReliabilityData" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Common" /v "insiderslabbehavior" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Common" /v "disabledocumentchat" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Common" /v "Path" /t REG_SZ /d "D:\Program Files\Microsoft Office\Office16\\" /f
Reg.exe add "HKLM\software\policies\Microsoft\Office\16.0\Common" /v "LinkedIn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\software\policies\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\software\policies\Microsoft\Office\16.0\Common" /v "sendcustomerdata" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\software\policies\Microsoft\Office\16.0\Common" /v "UpdateReliabilityData" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Office\Common\ClientTelemetry" /v "MotherboardUUID" /t REG_SZ /d "-" /f
Reg.exe add "HKLM\Software\Microsoft\Office\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\Common\ClientTelemetry" /v "SendTelemetry" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\office\16.0\common\clienttelemetry" /v "sendtelemetry" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\DRM" /v "donotacquiredrmlicenseonsync" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\DRM" /v "disable" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Office\Common\Experiment" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Common\Feedback" /v "IncludeEmail" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Common\Feedback" /v "includescreenshot" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Common\Feedback" /v "SurveyEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v "feedbackincludelog" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v "IncludeEmail" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v "includescreenshot" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v "msoridfeedbackincludelog" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v "msoridsurveyenabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v "qmenable" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v "shownfirstrunoptin" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v "SurveyEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v "updatereliabilitydata" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Office\16.0\Common\FileIO" /v "OfficeCollaborationSyncIntegrationEnabled" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "shownfirstrunoptin" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "SkipOpenAndSaveAsPlace" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "skydrivesigninoption" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\general" /v "disableboottoofficestart" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\general" /v "disablecomingsoon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\general" /v "feedbackincludelog" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\general" /v "notrack" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\general" /v "optindisable" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\general" /v "recommendeddocumentsenabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\general" /v "shownfirstrunoptin" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\general" /v "SkipOpenAndSaveAsPlace" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\general" /v "skydrivesigninoption" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\general" /v "sound" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\general" /v "SurveyEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\Common\Graphics" /v "DisableAnimations" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Identity" /v "DisableADALatopWAMOverride" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\IM" /v "turnoffpresenceicon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\IM" /v "turnoffclicktophone" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\IM" /v "turnoffpresenceintegration" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\IM" /v "turnoffclicktoim" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Internet" /v "onlinestorage" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Internet" /v "useconversionservices" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Internet" /v "useonlinecontent" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Internet" /v "donotcheckifofficeishtmleditor" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Internet" /v "donotorganizeinfolder" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Internet" /v "donotcheckifwordisdefaulthtmleditor" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Licensing" /v "ExtendedOfflineSubscription" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\Office\16.0\Common\Licensing" /v "ExtendedOfflineSubscription" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\mailsettings" /v "ignorereplyspelling" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\mailsettings" /v "markcomments" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\office\16.0\common\LinkedIn\OfficeLinkedIn" /v "OfficeLinkedIn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate" /v "enableautomaticupdates" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate" /v "hideupdatenotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate" /v "preventbinginstall" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate" /v "preventteamsinstall" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate" /v "vltosubscription" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Options" /v "Name" /t REG_SZ /d "Placeholder" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Personalization" /v "Name" /t REG_SZ /d "Placeholder" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Portal" /v "Name" /t REG_SZ /d "Placeholder" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Privacy" /v "ControllerConnectedServicesEnabled" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Privacy" /v "DisconnectedState" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Privacy" /v "DownloadContentDisabled" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Privacy" /v "UserContentDisabled" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\ptwatson" /v "ptwoptin" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Security" /v "LinkedIn" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Security" /v "disablehyperlinkwarning" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Security" /v "drmencryptproperty" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Security\passwordcomplexity" /v "minlength" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Services" /v "Name" /t REG_SZ /d "Placeholder" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Services\Fax" /v "nofax" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Signatures" /v "suppressextsigningsvcs" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Signatures" /v "suppressofficedefaultprovider" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\SignIn" /v "Name" /t REG_SZ /d "Placeholder" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\SignIn" /v "SignInOptions" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\targetedmessagingservice" /v "Name" /t REG_SZ /d "Placeholder" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Toolbars" /v "animation" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Toolbars" /v "tooltips" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Toolbars" /v "fontview" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Toolbars" /v "screentipscheme" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Firstrun" /v "disablemovie" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Firstrun" /v "bootedrtm" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Firstrun" /v "disablemovie" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Firstrun" /v "bootedrtm" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "Enablelogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnableFileObfuscation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM" /v "EnableLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM" /v "EnableFileObfuscation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "accesssolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "olksolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "onenotesolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "pptsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "projectsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "publishersolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "visiosolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "wdsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "xlsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v "accesssolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v "olksolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v "onenotesolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v "pptsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v "projectsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v "publishersolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v "visiosolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v "wdsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v "xlsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "agave" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "appaddins" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "comaddins" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "documentfiles" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "templatefiles" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "agave" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "appaddins" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "comaddins" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "documentfiles" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "templatefiles" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Registration" /v "AcceptAllEulas" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Excel\Security\ProtectedView" /v "DisableAttachementsInPV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Excel\Security\ProtectedView" /v "DisableInternetFilesInPV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Excel\Security\ProtectedView" /v "DisableUnsafeLocationsInPV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Excel\Options" /v "DisableMergeInstance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\lync" /v "disableautomaticsendtracking" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\lync" /v "preventrun" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Browser Helper Objects" /f
Reg.exe delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Browser Helper Objects" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\Onenote\General" /v "Disablesupportdiagnostics" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\Onenote\Options\Other" /v "RunSystemtrayapp" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Office\16.0\Onenote\Options\Other" /v "Addnotebooks" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\Onenote\Options\Outlookandweb" /v "Disablesendemailtoonenote" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\Onenote\Resiliency" /v "Restricttolist" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\Onenote\Security" /v "Disablecomapi" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\Onenote\Security" /v "Disablealladdins" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook" /v "EnableLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook" /v "forceostpath" /t REG_SZ /d "D:\Users\%%username%%\Outlook" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook" /v "forcepstpath" /t REG_SZ /d "D:\Users\%%username%%\Outlook" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook" /v "newpstformat" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\cached mode" /v "specifyofflineaddressbookpath" /t REG_SZ /d "D:\users\%%username%%\outlook" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options" /v "enableconflictlogging" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options" /v "hidephotolink" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\general" /v "disableadminnotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\general" /v "disablecrashnotificationonrestart" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\general" /v "disableoutlookfeedbackfeatures" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\general" /v "DisableOutlookMobileHyperlink" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\general" /v "disablesupportbackstage" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\general" /v "disablesupportdiagnostics" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\general" /v "disablesupportticketcreationinoutlook" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\general" /v "HideNewOutlookToggle" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\general" /v "recommendoutlookextension" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\general" /v "warndelete" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\Mail" /v "BlockExtContent" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\Mail" /v "UnblockSpecificSenders" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\mail" /v "disablemailtips" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\mshtml\international" /v "Default_codepageout" /t REG_DWORD /d "413697" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\shutdown" /v "addinfastshutdownbehavior" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\shutdown" /v "allowshutdownwithexternalreferences" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\spelling" /v "check" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\preferences" /v "Emptytrash" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\preferences" /v "Enmessageheaders" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\preferences" /v "Enmessageflags" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\preferences" /v "Forwardstyle" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\preferences" /v "Prefixtext" /t REG_SZ /d ">" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\options\preferences" /v "Replystyle" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\Outlook\Options\Webext" /v "Storebuttoninribbonhometaballowed" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\outlook\pst" /v "maxlargefilesize" /t REG_DWORD /d "4132" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Outlook\Resiliency" /v "RestrictToList" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Outlook\Security" /v "Level1Remove" /t REG_SZ /d "exe,com,doc,docx,pptx,ppt,xls,xlsx,pdf,txt" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Outlook\Security" /v "InitEncrypt" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Outlook\Security" /v "InitSign" /t REG_DWORD /d "2" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Office\outlook\socialconnector" /v "activitySyncinterval" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Office\outlook\socialconnector" /v "Contactsyncinterval" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\outlook\socialconnector" /v "Disableactivitydownload" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\outlook\socialconnector" /v "Disablecontactdownload" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\outlook\socialconnector" /v "Disablecontactgalsync" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\outlook\socialconnector" /v "Disablesocialnetworkconnectivity" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\outlook\socialconnector" /v "Downloaddetailsfromad" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\outlook\socialconnector" /v "Ondemandactivitysync" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\outlook\socialconnector" /v "Providersecuritymode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\outlook\socialconnector" /v "Runosc" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\outlook\socialconnector" /v "Trustedproviderslist" /t REG_SZ /d ";" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\outlook\socialconnector" /v "Unmanagedinfobars" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\PowerPoint\Security\ProtectedView" /v "DisableAttachementsInPV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\PowerPoint\Security\ProtectedView" /v "DisableInternetFilesInPV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\PowerPoint\Security\ProtectedView" /v "DisableUnsafeLocationsInPV" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Word\Options" /v "DisableBootToOfficeStart" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Word\Security\ProtectedView" /v "DisableAttachementsInPV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Word\Security\ProtectedView" /v "DisableInternetFilesInPV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Word\Security\ProtectedView" /v "DisableUnsafeLocationsInPV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Teams" /v "Preventfirstlaunchafterinstall" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Office\16.0\Teams" /v "Preventfirstlaunchafterinstall" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\Currentversion\Backgroundaccessapplications\Microsoftteams_8wekyb3d8bbwe" /v "Disabledbyuser" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\Currentversion\Backgroundaccessapplications\Microsoftteams_8wekyb3d8bbwe" /v "Disabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\MicrosoftTeams_8wekyb3d8bbwe\TeamsStartupTask" /v "open_app_in_background" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\MicrosoftTeams_8wekyb3d8bbwe\TeamsStartupTask" /v "State" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\MicrosoftTeams_8wekyb3d8bbwe\TeamsStartupTask" /v "UserEnabledStartupOnce" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\MicrosoftTeams_8wekyb3d8bbwe\TeamsTfwStartupTask" /v "open_app_in_background" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\MicrosoftTeams_8wekyb3d8bbwe\TeamsTfwStartupTask" /v "State" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\MicrosoftTeams_8wekyb3d8bbwe\TeamsTfwStartupTask" /v "UserEnabledStartupOnce" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\VisualStudio\Telemetry" /v "TurnOffSwitch" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\VisualStudio\Feedback" /v "DisableFeedbackDialog" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\VisualStudio\Feedback" /v "DisableEmailInput" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\VisualStudio\Feedback" /v "DisableScreenshotCapture" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\VisualStudio\SQM" /v "OptIn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d "0" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
