@Echo On
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe delete "HKCU\Changes" /v "ExplorerChanged" /f
Reg.exe add "HKCU\Changes" /v "ExplorerChanged" /t REG_SZ /d "27JAN25" /f
Reg.exe add "HKCU\Control Panel" /v "EnableShareSettings" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\Accessibility" /v "MessageDuration" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\Accessibility" /v "Sound on Activation" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Accessibility" /v "Warning Sounds" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_DWORD /d "290" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_DWORD /d "290" /f
Reg.exe add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "58" /f
Reg.exe add "HKCU\Control Panel\Colors" /v "ActiveBorder" /t REG_SZ /d "000 128 255" /f
Reg.exe add "HKCU\Control Panel\Colors" /v "WindowFrame" /t REG_SZ /d "000 128 255" /f
Reg.exe add "HKCU\Control Panel\Cursors" /v "CursorCrosshairEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCR\CLSID\{9cd0827e-0ad1-4c27-93d0-29f4c4ecd3b2}" /ve /t REG_SZ /d "Local Group Policy Editor" /f
Reg.exe add "HKCR\CLSID\{9cd0827e-0ad1-4c27-93d0-29f4c4ecd3b2}" /v "InfoTip" /t REG_SZ /d "Starts the Local Group Policy Editor" /f
Reg.exe add "HKCR\CLSID\{9cd0827e-0ad1-4c27-93d0-29f4c4ecd3b2}" /v "System.ControlPanel.Category" /t REG_SZ /d "5" /f
Reg.exe add "HKCR\CLSID\{9cd0827e-0ad1-4c27-93d0-29f4c4ecd3b2}\DefaultIcon" /ve /t REG_SZ /d "%%SYSTEMROOT%%\System32\gpedit.dll" /f
Reg.exe add "HKCR\CLSID\{9cd0827e-0ad1-4c27-93d0-29f4c4ecd3b2}\Shell\Open\Command" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\mmc.exe %%SystemRoot%%\system32\gpedit.msc" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{9cd0827e-0ad1-4c27-93d0-29f4c4ecd3b2}" /ve /t REG_SZ /d "Local Group Policy Editor" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "AutoColorization" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "AutoEndTasks" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "DockMoving" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "DpiScalingVer" /t REG_DWORD /d "4096" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "DragFullWindows" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "2" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "ForegroundFlashCount" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d "116000" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "300" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "598" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "LockScreenAutoLockActive" /t REG_SZ /d "0" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "MaxVirtualDesktopDimension" /t REG_DWORD /d "11520" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "MaxMonitorDimension" /t REG_DWORD /d "7680" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "MouseWheelRouting" /t REG_DWORD /d "2" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "PreferredUILanguages" /t REG_MULTI_SZ /d "en-GB\0en-VI\0en-US\0he-IL\0en-IL" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "RestorePreviousStateRecalcBehavior" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "SmoothScroll" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9E12078010000000" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "WaitToKillServiceTimeout" /t REG_SZ /d "300" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "300" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "WheelScrollChars" /t REG_SZ /d "3" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "WheelScrollLines" /t REG_SZ /d "3" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "WindowArrangementActive" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "ActiveWndTrkTimeout" /t REG_DWORD /d "336" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoColorization" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "DelayLockInterval" /t REG_DWORD /d "137438953472" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "DockMoving" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "DpiScalingVer" /t REG_DWORD /d "4096" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "ForegroundFlashCount" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d "116000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "300" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "598" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LockScreenAutoLockActive" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_DWORD /d "1024" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MaxVirtualDesktopDimension" /t REG_DWORD /d "11520" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MaxMonitorDimension" /t REG_DWORD /d "7680" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MouseWheelRouting" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "PreferredUILanguages" /t REG_MULTI_SZ /d "en-GB\0en-VI\0en-US\0he-IL\0en-IL" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "RestorePreviousStateRecalcBehavior" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "SmoothScroll" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9E12078010000000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_DWORD /d "300" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillServiceTimeout" /t REG_DWORD /d "300" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WheelScrollChars" /t REG_SZ /d "3" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WheelScrollLines" /t REG_SZ /d "3" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WindowArrangementActive" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v "EnablePerProcessSystemDPI" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "598" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v "ScreenSaverIsSecure" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" /v "AllItemsIconView" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" /v "StartupPage" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop\LanguageConfiguration" /v "en-GB" /t REG_MULTI_SZ /d "en-gb\0en-vi\0en-us\0he-il\0en-il" /f
Reg.exe add "HKCU\Control Panel\Desktop\MuiCached" /v "MachinePreferredUILanguages" /t REG_MULTI_SZ /d "en-GB\0he-IL" /f
Reg.exe add "HKLM\Software\Classes\CLSID" /v "IsModernRCEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /t REG_SZ /d "" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop\WindowMetrics" /v "AppliedDPI" /t REG_DWORD /d "192" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop\WindowMetrics" /v "IconSpacing" /t REG_SZ /d "-1000" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop\WindowMetrics" /v "IconVerticalSpacing" /t REG_SZ /d "-1125" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop\WindowMetrics" /v "PaddedBorderWidth" /t REG_SZ /d "-15" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop\WindowMetrics" /v "ScrollHeight" /t REG_SZ /d "-285" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop\WindowMetrics" /v "ScrollWidth" /t REG_SZ /d "-285" /f
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "AppliedDPI" /t REG_DWORD /d "192" /f
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "IconSpacing" /t REG_SZ /d "-1000" /f
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "IconVerticalSpacing" /t REG_SZ /d "-1125" /f
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "PaddedBorderWidth" /t REG_SZ /d "-15" /f
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "ScrollHeight" /t REG_SZ /d "-285" /f
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "ScrollWidth" /t REG_SZ /d "-285" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Don't Load" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Don't Load" /v "inetcpl.cpl" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Don't Load" /v "intl.cpl" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Don't Load" /v "irprops.cpl" /t REG_SZ /d "No" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Don't Load" /v "joy.cpl" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Don't Load" /v "timedate.cpl" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Don't Load" /v "main.cpl" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Don't Load" /v "mmsys.cpl" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Don't Load" /v "tabletpc.cpl" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Don't Load" /v "telephon.cpl" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Control Panel\International" /v "BlockCleanupOfUnusedPreInstalledLangPacks" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iCalendarType" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iCountry" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iCurrDigits" /t REG_SZ /d "2" /f
Reg.exe add "HKCU\Control Panel\International" /v "iCurrency" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iDate" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iDigits" /t REG_SZ /d "2" /f
Reg.exe add "HKCU\Control Panel\International" /v "iFirstDayOfWeek" /t REG_SZ /d "6" /f
Reg.exe add "HKCU\Control Panel\International" /v "iFirstWeekOfYear" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iLZero" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iMeasure" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iNegCurr" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iNegNumber" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iPaperSize" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iTime" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iTimePrefix" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iTLZero" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "Locale" /t REG_SZ /d "00000809" /f
Reg.exe add "HKCU\Control Panel\International" /v "LocaleName" /t REG_SZ /d "en-VI" /f
Reg.exe add "HKCU\Control Panel\International" /v "NumShape" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "s1159" /t REG_SZ /d "AM" /f
Reg.exe add "HKCU\Control Panel\International" /v "s2359" /t REG_SZ /d "PM" /f
Reg.exe add "HKCU\Control Panel\International" /v "sCurrency" /t REG_SZ /d "$" /f
Reg.exe add "HKCU\Control Panel\International" /v "sDate" /t REG_SZ /d "/" /f
Reg.exe add "HKCU\Control Panel\International" /v "sDecimal" /t REG_SZ /d "." /f
Reg.exe add "HKCU\Control Panel\International" /v "sGrouping" /t REG_SZ /d "3;0" /f
Reg.exe add "HKCU\Control Panel\International" /v "sLanguage" /t REG_SZ /d "ENG" /f
Reg.exe add "HKCU\Control Panel\International" /v "sList" /t REG_SZ /d "," /f
Reg.exe add "HKCU\Control Panel\International" /v "sLongDate" /t REG_SZ /d "dddd, MMMM d, yyyy" /f
Reg.exe add "HKCU\Control Panel\International" /v "sMonDecimalSep" /t REG_SZ /d "." /f
Reg.exe add "HKCU\Control Panel\International" /v "sMonGrouping" /t REG_SZ /d "3;0" /f
Reg.exe add "HKCU\Control Panel\International" /v "sMonGrouping" /t REG_SZ /d "3;0" /f
Reg.exe add "HKCU\Control Panel\International" /v "sMonThousandSep" /t REG_SZ /d "," /f
Reg.exe add "HKCU\Control Panel\International" /v "sNativeDigits" /t REG_SZ /d "0123456789" /f
Reg.exe add "HKCU\Control Panel\International" /v "sNegativeSign" /t REG_SZ /d "-" /f
Reg.exe add "HKCU\Control Panel\International" /v "sPositiveSign" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Control Panel\International" /v "sShortDate" /t REG_SZ /d "M/d/yyyy" /f
Reg.exe add "HKCU\Control Panel\International" /v "sShortTime" /t REG_SZ /d "h:mm tt" /f
Reg.exe add "HKCU\Control Panel\International" /v "sThousand" /t REG_SZ /d "," /f
Reg.exe add "HKCU\Control Panel\International" /v "sTime" /t REG_SZ /d ":" /f
Reg.exe add "HKCU\Control Panel\International" /v "sTimeFormat" /t REG_SZ /d "h:mm:ss tt" /f
Reg.exe add "HKCU\Control Panel\International" /v "sYearMonth" /t REG_SZ /d "MMMM yyyy" /f
Reg.exe add "HKCU\Control Panel\International" /v "TurnOffAutocorrectMisspelledWords" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "TurnOffHighlightMisspelledWords" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "TurnOffInsertSpace" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "TurnOffOfferTextPredictions" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2" /f
Reg.exe add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f
Reg.exe add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Keyboard" /v "PrintScreenKeyForSnippingEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2" /f
Reg.exe add "HKCU\Keyboard Layout\Preload" /v "1" /t REG_SZ /d "00000809" /f
Reg.exe add "HKCU\Keyboard Layout\Preload" /v "2" /t REG_SZ /d "00000409" /f
Reg.exe add "HKCU\Keyboard Layout\Preload" /v "3" /t REG_SZ /d "0000040d" /f
Reg.exe add "HKCU\Keyboard Layout\Preload" /v "4" /t REG_SZ /d "d001040d" /f
Reg.exe add "HKCU\Keyboard Layout\Preload" /v "5" /t REG_SZ /d "00000415" /f
Reg.exe add "HKCU\Keyboard Layout\Preload" /v "6" /t REG_SZ /d "d0010809" /f
Reg.exe add "HKCU\Keyboard Layout\Substitutes" /v "d001040d" /t REG_SZ /d "0002040d" /f
Reg.exe add "HKCU\Keyboard Layout\Substitutes" /v "00000809" /t REG_SZ /d "00000409" /f
Reg.exe add "HKCU\Keyboard Layout\Substitutes" /v "d0010809" /t REG_SZ /d "00000809" /f
Reg.exe add "HKCU\Control Panel\International\Geo" /v "Nation" /t REG_SZ /d "252" /f
Reg.exe add "HKCU\Control Panel\International\Geo" /v "Name" /t REG_SZ /d "VI" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "InputMethodOverride" /t REG_SZ /d "0809:00000409" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "Languages" /t REG_MULTI_SZ /d "en-VI\0en-US\0en-GB\0en-IL\0he\0pl" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "ShowAutoCorrection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "ShowTextPrediction" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "ShowCasing" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "ShowShiftLock" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "WindowsOverride" /t REG_SZ /d "en-GB" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-GB" /v "0809:00000809" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-GB" /v "CachedLanguageName" /t REG_SZ /d "@Winlangdb.dll,-1110" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-GB" /v "FeaturesToInstall" /t REG_DWORD /d "227" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-GB" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-US" /v "0409:00000409" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-US" /v "CachedLanguageName" /t REG_SZ /d "@Winlangdb.dll,-1121" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-US" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\he-IL" /v "040D:0002040D" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\he-IL" /v "CachedLanguageName" /t REG_SZ /d "@Winlangdb.dll,-1202" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\he-IL" /v "FeaturesToInstall" /t REG_DWORD /d "227" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\he-IL" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "Languages" /t REG_SZ /d "en-GB,en-vi,en-US,he-IL,en-IL" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "ShowAutoCorrection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "ShowTextPrediction" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "ShowCasing" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "ShowShiftLock" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup\en-US" /v "0409:00000409" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup\en-GB" /v "0809:00000809" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup\en-IL" /v "0409:00000409" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup\he-IL" /v "040D:0002040D" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\International\User Profile System Backup\en-GB" /v "0809:00000809" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\International\User Profile System Backup\en-IL" /v "0409:00000409" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\International\User Profile System Backup\en-US" /v "0409:00000409" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\International\User Profile System Backup\he-IL" /v "040D:0002040D" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\CTF\LangBar\ItemState\{ED9D5450-EBE6-4255-8289-F8A31E687228}" /v "DemoteLevel" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\CTF\Assemblies\0x00000409\{34745C63-B2F0-4784-8B67-5E12C8701A31}" /v "Default" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\CTF\Assemblies\0x00000409\{34745C63-B2F0-4784-8B67-5E12C8701A31}" /v "Profile" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\CTF\Assemblies\0x00000409\{34745C63-B2F0-4784-8B67-5E12C8701A31}" /v "KeyboardLayout" /t REG_DWORD /d "67699721" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\CTF\Assemblies\0x00000809\{34745C63-B2F0-4784-8B67-5E12C8701A31}" /v "Default" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\CTF\Assemblies\0x00000809\{34745C63-B2F0-4784-8B67-5E12C8701A31}" /v "Profile" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\CTF\Assemblies\0x00000809\{34745C63-B2F0-4784-8B67-5E12C8701A31}" /v "KeyboardLayout" /t REG_DWORD /d "67700745" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\CTF\SortOrder\AssemblyItem\0x00000809\{34745C63-B2F0-4784-8B67-5E12C8701A31}\00000000" /v "CLSID" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\CTF\SortOrder\AssemblyItem\0x00000809\{34745C63-B2F0-4784-8B67-5E12C8701A31}\00000000" /v "KeyboardLayout" /t REG_DWORD /d "67700745" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\CTF\SortOrder\AssemblyItem\0x00000809\{34745C63-B2F0-4784-8B67-5E12C8701A31}\00000000" /v "Profile" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\CTF\SortOrder\Language" /v "00000000" /t REG_SZ /d "00002400" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\CTF\SortOrder\Language" /v "00000001" /t REG_SZ /d "00000809" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\CTF\SortOrder\Language" /v "00000002" /t REG_SZ /d "00000409" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\CTF\SortOrder\Language" /v "00000004" /t REG_SZ /d "0000040d" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\CTF\SortOrder\Language" /v "00000005" /t REG_SZ /d "00000415" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "ActiveWindowTracking" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "Beep" /t REG_SZ /d "No" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "DoubleClickHeight" /t REG_SZ /d "4" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "DoubleClickSpeed" /t REG_SZ /d "500" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "DoubleClickWidth" /t REG_SZ /d "4" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "ExtendedSounds" /t REG_SZ /d "No" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverHeight" /t REG_SZ /d "4" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "8" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverWidth" /t REG_SZ /d "4" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "6" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "10" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseTrails" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t REG_BINARY /d "0000000000000000156e000000000000004001000000000029dc0300000000000000280000000000" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /t REG_BINARY /d "0000000000000000fd11010000000000002404000000000000fc12000000000000c0bb0100000000" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "SnapToDefaultButton" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "SwapMouseButtons" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Sound" /v "Beep" /t REG_SZ /d "no" /f
Reg.exe add "HKCU\Control Panel\Sound" /v "ExtendedSounds" /t REG_SZ /d "no" /f
Reg.exe add "HKCU\Control Panel\TimeDate\AdditionalClocks\1" /v "Enable" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\TimeDate\AdditionalClocks\1" /v "DisplayName" /t REG_SZ /d "Israel" /f
Reg.exe add "HKCU\Control Panel\TimeDate\AdditionalClocks\1" /v "TzRegKeyName" /t REG_SZ /d "Israel Standard Time" /f
Reg.exe add "HKCU\Control Panel\TimeDate\AdditionalClocks\2" /v "PlaceHolder" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\TimeDate\AdditionalClocks\2" /v "Enable" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /v "NoAddingComponents" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /v "NoChangingWallpaper" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /v "NoComponents" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /v "NoChangingWallpaper" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Comdlg32" /v "NoFileMRU" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Comdlg32\Placesbar" /v "Place0" /t REG_SZ /d "Desktop" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "**del.StartPinAppsWhenInstalled" /t REG_SZ /d " " /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "admininfourl" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "DisableContextMenusInStart" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "DisableGraphRecentItems" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "DisableIndexedLibraryExperience" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "DisableMotWOnInsecurePathCopy" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchHistory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "DisableThumbsDBOnNetworkFolders" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "EnableShellShortcutIconRemotePath" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "ExplorerRibbonStartsMinimized" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "HideRecentlyAddedApps" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "HideRecommendedPersonalizedSites" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "HideRecommendedSection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "HideTaskViewButton" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoBalloonFeatureAdvertisements" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoDataExecutionPrevention" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoHeapTerminationOnCorruption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoNewAppAlert" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoPinningStoreToTaskbar" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoRemoteDestinations" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "HideSCAHealth" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoSearchEverywhereLinkInStartMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoWindowMinimizingShortcuts" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "ShowLockOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "ShowOrHideMostUsedApps" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "AddSearchInternetLinkInStartMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "ClearTilesOnExit" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DesktopAppsFirstInAppsView" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableControlCenter" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableGlobalSearchOnAppsView" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableGraphRecentItems" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableIndexedLibraryExperience" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchHistory" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableThumbsDBOnNetworkFolders" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "EnableLegacyBalloonNotifications" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "EnableShellShortcutIconRemotePath" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "ExplorerRibbonStartsMinimized" /t REG_DWORD /d "4" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "GoToDesktopOnSignIn" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "HideRecentlyAddedApps" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "HideRecommendedPersonalizedSites" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "HideRecommendedSection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "HideSCAHealth" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "HideTaskViewButton" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoBalloonFeatureAdvertisements" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoDataExecutionPrevention" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoHeapTerminationOnCorruption" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoNewAppAlert" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoPinningStoreToTaskbar" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoRemoteDestinations" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoSearchEverywhereLinkInStartMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoSearchInternetInStartMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoSearchInternetTryHarderButton" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoSMHelp" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoSMMyPictures" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoStartMenuDownloads" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoStartMenuHomegroup" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoStartMenuMyGames" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoStartMenuMyMusic" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoStartMenuRecordedTV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoStartMenuVideos" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoTaskGrouping" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoWindowMinimizingShortcuts" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "ShowHibernateOption" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "ShowLockOption" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "ShowOrHideMostUsedApps" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "ShowRunAsDifferentUserInStart" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "ShowSleepOption" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "ShowStartOnDisplayWithForegroundOnWinKey" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "ShowWindowsStoreAppsOnTaskbar" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "StartPinAppsWhenInstalled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "TaskbarGlomming" /t REG_DWORD /d "0" /f
Reg.exe delete "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "TaskbarNoMultimon" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "TryHarderPinnedOpenSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "Turn off user tracking" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer\StartPinAppsWhenInstalled" /v "**delvals." /t REG_SZ /d " " /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AllowOnlineTips" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AlwaysShowClassicMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ConfirmFileDelete" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableIndexedLibraryExperience" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableSearchHistory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableThumbnailCache" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableThumbnails" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowRun" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ForceActiveDesktopOn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ForceRunOnStartMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ForceStartMenuLogOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "GreyMSIAds" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCANetwork" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAPower" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAVolume" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "Intellimenus" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LinkResolveIgnoreLinkInfo" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LockTaskbar" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoActiveDesktop" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoActiveDesktopChanges" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoAutorun" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoAutoUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoCDBurning" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoChangeStartMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoClose" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoCommonGroups" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoControlPanel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDrivesInSendToMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoEncryptOnMove" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoFavoritesMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoFind" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoFolderOptions" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInstrumentation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetIcon" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoMSAppLogo5ChannelNotify" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoOnlinePrintsWizard" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoPreviewPane" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoPublishingWizard" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoReadingPane" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsNetHood" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRemoteChangeNotify" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRemoteRecursiveEvents" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSearchCommInStartMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSearchComputerLinkInStartMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSearchFilesInStartMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSearchInternetInStartMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSearchProgramsInStartMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSecurityTab" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSetTaskbar" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoShellSearchButton" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSimpleNetIDList" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSimpleStartMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSMBalloonTip" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSMConfigurePrograms" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSMHelp" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSMMyDocs" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSMMyPictures" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuEjectPC" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuMFUprogramsList" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuMorePrograms" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuMyGames" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuMyMusic" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuPinnedList" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuSubFolders" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoTaskGrouping" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoThumbnailCache" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoTrayContextMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoTrayItemsDisplay" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoUserFolderInStartMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoUserNameInStartMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoViewContextMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoViewOnDrive" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWebServices" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWelcomeScreen" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWinkeys" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "RestrictWelcomeCenter" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ShowSuperHidden" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "StartMenuFavorites" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "StartMenuLogOff" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "Start_ShowHelp" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "Start_ShowMyComputer" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "Start_ShowRun" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "TaskbarLockAll" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "TaskbarNoNotification" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "UseDesktopIniCache " /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "TurnOffSPIAnimations" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AllowOnlineTips" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AlwaysShowClassicMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ConfirmFileDelete" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableThumbnailCache" /t REG_DWORD /d "0" /f
Reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableThumbnails" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowRun" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ForceActiveDesktopOn" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ForceRunOnStartMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "GreyMSIAds" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "Intellimenus" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "IsWUHidden" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LinkResolveIgnoreLinkInfo" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LockTaskbar" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoActiveDesktop" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoActiveDesktopChanges" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoAutorun" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoCDBurning" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoChangeStartMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoClose" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoCommonGroups" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoControlPanel" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDrivesInSendToMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d "255" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoFavoritesMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoFind" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoFolderOptions" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInstrumentation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetIcon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoMSAppLogo5ChannelNotify" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoOnlinePrintsWizard" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoPreviewPane" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoPublishingWizard" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoReadingPane" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsNetHood" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRemoteChangeNotify" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRemoteRecursiveEvents" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoShellSearchButton" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSimpleNetIDList" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSMBalloonTip" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSMConfigurePrograms" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSMHelp" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSMMyDocs" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSMMyPictures" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSearchCommInStartMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSearchInternetInStartMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSecurityTab" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSetTaskbar" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuEjectPC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuMFUprogramsList" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuMorePrograms" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuMyGames" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuMyMusic" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuSubFolders" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuNetworkPlaces" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoTaskGrouping" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoThumbnailCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoTrayContextMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoTrayItemsDisplay" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoUserFolderInStartMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoViewContextMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoViewOnDrive" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWebServices" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWelcomeScreen" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWinkeys" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "SettingsPageVisibility" /t REG_SZ /d "hide:appsforwebsites; cortana; cortana-windowssearch; datausage; deviceencryption; easeofaccess-eyecontrol; easeofaccess-narrator; easeofaccess-speechrecognition; gaming-broadcasting; gaming-gamebar; gaming-gamedvr; gaming-gamemode; gaming-xboxnetworking; holographic-audio; holographic-headset; holographic-management; maps; mobile-devices; network-airplanemode; network-cellular; network-dialup; network-mobilehotspot; network-vpn; network-wificalling; nfctransactions; pen; privacy-automaticfiledownloads; privacy-feedback; privacy-holographic-environment; regionlanguage-chsime-pinyin; regionlanguage-chsime-wubi; regionlanguage-jpnime; regionlanguage-korime; search-moredetails; search-permissions; speech; tabletmode; videoplayback; workplace" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ShowSuperHidden" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "StartMenuLogOff" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "StartMenuMorePrograms" /t REG_DWORD /d "1" /f
Reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "TaskbarLockAll" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "TaskbarNoNotification" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "TurnOffSPIAnimations" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "UseDesktopIniCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl" /v "1" /t REG_SZ /d "Microsoft.IndexingOptions" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "1" /t REG_SZ /d "skypesetup.exe" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "3" /t REG_SZ /d "Groove.exe" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "5" /t REG_SZ /d "Software_reporter_tool.exe" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "6" /t REG_SZ /d "LicensingUI.exe" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "7" /t REG_SZ /d "C:\Windows\System32\Smartscreen.exe" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "8" /t REG_SZ /d "nada*.exe" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Windows\Sidebar" /v "TurnOffSidebar" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Windows\Sidebar" /v "TurnOffUserInstalledGadgets" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AltTabSettings" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AppReadinessLogonComplete" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "Browse For Folder Width" /t REG_DWORD /d "318" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "Browse For Folder Height" /t REG_DWORD /d "333" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "DesktopProcess" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ExplorerStartupTraceRecorded" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "FirstRunTelemetryComplete" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "HubMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "IrisClientRefresh" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "Link" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowDriveLettersFirst" /t REG_DWORD /d "4" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShortcutNameTemplate" /t REG_SZ /d "\"%%s.lnk\"" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecommendations" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "TelemetrySalt" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AltTabSettings" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDLL" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "DesktopProcess" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "DisableEdgeDesktopShortcutCreation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "DisallowCpl" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ExplorerStartupTraceRecorded" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "GlobalAssocChangedCounter" /t REG_DWORD /d "1285" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "HubMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "IrisClientRefresh" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "Link" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /t REG_DWORD /d "8192" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "MultipleInvokePromptMinimum" /t REG_DWORD /d "768" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "NoPreviousVersionsPage" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "NoSaveSettings" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "PostAppInstallTasksCompleted" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShellState" /t REG_BINARY /d "240000003fa000000000000000000000000000000100000013000000000000004b000000" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowDriveLettersFirst" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecommendations" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "off" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "TelemetrySalt" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "99EBFF004CC2FF000091F8000078D4000067C000003E9200001A6800F7630C00" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "4290799360" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "4292114432" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowLockOption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowSleepOption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PreviousVersions" /v "DisableLocalPage" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AllowGameDVR" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AlwaysShowMenus" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AutoCheckSelect" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DesktopLivePreviewHoverTime" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "displayIconThumb" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisablePreviewDesktop" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbnailCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbsDBOnNetworkFolders" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DontPrettyPath" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DontUsePowerShellOnWinX" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableSnapAssistFlyout" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EncryptionContextMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ExtendedUIHoverTime" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "FolderContentsInfoTip" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "FullPath" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "FullPath" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "fullPathAddress" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideDrivesWithNoMedia" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideIcons" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideMergeConflicts" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "JointResize" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LastActiveClick" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "MapNetDrvBtn" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "MMTaskbarGlomLevel" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "MMTaskbarMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllCloudStates" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NoNetCrawling" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NoThumbnailCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "OnboardUnpinCortana" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "PersistBrowsers" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ServerAdminUI" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SharingWizardOn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCompColor" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowEncryptCompressedColor" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowInfoTip" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowPreviewHandlers" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowStatusBar" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSystrayDateTimeValueName" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTypeOverlay" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapAssist" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapFill" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartMenuAdminTools" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartShownOnUpgrade" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_AccountNotifications" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_IrisRecommendations" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_NotifyNewApps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_SearchFiles" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_SearchPrograms" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_ShowMyGames" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartMenuAdminTools" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SuperHidden" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarFlashing" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSi" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSn" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TypeAhead" /t REG_DWORD /d "16" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "useCheckBoxes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseCompactMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "useSharingWizard" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "WebView" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AllowGameDVR" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AlwaysShowMenus" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AutoCheckSelect" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DesktopLivePreviewHoverTime" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "displayIconThumb" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisablePreviewDesktop" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbnailCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbsDBOnNetworkFolders" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DontPrettyPath" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DontUsePowerShellOnWinX" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableSnapAssistFlyout" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EncryptionContextMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ExtendedUIHoverTime" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "FolderContentsInfoTip" /t REG_DWORD /d "1" /f
Reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "FullPath" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "FullPath" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "fullPathAddress" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideDrivesWithNoMedia" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideIcons" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideMergeConflicts" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "JointResize" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LastActiveClick" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "MapNetDrvBtn" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "MMTaskbarGlomLevel" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "MMTaskbarMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllCloudStates" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NoNetCrawling" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NoThumbnailCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "OnboardUnpinCortana" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "PersistBrowsers" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ServerAdminUI" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SharingWizardOn" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCompColor" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowEncryptCompressedColor" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowInfoTip" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowPreviewHandlers" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowStatusBar" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSystrayDateTimeValueName" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTypeOverlay" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapAssist" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapFill" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartMenuAdminTools" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartShownOnUpgrade" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_AccountNotifications" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_IrisRecommendations" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_NotifyNewApps" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_SearchFiles" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_SearchPrograms" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_ShowMyGames" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartMenuAdminTools" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SuperHidden" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarFlashing" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSi" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSn" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TypeAhead" /t REG_DWORD /d "16" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "useCheckBoxes" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseCompactMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "useSharingWizard" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "WebView" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\Switcher" /v "CloseDwellTimeout" /t REG_DWORD /d "300" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\Switcher" /v "MouseCloseThresholdPercent" /t REG_DWORD /d "80" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\Switcher" /v "TouchCloseThresholdPercent" /t REG_DWORD /d "80" /f
Reg.exe add "HKLM\Software\Classes\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962227469" /f
Reg.exe add "HKLM\Software\Classes\CLSID\{323CA680-C24D-4099-B94D-446DD2D7249E}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2696937728" /f
Reg.exe add "HKLM\Software\Classes\CLSID\{679f85cb-0220-4080-b29b-5540cc05aab6}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2689597440" /f
Reg.exe add "HKLM\Software\Classes\WOW6432Node\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962227469" /f
Reg.exe add "HKLM\Software\Classes\WOW6432Node\CLSID\{323CA680-C24D-4099-B94D-446DD2D7249E}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2696937728" /f
Reg.exe add "HKLM\Software\Classes\WOW6432Node\CLSID\{679f85cb-0220-4080-b29b-5540cc05aab6}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2689597440" /f
Reg.exe delete "HKCR\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\AlwaysShowMenus\Policy\AlwaysShowClassicMenu" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\DesktopProcess\Policy\SeparateProcess" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "FullPath" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "FullPathAddress" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "Settings" /t REG_BINARY /d "0C0002002B01000060000000" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People\ShoulderTap" /v "ShoulderTap" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings" /v "TaskbarEndTask" /t REG_DWORD /d "1" /f
Reg.exe delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v "IconStreams" /f
Reg.exe delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v "PasticonsStream" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v "SystemTrayChevronVisibility" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarOpenOnHover" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "BottomMarginPx" /t REG_DWORD /d "16" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_BINARY /d "ff" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "FavoritesChanges" /t REG_DWORD /d "91" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "FavoritesRemovedChanges" /t REG_DWORD /d "15" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "FavoritesVersion" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "LeftMarginPx" /t REG_DWORD /d "16" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "MaxThumbSizePx" /t REG_DWORD /d "200" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "MinThumbSizePx" /t REG_DWORD /d "200" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "NumThumbnails" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "RightMarginPx" /t REG_DWORD /d "16" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "ThumbSpacingXPx" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "ThumbSpacingYPx" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "TopMarginPx" /t REG_DWORD /d "16" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "pageTaskbarThumbnails" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\AuxilliaryPins" /v "MailPin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\AuxilliaryPins" /v "TFLPin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Chat" /v "ChatIcon" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Chat" /v "link" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Communications" /v "ConfigureChatAutoInstall" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\software\policies\Microsoft\Conferencing" /v "**del.NoRDS" /t REG_SZ /d "" /f
Reg.exe add "HKLM\software\policies\Microsoft\Conferencing" /v "NoChat" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\software\policies\Microsoft\Conferencing" /v "NoNewWhiteBoard" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Clipboard" /v "EnableClipboardHistory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_SearchFiles" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v "AutoSuggest" /t REG_SZ /d "yes" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v "AutoSuggest" /t REG_SZ /d "yes" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v "Append Completion" /t REG_SZ /d "yes" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "FullPath" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "FullPathAddress" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\NavPane" /v "ExpandedState" /t REG_BINARY /d "08000000160014001f80cb859f6720028040b29b5540cc05aab60000010000004d0000001c00000031535053a66a63283d95d211b5d600c04fd918d0000000002d00000031535053357ec777e31b5043a48c7563d727776d1100000002000000000b000000ffff00000000000000000000160014001f50e04fd020ea3a6910a2d808002b30309d0000010000004d0000001c00000031535053a66a63283d95d211b5d600c04fd918d0000000002d00000031535053357ec777e31b5043a48c7563d727776d1100000002000000000b000000ffff00000000000000000000160014001f580d1a2cf021be504388b07367fc96ef3c0000010000004d0000001c00000031535053a66a63283d95d211b5d600c04fd918d0000000002d00000031535053357ec777e31b5043a48c7563d727776d1100000002000000000b000000000000000000000000000000570055001f002f0010b7a6f519002f4e3a5c00000000000000000000000000000000000000000000000000000000000000000000000000741a595e96dfd3488d671733bcee28ba772cfbf52f0e164aa3813e560c68bc830000010000004d0000001c00000031535053a66a63283d95d211b5d600c04fd918d0000000002d00000031535053357ec777e31b5043a48c7563d727776d1100000002000000000b000000000000000000000000000000570055001f002f0010b7a6f519002f473a5c00000000000000000000000000000000000000000000000000000000000000000000000000741a595e96dfd3488d671733bcee28ba772cfbf52f0e164aa3813e560c68bc830000010000004d0000001c00000031535053a66a63283d95d211b5d600c04fd918d0000000002d00000031535053357ec777e31b5043a48c7563d727776d1100000002000000000b000000000000000000000000000000570055001f002f0010b7a6f519002f523a5c00000000000000000000000000000000000000000000000000000000000000000000000000741a595e96dfd3488d671733bcee28ba772cfbf52f0e164aa3813e560c68bc830000010000004d0000001c00000031535053a66a63283d95d211b5d600c04fd918d0000000002d00000031535053357ec777e31b5043a48c7563d727776d1100000002000000000b000000000000000000000000000000570055001f002f0010b7a6f519002f573a5c00000000000000000000000000000000000000000000000000000000000000000000000000741a595e96dfd3488d671733bcee28ba772cfbf52f0e164aa3813e560c68bc830000010000004d0000001c00000031535053a66a63283d95d211b5d600c04fd918d0000000002d00000031535053357ec777e31b5043a48c7563d727776d1100000002000000000b000000000000000000000000000000570055001f002f0010b7a6f519002f463a5c00000000000000000000000000000000000000000000000000000000000000000000000000741a595e96dfd3488d671733bcee28ba772cfbf52f0e164aa3813e560c68bc830000010000004d0000001c00000031535053a66a63283d95d211b5d600c04fd918d0000000002d00000031535053357ec777e31b5043a48c7563d727776d1100000002000000000b000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MultiTaskingView\AllUpView" /v "AllUpView" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MultiTaskingView\AllUpView" /v "Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\DontShowMeThisDialogAgain" /v "WarnBeforeCloseBand" /t REG_SZ /d "NO" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates" /v "ShortcutNameTemplate" /t REG_SZ /d "\"%%s.lnk\"" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v "EnthusiastMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences" /v "AutoWildCard" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences" /v "EnableNaturalQuerySyntax" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences" /v "WholeFileSystem" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences" /v "SystemFolders" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences" /v "ArchivedFiles" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\PrimaryProperties\UnindexedLocations" /v "SearchOnly" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\SearchPlatform\Preferences" /v "BreadCrumbBarSearchDefault" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\SearchPlatform\Preferences" /v "DisableAutoNavigateURL" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\SearchPlatform\Preferences" /v "DisableAutoResolveEmailAddrs" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\SearchPlatform\Preferences" /v "DisableResultsInNewWindow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\SearchPlatform\Preferences" /v "DisableTabbedBrowsing" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\SearchPlatform\Preferences" /v "EditSavedSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\SearchPlatform\Preferences" /v "IEAddressBarSearchDefault" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ConnectedSearch" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "AnyAboveLockAppsActive" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CanCortanaBeEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaCapabilities" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaInAmbientMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaIsReplaced" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "DeviceHistoryEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "HasAboveLockTips" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "IsWindowsHelloActive" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaCapabilities" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaInAmbientMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "DeviceHistoryEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "IsAssignedAccess" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "IsMicrophoneAvailable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "IsWindowsHelloActive" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsAADCloudSearchEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDynamicSearchBoxEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsMSACloudSearchEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "SafeSearchMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaInAAD" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaInAADPathOOBE" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowIndexingEncryptedStoresOrItems" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowUsingDiacritics" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AlwaysUseAutoLangDetection" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AutoIndexSharedFolders" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchPrivacy" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchSafeSearch" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableAutomaticRemovableDriveIndexing" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableCheckUrlWPSystem" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableEDPVolumeProtection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableFindMyFilesExperimentOverride" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableRemovableDriveIndexing" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableSoftReset" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "EnableDynamicContentInWSB" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "EnableIndexingDelegateMailboxes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "FindMyFilesExperimentOverride" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "PreventIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexingPublicFolders" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexOnBattery" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Search\Gather\Windows\SystemIndex" /v "LogDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Search\Gather\Windows\SystemIndex" /v "StreamLogsDirectory" /t REG_SZ /d "D:\Temp" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Search\Gathering Manager" /v "TempPath" /t REG_SZ /d "D:\Temp" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Search\SemanticIndexer" /v "EnableSemanticIndexing" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "AnyAboveLockAppsActive" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "CanCortanaBeEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "CortanaInAmbientMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "CortanaIsReplaced" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "DeviceHistoryEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "HasAboveLockTips" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "IsWindowsHelloActive" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Search" /v "DisableAutomaticRemovableDriveIndexing" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Search" /v "DisableCheckUrlWPSystem" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Search" /v "DisableEDPVolumeProtection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Search" /v "DisableFindMyFilesExperimentOverride" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Search" /v "DisableSoftReset" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Search" /v "FindMyFilesExperimentOverride" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Search" /v "IndexUserProfilesRoot" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Search\CurrentPolicies" /v "AllowIndexingEncryptedStoresOrItems" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Search\CurrentPolicies" /v "DisableRemovableDriveIndexing" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Search\CurrentPolicies" /v "PreventIndexingPublicFolders" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\PolicyManager\Default\Search\DisableSearch" /v "Value" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\SearchCompanion" /v "DisableContentFileUpdates" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\PolicyManager\Default\Experience\AllowCortana" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\PolicyManager\default\Experience\AllowSyncMySettings" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "Startupdelayinmsec" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SharedTaskScheduler" /v "MaxWorkerThreadsPerScheduler" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "4" /t REG_SZ /d "%%SystemRoot%%\system32\imageres.dll,-5100" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "77" /t REG_SZ /d "C:\ProgramData\empty.ico" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "179" /t REG_SZ /d "C:\ProgramData\empty.ico" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Desktop" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Documents" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Documents" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal" /t REG_SZ /d "d:\Users\Ariel" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Desktop" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Documents" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Documents" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal" /t REG_SZ /d "d:\Users\%%Username%%" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{3D644C9B-1FB8-4f30-9B45-F670235F79C0}" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Common Desktop" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Common Documents" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "CommonMusic" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "CommonPictures" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "CommonVideo" /t REG_SZ /d "d:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Common Desktop" /t REG_SZ /d "d:\\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Common Documents" /t REG_SZ /d "d:\\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "CommonMusic" /t REG_SZ /d "d:\\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "CommonPictures" /t REG_SZ /d "d:\\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "CommonVideo" /t REG_SZ /d "d:\\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Common Desktop" /t REG_EXPAND_SZ /d "D:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Common Documents" /t REG_EXPAND_SZ /d "D:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "CommonMusic" /t REG_EXPAND_SZ /d "D:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "CommonPictures" /t REG_EXPAND_SZ /d "D:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "CommonVideo" /t REG_EXPAND_SZ /d "D:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{3D644C9B-1FB8-4f30-9B45-F670235F79C0}" /t REG_EXPAND_SZ /d "D:\Desktop" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\ShellServiceObjects\!{68ddbb56-9d1d-4fd9-89c5-c0da2a625392}" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\ShellServiceObjects\!{78DE489B-7931-4f14-83B4-C56D38AC9FFA}" /v "Comment" /t REG_SZ /d "OneDrive SSO" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\ShellServiceObjects\!{DA67B8AD-E81B-4c70-9B91-B417B5E33527}" /v "Comment" /t REG_SZ /d "Shell Search" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\ShellServiceObjects\!{EF4D1E1A-1C87-4AA8-8934-E68E4367468D}" /v "Comment" /t REG_SZ /d "Web Search" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\ShellServiceObjects\!{fbeb8a05-beee-4442-804e-409d6c4515e9}" /v "Comment" /t REG_SZ /d "CD Burning" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\ShellServiceObjects\!{ff363bfe-4941-4179-a81c-f3f1ca72d820}" /v "Comment" /t REG_SZ /d "HomeGroup SSO" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v "BackgroundType" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons" /v "{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons" /v "{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons" /v "{088e3905-0323-4b02-9826-5d99428e115f}" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons" /v "{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons" /v "{d3162b92-9365-467a-956b-92703aca08af}" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Ribbon" /v "MinimizedStateTabletModeOff" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "4291196160" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "3288364486" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "ColorizationColorBalance" /t REG_DWORD /d "89" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "ColorizationAfterglow" /t REG_DWORD /d "3288364486" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "ColorizationAfterglowBalance" /t REG_DWORD /d "10" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "ColorizationBlurBalance" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "ColorizationGlassAttribute" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "DisallowAnimations" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "DisallowColorizationColorChanges" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "DisallowFlip3d" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "EnableWindowColorization" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DWM" /v "ForceDisableModeChangeAnimation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "4291196160" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\DWM" /v "ColorizationAfterglow" /t REG_DWORD /d "3288364486" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\DWM" /v "ColorizationAfterglowBalance" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\DWM" /v "ColorizationBlurBalance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "3288364486" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\DWM" /v "ColorizationColorBalance" /t REG_DWORD /d "89" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\DWM" /v "ColorizationGlassAttribute" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\DWM" /v "EnableWindowColorization" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\DWM" /v "ForceDisableModeChangeAnimation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "4291196160" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationAfterglow" /t REG_DWORD /d "3288364486" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationAfterglowBalance" /t REG_DWORD /d "10" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationBlurBalance" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "3288364486" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColorBalance" /t REG_DWORD /d "89" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationGlassAttribute" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableWindowColorization" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "ForceDisableModeChangeAnimation" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell" /v "BagMRU Size" /t REG_DWORD /d "86016" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /v "NodeSlots" /t REG_BINARY /d "0202" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "FolderType" /t REG_SZ /d "NotSpecified" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell\{5C4F28B5-F869-4E84-8E60-F11DB97C5CC7}" /v "FileOpenDialog" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell\{885A186E-A440-4ADA-812B-DB871B942259}" /v "Mode" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell\{885A186E-A440-4ADA-812B-DB871B942259}" /v "GroupView" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ARSOUserConsent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "CachedLogonsCount" /t REG_SZ /d "10" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultUserName" /t REG_SZ /d "Ariel" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DisableCAD" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "EnableFirstLogonAnimation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ReportBootOk" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ARSOUserConsent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "CachedLogonsCount" /t REG_SZ /d "10" /f
Reg.exe add "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultUserName" /t REG_SZ /d "Ariel" /f
Reg.exe add "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DisableCAD" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "EnableFirstLogonAnimation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ReportBootOk" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "FFlags" /t REG_DWORD /d "1210057252" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "GroupByDirection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "GroupByKey:FMTID" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "GroupByKey:PID" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "GroupView" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "IconNameVersion" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "IconSize" /t REG_DWORD /d "59" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "LogicalViewMode" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "Mode" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "Sort" /t REG_BINARY /d "0000000000000000000000000000000000000000" /f
Reg.exe add "HKLM\Software\Microsoft\Shell\ActionCenter\Quick Actions" /v "PinnedQuickActionSlotCount" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ActionCenvter\Quick Actions\All\SystemSettings_Launcher_QuickNote" /v "Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "ConfigureWindowsSpotlight" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableCloudOptimizedContent" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableConsumerAccountStateContent" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSpotlightCollectionOnDesktop" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableTailoredExperiencesWithDiagnosticData" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightOnActionCenter" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightOnSettings" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightWindowsWelcomeExperience" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "IncludeEnterpriseSpotlight" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CuratedTileCollections\Migration" /v "MigrationPending" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DesktopSpotlight\Settings" /v "EnabledState" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Classes\AllFilesystemObjects\Shellex\ContextMenuHandlers\FileLocksmithExt" /f
Reg.exe delete "HKLM\Software\Classes\AllFilesystemObjects\Shellex\ContextMenuHandlers\PowerRenameExt" /f
Reg.exe delete "HKCR\AllFilesystemObjects\Shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}" /f
Reg.exe delete "HKCR\AllFilesystemObjects\Shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c9}" /f
Reg.exe delete "HKCR\AllFilesystemObjects\ShellEx\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
Reg.exe delete "HKCR\AllFilesystemObjects\ShellEx\ContextMenuHandlers\CopyAsPathMenu" /f
Reg.exe delete "HKLM\Software\Classes\AllFilesystemObjects\ShellEx\ContextMenuHandlers\DaemonShellExtDriveUltra" /f
Reg.exe delete "HKLM\SOFTWARE\Classes\AllFilesystemObjects\ShellEx\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c9}" /f
Reg.exe delete "HKCR\AllFilesystemObjects\ShellEx\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
Reg.exe add "HKLM\Software\Classes\AllFilesystemObjects\Shellex\ContextMenuHandlers\SendTo" /ve /t REG_SZ /d "{7BA4C740-9E81-11CF-99D3-00AA004AE837}" /f
Reg.exe add "HKCR\AllFilesystemObjects\Shellex\ContextMenuHandlers\UnlockerShellExtension" /ve /t REG_SZ /d "{DDE4BEEB-DDE6-48fd-8EB5-035C09923F83}" /f
Reg.exe add "HKCR\AllFilesystemObjects\Shellex\ContextMenuHandlers\UnlockerShellExtension" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\Folder\ShellEx\ContextMenuHandlers\UnlockerShellExtension" /ve /t REG_SZ /d "{DDE4BEEB-DDE6-48fd-8EB5-035C09923F83}" /f
Reg.exe delete "HKCR\*\Shell\pintohomefile" /f
Reg.exe delete "HKCR\*\Shell\removeproperties" /f
Reg.exe delete "HKCR\*\Shell\Screen Snip" /f
Reg.exe delete "HKCR\*\ShellEx\ContextMenuHandlers\Sharing" /f
Reg.exe delete "HKCR\*\Shell\UpdateEncryptionSettingsWork" /f
Reg.exe delete "HKCR\*\Shellex\ContextMenuHandlers\EPP" /f
Reg.exe delete "HKCR\*\ShellEx\PropertySheetHandlers\CryptoSignMenu" /f
Reg.exe delete "HKCR\*\Shellex\ContextMenuHandlers\Open With EncryptionMenu" /f
Reg.exe delete "HKCR\*\Shellex\ContextMenuHandlers\WorkFolders" /f
Reg.exe delete "HKCR\*\Background\Shell\Screen Snip" /f
Reg.exe delete "HKCR\*\Background\Shell\OpenElevatedPS" /f
Reg.exe delete "HKCR\*\Background\Shell\PowerShell" /f
Reg.exe delete "HKCR\*\Background\Shellex\ContextMenuHandlers\Sharing" /f
Reg.exe delete "HKLM\SOFTWARE\Classes\*\ShellEx\ContextMenuHandlers\7-Zip" /f
Reg.exe delete "HKLM\SOFTWARE\Classes\*\ShellEx\ContextMenuHandlers\ FileSyncEx" /f
Reg.exe delete "HKCR\*\Shell\TakeOwnership" /f
Reg.exe delete "HKCR\*\Shell\NSuDo" /f
Reg.exe delete "HKCR\*\Shell\WForceDelete" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\Shell\RunAs" /ve /t REG_SZ /d "Take Ownership" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\Shell\RunAs" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\Shell\RunAs" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\Shell\RunAs" /v "Position" /t REG_SZ /d "Top" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\Shell\RunAs\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \'%%1\' && icacls \'%%1\' /grant administrators:F" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\Shell\RunAs\command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo /c takeown /f \'%%1\' && icacls \'%%1\' /grant administrators:F" /f
Reg.exe add "HKCR\*\Background\Shell\ANotepad++64" /ve /t REG_SZ /d "Notepad++ Context menu" /f
Reg.exe add "HKCR\*\Background\Shell\ANotepad++64" /v "ExplorerCommandHandler" /t REG_SZ /d "{B298D29A-A6ED-11DE-BA8C-A68E55D89593}" /f
Reg.exe add "HKCR\*\Background\Shell\ANotepad++64" /v "NeverDefault" /t REG_SZ /d "" /f
Reg.exe delete "HKCR\*\ShellEx\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}" /f
Reg.exe delete "HKCR\*\ShellEx\ContextMenuHandlers\Open With EncryptionMenu" /f
Reg.exe add "HKCR\*\Shellex\PropertySheetHandlers\Sharing" /ve /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
Reg.exe add "HKCR\*\ShellEx\PropertySheetHandlers\CryptoSignMenu" /ve /t REG_SZ /d "{7444C719-39BF-11D1-8CD9-00C04FC29D45}" /f
Reg.exe add "HKCR\*\ShellEx\PropertySheetHandlers\CryptoSignMenu" /v "SuppressionPolicy" /t REG_DWORD /d "1048576" /f
Reg.exe add "HKCR\*\ShellEx\PropertySheetHandlers\{3EA48300-8CF6-101B-84FB-666CCB9BCD32}" /ve /t REG_SZ /d "OLE DocFile Property Page" /f
Reg.exe add "HKCR\*\ShellEx\PropertySheetHandlers\{3EA48300-8CF6-101B-84FB-666CCB9BCD32}" /v "SuppressionPolicy" /t REG_DWORD /d "1048576" /f
Reg.exe add "HKCR\*\ShellEx\PropertySheetHandlers\{883373C3-BF89-11D1-BE35-080036B11A03}" /ve /t REG_SZ /d "Summary Properties Page" /f
Reg.exe add "HKCR\*\ShellEx\PropertySheetHandlers\{883373C3-BF89-11D1-BE35-080036B11A03}" /v "SuppressionPolicy" /t REG_DWORD /d "1048576" /f
Reg.exe add "HKCR\*\ShellEx\ContextMenuHandlers\Offline Files" /ve /t REG_SZ /d "{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f
Reg.exe add "HKCR\*\ShellEx\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
Reg.exe add "HKLM\Software\Classes\*\Shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
Reg.exe add "HKLM\Software\Classes\*\Shellex\ContextMenuHandlers\SendTo" /ve /t REG_SZ /d "{7BA4C740-9E81-11CF-99D3-00AA004AE837}" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\ShellEx\ContextMenuHandlers\Open With" /ve /t REG_SZ /d "{09799AFB-AD67-11d1-ABCD-00C04FC30936}" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\ShellEx\ContextMenuHandlers\Sharing" /ve /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\ShellEx\ContextMenuHandlers\AutorunsDisabled\FileSyncEx" /f
Reg.exe add "HKCR\*\ShellEx\PropertySheetHandlers\Offline Files" /ve /t REG_SZ /d "{7EFA68C6-086B-43e1-A2D2-55A113531240}" /f
Reg.exe add "HKCR\*\Shellex\PropertySheetHandlers\{1f2e5c40-9550-11ce-99d2-00aa006e086c}" /f
Reg.exe delete "HKCR\*\Background\Shell\TakeOwnership" /f
Reg.exe delete "HKCR\*\Background\Shell\NSuDo" /f
Reg.exe delete "HKCR\*\Background\Shell\WForceDelete" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\Background\Shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe,0" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\Background\Shell\runas" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\Background\Shell\runas" /ve /t REG_SZ /d "Command Prompt (Admin)" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\Background\Shell\runas\Command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo" /f
Reg.exe add "HKCR\*\Background\Shell\Snipping Tool" /v "Extended" /t REG_SZ /d "" /f
Reg.exe add "HKCR\*\Background\Shell\Snipping Tool" /v "Icon" /t REG_SZ /d "snippingtool.exe,0" /f
Reg.exe add "HKCR\*\Background\Shell\Snipping Tool" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\*\Background\Shell\Snipping Tool\Command" /ve /t REG_SZ /d "snippingtool.exe" /f
Reg.exe add "HKCR\*\Background\Shell\TakeOwnership" /ve /t REG_SZ /d "Take Ownership" /f
Reg.exe add "HKCR\*\Background\Shell\TakeOwnership" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\*\Background\Shell\TakeOwnership" /v "Icon" /t REG_SZ /d "imageres.dll,-78" /f
Reg.exe add "HKCR\*\Background\Shell\TakeOwnership" /v "NeverDefault" /t REG_SZ /d "" /f
Reg.exe add "HKCR\*\Background\Shell\TakeOwnership" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKCR\*\Background\Shell\TakeOwnership" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\*\Background\Shell\TakeOwnership\Command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo /c takeown /f \'%%1\' && icacls \'%%1\' /grant administrators:F" /f
Reg.exe add "HKCR\*\Background\Shell\TakeOwnership\Command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo /c takeown /f \'%%1\' && icacls \'%%1\' /grant administrators:F" /f
Reg.exe add "HKCR\*\Background\Shell\WForceDelete" /ve /t REG_SZ /d "Force delete" /f
Reg.exe add "HKCR\*\Background\Shell\WForceDelete" /v "ICON" /t REG_SZ /d "D:\Program Files (x86)\Wise Force Deleter\forcedeleter.ico" /f
Reg.exe add "HKCR\*\Background\Shell\WForceDelete" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\*\Background\Shell\WForceDelete\Command" /ve /t REG_SZ /d "D:\Program Files (x86)\Wise Force Deleter\WiseDeleter.exe -force \'%%1\'" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\Background\Shell\Create Restore Point" /v "Icon" /t REG_SZ /d "SystemPropertiesProtection.exe" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\Background\Shell\Create Restore Point" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\Background\Shell\Create Restore Point\Command" /ve /t REG_SZ /d "WScript C:\RestorePoint.vbs" /f
Reg.exe add "HKCR\*\Background\ShellEx\ContextMenuHandlers\Offline Files" /ve /t REG_SZ /d "{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f
Reg.exe add "HKCR\*\Background\ShellEx\PropertySheetHandlers\Offline Files" /ve /t REG_SZ /d "{7EFA68C6-086B-43e1-A2D2-55A113531240}" /f
Reg.exe add "HKCR\*\Background\Shellex\PropertySheetHandlers\Sharing" /ve /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
Reg.exe delete "HKCR\DesktopBackground\Shell\Control Panel" /f
Reg.exe delete "HKCR\DesktopBackground\Shell\EditStickers" /f
Reg.exe delete "HKCR\DesktopBackground\Shell\KillNRTasks" /f
Reg.exe delete "HKCR\DesktopBackground\Shell\Personalize" /f
Reg.exe delete "HKCR\DesktopBackground\Shell\runas" /f
Reg.exe delete "HKCR\DesktopBackground\Shellex\ContextMenuHandlers\DesktopSlideshow" /f
Reg.exe delete "HKLM\Software\Classes\DesktopBackground\Shell\Task Manager" /f
Reg.exe add "HKLM\Software\Classes\DesktopBackground\Shell\God Mode" /v "Icon" /t REG_SZ /d "control.exe" /f
Reg.exe add "HKLM\Software\Classes\DesktopBackground\Shell\God Mode" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKLM\Software\Classes\DesktopBackground\Shell\God Mode\Command" /ve /t REG_SZ /d "explorer Shell:::{ED7BA470-8E54-465E-825C-99712043E01C}" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Kill NR Tasks" /v "icon" /t REG_SZ /d "taskmgr.exe,-30651" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Kill NR Tasks" /v "MUIverb" /t REG_SZ /d "Kill all not responding tasks" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Kill NR Tasks" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Kill NR Tasks\command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo /C taskkill.exe /f /fi \"status eq Not Responding\" & Pause" /f
Reg.exe add "HKLM\SOFTWARE\Classes\DesktopBackground\Shell\Screen Snip" /v "Icon" /t REG_SZ /d "%%SystemRoot%%\System32\Shell32.dll,259" /f
Reg.exe add "HKLM\SOFTWARE\Classes\DesktopBackground\Shell\Screen Snip" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKLM\SOFTWARE\Classes\DesktopBackground\Shell\Screen Snip\Command" /ve /t REG_SZ /d "explorer.exe ms-screenclip:" /f
Reg.exe delete "HKCR\Directory\Shell\AnyCode" /f
Reg.exe delete "HKCR\Directory\Shell\find" /f
Reg.exe delete "HKCR\Directory\Shell\OpenElevatedPS" /f
Reg.exe delete "HKCR\Directory\Shell\PowerShell" /f
Reg.exe delete "HKCR\Directory\Shell\RunAs" /f
Reg.exe delete "HKCR\Directory\Shell\Screen Snip" /f
Reg.exe delete "HKCR\Directory\Shell\TakeOwnership" /f
Reg.exe delete "HKCR\Directory\Shell\NSudo" /f
Reg.exe delete "HKCR\Directory\Shell\UpdateEncryptionSettings" /f
Reg.exe delete "HKCR\Directory\Shell\UpdateEncryptionSettingsWork" /f
Reg.exe delete "HKCR\Directory\ShellEx\ContextMenuHandlers\EncryptionMenu" /f
Reg.exe delete "HKCR\Directory\Shellex\ContextMenuHandlers\Sharing" /f
Reg.exe delete "HKCR\Directory\Shellex\ContextMenuHandlers\WorkFolders" /f
Reg.exe delete "HKCR\Directory\Shellex\ContextMenuHandlers\EPP" /f
Reg.exe delete "HKCR\Directory\Shellex\ContextMenuHandlers\EncryptionMenu" /f
Reg.exe delete "HKCR\Directory\Shellex\ContextMenuHandlers\Open With EncryptionMenu" /f
Reg.exe delete "HKCR\Directory\ShellEx\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
Reg.exe delete "HKCR\Directory\ShellEx\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
Reg.exe delete "HKCR\Directory\Shellex\DragDropHandlers\ImageResizer" /f
Reg.exe delete "HKCR\Directory\Background\Shell\AnyCode" /f
Reg.exe delete "HKCR\Directory\Background\Shell\Screen Snip" /f
Reg.exe delete "HKCR\Directory\Background\Shell\WSL" /f
Reg.exe delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\Sharing" /f
Reg.exe delete "HKCR\Directory\Background\Shellex\ContextMenuHandlers\PowerRenameExt" /f
Reg.exe delete "HKLM\SOFTWARE\Classes\Directory\ShellEx\ContextMenuHandlers\FileSyncEx" /f
Reg.exe delete "HKLM\SOFTWARE\Classes\Directory\ShellEx\ContextMenuHandlers\7-Zip" /f
Reg.exe delete "HKLM\SOFTWARE\Classes\Directory\ShellEx\DragDropHandlers\7-Zip" /f
Reg.exe add "HKCR\Directory" /ve /t REG_SZ /d "File Folder" /f
Reg.exe add "HKCR\Directory" /v "AlwaysShowExt" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory" /v "EditFlags" /t REG_BINARY /d "d2010000" /f
Reg.exe add "HKCR\Directory" /v "FriendlyTypeName" /t REG_SZ /d "@%%SystemRoot%%\system32\windows.storage.dll,-10152" /f
Reg.exe add "HKCR\Directory" /v "FullDetails" /t REG_SZ /d "prop:System.PropGroup.Description;System.DateCreated;System.FileCount;System.TotalFileSize" /f
Reg.exe add "HKCR\Directory" /v "InfoTip" /t REG_SZ /d "prop:System.Comment;System.DateCreated" /f
Reg.exe add "HKCR\Directory" /v "NoRecentDocs" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory" /v "PreviewDetails" /t REG_SZ /d "prop:System.DateModified;*System.SharedWith;*System.StorageProviderState;*System.OfflineAvailability;*System.OfflineStatus" /f
Reg.exe add "HKCR\Directory" /v "PreviewTitle" /t REG_SZ /d "prop:System.ItemNameDisplay;System.ItemTypeText" /f
Reg.exe add "HKCR\Directory\DefaultIcon" /ve /t REG_SZ /d "%%SystemRoot%%\System32\Shell32.dll,3" /f
Reg.exe add "HKCR\Directory\Shell" /ve /t REG_SZ /d "none" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe,0" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Shell\runas" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Shell\runas" /ve /t REG_SZ /d "Command Prompt (Admin)" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Shell\runas\Command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo" /f
Reg.exe add "HKCR\Directory\Shell\TakeOwnership" /ve /t REG_SZ /d "Take Ownership" /f
Reg.exe add "HKCR\Directory\Shell\TakeOwnership" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\Shell\TakeOwnership" /v "Icon" /t REG_SZ /d "imageres.dll,-78" /f
Reg.exe add "HKCR\Directory\Shell\TakeOwnership" /v "NeverDefault" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\Shell\TakeOwnership" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\Shell\TakeOwnership" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\Directory\Shell\TakeOwnership\Command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo /c takeown /f \'%%1\' && icacls \'%%1\' /grant administrators:F" /f
Reg.exe add "HKCR\Directory\Shell\TakeOwnership\Command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo /c takeown /f \'%%1\' && icacls \'%%1\' /grant administrators:F" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Shell\PowerShellAsAdmin" /ve /t REG_SZ /d "Windows PowerShell (Run as Administrator)" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Shell\PowerShellAsAdmin" /v "Icon" /t REG_SZ /d "PowerShell.exe" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Shell\PowerShellAsAdmin" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Shell\PowerShellAsAdmin" /v "NeverDefault" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Shell\PowerShellAsAdmin" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\Directory\Shell\Snipping Tool" /v "Extended" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\Shell\Snipping Tool" /v "Icon" /t REG_SZ /d "snippingtool.exe,0" /f
Reg.exe add "HKCR\Directory\Shell\Snipping Tool" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\Directory\Shell\Snipping Tool\Command" /ve /t REG_SZ /d "snippingtool.exe" /f
Reg.exe add "HKCR\Directory\Shell\WForceDelete" /ve /t REG_SZ /d "Force delete" /f
Reg.exe add "HKCR\Directory\Shell\WForceDelete" /v "ICON" /t REG_SZ /d "D:\Program Files (x86)\Wise Force Deleter\forcedeleter.ico" /f
Reg.exe add "HKCR\Directory\Shell\WForceDelete\Command" /ve /t REG_SZ /d "D:\Program Files (x86)\Wise Force Deleter\WiseDeleter.exe -force \'%%1\'" /f
Reg.exe add "HKCR\Directory\Shellex\ContextMenuHandlers\New" /ve /t REG_SZ /d "{D969A300-E7FF-11d0-A93B-00A0C90F2719}" /f
Reg.exe add "HKCR\Directory\Shellex\ContextMenuHandlers\Offline Files" /ve /t REG_SZ /d "{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f
Reg.exe add "HKCR\Directory\Shellex\CopyHookHandlers\FileSystem" /ve /t REG_SZ /d "{217FC9C0-3AEA-1069-A2DB-08002B30309D}" /f
Reg.exe add "HKCR\Directory\Shellex\CopyHookHandlers\Sharing" /ve /t REG_SZ /d "{40dd6e20-7c17-11ce-a804-00aa003ca9f6}" /f
Reg.exe add "HKCR\Directory\Shellex\PropertySheetHandlers\Offline Files" /ve /t REG_SZ /d "{7EFA68C6-086B-43e1-A2D2-55A113531240}" /f
Reg.exe add "HKCR\Directory\Shellex\PropertySheetHandlers\Sharing" /ve /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
Reg.exe add "HKCR\Directory\Shellex\PropertySheetHandlers\{1f2e5c40-9550-11ce-99d2-00aa006e086c}" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\Shellex\PropertySheetHandlers\{4a7ded0a-ad25-11d0-98a8-0800361b1103}" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\Shellex\PropertySheetHandlers\{ef43ecfe-2ab9-4632-bf21-58909dd177f0}" /ve /t REG_SZ /d "" /f
Reg.exe delete "HKCR\Directory\Background\Shell\cmd" /f
Reg.exe delete "HKCR\Directory\Background\Shell\PowerShell" /f
Reg.exe delete "HKCR\Directory\Background\Shell\Intel Arc Control" /f
Reg.exe delete "HKCR\SOFTWARE\Classes\Directory\Background\Shell\grepWin" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Background\ShellEx\ContextMenuHandlers\ AutorunsDisabled\FileSyncEx" /f
Reg.exe add "HKCR\Directory\Background\Shell\Snipping Tool" /v "Extended" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\Background\Shell\Snipping Tool" /v "Icon" /t REG_SZ /d "snippingtool.exe,0" /f
Reg.exe add "HKCR\Directory\Background\Shell\Snipping Tool" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Background\Shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe,0" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Background\Shell\runas" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Background\Shell\runas" /ve /t REG_SZ /d "Command Prompt (Admin)" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Background\Shell\runas\Command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo" /f
Reg.exe add "HKCR\Directory\Background\Shell\TakeOwnership" /ve /t REG_SZ /d "Take Ownership" /f
Reg.exe add "HKCR\Directory\Background\Shell\TakeOwnership" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\Background\Shell\TakeOwnership" /v "Icon" /t REG_SZ /d "imageres.dll,-78" /f
Reg.exe add "HKCR\Directory\Background\Shell\TakeOwnership" /v "NeverDefault" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\Background\Shell\TakeOwnership" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\Background\Shell\TakeOwnership" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\Directory\Background\Shell\TakeOwnership\Command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo /c takeown /f \'%%1\' && icacls \'%%1\' /grant administrators:F" /f
Reg.exe add "HKCR\Directory\Background\Shell\TakeOwnership\Command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo /c takeown /f \'%%1\' && icacls \'%%1\' /grant administrators:F" /f
Reg.exe add "HKCR\Directory\Background\Shell\WForceDelete" /ve /t REG_SZ /d "Force delete" /f
Reg.exe add "HKCR\Directory\Background\Shell\WForceDelete" /v "ICON" /t REG_SZ /d "D:\Program Files (x86)\Wise Force Deleter\forcedeleter.ico" /f
Reg.exe add "HKCR\Directory\Background\Shell\WForceDelete" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\Directory\Background\Shell\WForceDelete\Command" /ve /t REG_SZ /d "D:\Program Files (x86)\Wise Force Deleter\WiseDeleter.exe -force \'%%1\'" /f
Reg.exe add "HKCR\Directory\Background\Shell\NetCon" /v "MUIVerb" /t REG_SZ /d "Network Connections" /f
Reg.exe add "HKCR\Directory\Background\Shell\NetCon" /v "Icon" /t REG_SZ /d "%%SystemRoot%%\System32\ncpa.cpl" /f
Reg.exe add "HKCR\Directory\Background\Shell\NetCon" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\Directory\Background\Shell\NetCon\Command" /ve /t REG_SZ /d "Control.exe ncpa.cpl" /f
Reg.exe add "HKCR\Directory\Background\Shell\DevMan" /v "MUIVerb" /t REG_SZ /d "Device Manager" /f
Reg.exe add "HKCR\Directory\Background\Shell\DevMan" /v "Icon" /t REG_SZ /d "c:\windows\System32\devmgr.dll,4" /f
Reg.exe add "HKCR\Directory\Background\Shell\DevMan" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\Directory\Background\Shell\DevMan\Command" /ve /t REG_SZ /d "MMC.exe devmgmt.msc" /f
Reg.exe delete "HKCR\Directory\Background\Shellex\ContextMenuHandlers\WorkFolders" /f
Reg.exe delete "HKCR\Directory\Background\Shell\Intel Arc Control" /f
Reg.exe delete "HKLM\SOFTWARE\Classes\Directory\Background\ShellEx\ContextMenuHandlers\ FileSyncEx" /f
Reg.exe add "HKCR\Directory\Background\Shellex\ContextMenuHandlers\New" /ve /t REG_SZ /d "{D969A300-E7FF-11d0-A93B-00A0C90F2719}" /f
Reg.exe add "HKCR\Directory\Background\Shellex\ContextMenuHandlers\Offline Files" /ve /t REG_SZ /d "{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f
Reg.exe add "HKCR\Directory\Background\Shellex\PropertySheetHandlers\Offline Files" /ve /t REG_SZ /d "{7EFA68C6-086B-43e1-A2D2-55A113531240}" /f
Reg.exe add "HKCR\Directory\Background\Shellex\PropertySheetHandlers\Sharing" /ve /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
Reg.exe add "HKCR\Directory\Background\Shellex\PropertySheetHandlers\Sharing" /ve /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
Reg.exe add "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\Offline Files" /ve /t REG_SZ /d "{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f
Reg.exe add "HKCR\Directory\Background\ShellEx\PropertySheetHandlers\Offline Files" /ve /t REG_SZ /d "{7EFA68C6-086B-43e1-A2D2-55A113531240}" /f
Reg.exe delete "HKCR\Drive\Shell\find" /f
Reg.exe delete "HKCR\Drive\Shell\NSudo" /f
Reg.exe delete "HKCR\Drive\Shell\pintohome" /f
Reg.exe delete "HKCR\Drive\Shell\change-passphrase" /f
Reg.exe delete "HKCR\Drive\Shell\change-pin" /f
Reg.exe delete "HKCR\Drive\Shell\pintohome" /f
Reg.exe delete "HKCR\Drive\Shell\Screen Snip" /f
Reg.exe delete "HKCR\Drive\Shell\OpenElevatedPS" /f
Reg.exe delete "HKCR\Drive\Shell\PowerShell" /f
Reg.exe delete "HKCR\Drive\Shell\encrypt-bde" /f
Reg.exe delete "HKCR\Drive\Shell\encrypt-bde-elev" /f
Reg.exe delete "HKCR\Drive\Shell\manage-bde" /f
Reg.exe delete "HKCR\Drive\Shell\resume-bde-elev" /f
Reg.exe delete "HKCR\Drive\Shell\resume-bde" /f
Reg.exe delete "HKCR\Drive\Shell\unlock-bde" /f
Reg.exe delete "HKCR\Drive\Shell\WSL" /f
Reg.exe delete "HKCR\Drive\Shell\encrypt-bde-elev" /f
Reg.exe delete "HKCR\Drive\Shellex\ContextMenuHandlers\EPP" /f
Reg.exe delete "HKLM\Software\Classes\Drive\Shellex\ContextMenuHandlers\EPP" /f
Reg.exe delete "HKCR\Drive\Shellex\ContextMenuHandlers\Sharing" /f
Reg.exe delete "HKCR\Drive\Shellex\ContextMenuHandlers\EnhancedStorageShell" /f
Reg.exe delete "HKCR\Drive\Shellex\ContextMenuHandlers\FileLocksmithExt" /f
Reg.exe delete "HKLM\Software\Classes\Drive\Shellex\ContextMenuHandlers\FileLocksmithExt" /f
Reg.exe delete "HKCR\Drive\Shellex\ContextMenuHandlers\{fbeb8a05-beee-4442-804e-409d6c4515e9}" /f
Reg.exe delete "HKCR\Drive\ShellEx\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
Reg.exe delete "HKCR\Drive\ShellEx\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\-Shell\encrypt-bde-elev" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive" /ve /t REG_SZ /d "Drive" /f
Reg.exe add "HKCR\Drive" /v "ContentViewModeForBrowse" /t REG_SZ /d "prop:~System.ItemNameDisplay;~System.PercentFull;~System.LayoutPattern.PlaceHolder;~System.LayoutPattern.PlaceHolder;~System.Volume.FileSystem;~System.Computer.DecoratedFreeSpace" /f
Reg.exe add "HKCR\Drive" /v "ContentViewModeLayoutPatternForBrowse" /t REG_SZ /d "delta" /f
Reg.exe add "HKCR\Drive" /v "EditFlags" /t REG_BINARY /d "d2010000" /f
Reg.exe add "HKCR\Drive" /v "InfoTip" /t REG_SZ /d "prop:System.FreeSpace;System.Capacity" /f
Reg.exe add "HKCR\Drive" /v "PreviewDetails" /t REG_SZ /d "prop:*System.PercentFull;System.FreeSpace;System.Capacity;System.Volume.FileSystem;*System.Volume.BitLockerProtection" /f
Reg.exe add "HKCR\Drive" /v "PreviewTitle" /t REG_SZ /d "prop:System.ItemNameDisplay;System.ItemTypeText" /f
Reg.exe add "HKCR\Drive" /v "TileInfo" /t REG_SZ /d "prop:*System.PercentFull;System.Computer.DecoratedFreeSpace;System.Volume.FileSystem" /f
Reg.exe add "HKCR\Drive\Shell" /ve /t REG_SZ /d "none" /f
Reg.exe add "HKCR\Drive\DefaultIcon" /ve /t REG_SZ /d "%%SystemRoot%%\System32\Shell32.dll,8" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe,0" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\runas" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\runas" /ve /t REG_SZ /d "Command Prompt (Admin)" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\runas\Command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\PowerShellAsAdmin" /ve /t REG_SZ /d "Windows PowerShell (Run as Administrator)" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\PowerShellAsAdmin" /v "Icon" /t REG_SZ /d "PowerShell.exe" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\PowerShellAsAdmin" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\PowerShellAsAdmin" /v "NeverDefault" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\PowerShellAsAdmin" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\Drive\Shell\Snipping Tool" /v "Extended" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\Shell\Snipping Tool" /v "Icon" /t REG_SZ /d "snippingtool.exe,0" /f
Reg.exe add "HKCR\Drive\Shell\Snipping Tool" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\Drive\Shell\Snipping Tool\Command" /ve /t REG_SZ /d "snippingtool.exe" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\RunAs" /ve /t REG_SZ /d "Take Ownership" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\RunAs" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\RunAs" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\RunAs" /v "Position" /t REG_SZ /d "Top" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\RunAs\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \'%%1\' && icacls \'%%1\' /grant administrators:F" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\RunAs\command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo /c takeown /f \'%%1\' && icacls \'%%1\' /grant administrators:F" /f
Reg.exe add "HKCR\Drive\Shell\WForceDelete" /ve /t REG_SZ /d "Force delete" /f
Reg.exe add "HKCR\Drive\Shell\WForceDelete" /v "ICON" /t REG_SZ /d "D:\Program Files (x86)\Wise Force Deleter\forcedeleter.ico" /f
Reg.exe add "HKCR\Drive\Shell\WForceDelete" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\Drive\Shell\WForceDelete\Command" /ve /t REG_SZ /d "D:\Program Files (x86)\Wise Force Deleter\WiseDeleter.exe -force \'%%1\'" /f
Reg.exe add "HKCR\Drive\Shellex\ContextMenuHandlers\Offline Files" /ve /t REG_SZ /d "{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f
Reg.exe add "HKCR\Drive\Shellex\ContextMenuHandlers\ReflectShellExt" /ve /t REG_SZ /d "{DEBB9B79-B3DD-47F4-9E5C-EA6975BAB611}" /f
Reg.exe delete "HKCR\Drive\Shellex\ContextMenuHandlers\{D6791A63-E7E2-4fee-BF52-5DED8E86E9B8}" /f
Reg.exe delete "HKCR\Drive\ShellEx\ContextMenuHandlers\EnhancedStorageShell" /f
Reg.exe delete "HKCR\Drive\ShellEx\ContextMenuHandlers\{fbeb8a05-beee-4442-804e-409d6c4515e9}" /f
Reg.exe delete "HKCR\Drive\Shellex\FolderExtensions\{fbeb8a05-beee-4442-804e-409d6c4515e9}" /f
Reg.exe delete "HKCR\Drive\Shellex\PropertySheetHandlers\{fbeb8a05-beee-4442-804e-409d6c4515e9}" /f
Reg.exe add "HKCR\Drive\Shellex\FolderExtensions\{117E3954-5034-453A-A18B-7B79493646E6}" /ve /t REG_SZ /d "StartAllBack" /f
Reg.exe add "HKCR\Drive\Shellex\FolderExtensions\{117E3954-5034-453A-A18B-7B79493646E6}" /v "DriveMask" /t REG_DWORD /d "255" /f
Reg.exe add "HKCR\Drive\Shellex\PropertySheetHandlers" /ve /t REG_SZ /d "{5F5295E0-429F-1069-A2E2-08002B30309D}" /f
Reg.exe add "HKCR\Drive\Shellex\PropertySheetHandlers\Offline Files" /ve /t REG_SZ /d "{7EFA68C6-086B-43e1-A2D2-55A113531240}" /f
Reg.exe add "HKCR\Drive\Shellex\PropertySheetHandlers\Sharing" /ve /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
Reg.exe add "HKCR\Drive\Shellex\PropertySheetHandlers\{1F2E5C40-9550-11CE99D2-00AA006E086C}" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\Shellex\PropertySheetHandlers\{4a7ded0a-ad25-11d0-98a8-0800361b1103}" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\Shellex\PropertySheetHandlers\{7988B573-EC89-11cf-9C00-00AA00A14F56}" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\Shellex\PropertySheetHandlers\{ef43ecfe-2ab9-4632-bf21-58909dd177f0}" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\Shellex\PropertySheetHandlers\{1f2e5c40-9550-11ce-99d2-00aa006e086c}" /f
Reg.exe add "HKCR\Drive\tabsets" /v "location" /t REG_DWORD /d "1795" /f
Reg.exe add "HKCR\Drive\tabsets" /v "selection" /t REG_DWORD /d "1795" /f
Reg.exe add "HKCR\Drive\Background\Shellex\ContextMenuHandlers\New" /ve /t REG_SZ /d "{D969A300-E7FF-11d0-A93B-00A0C90F2719}" /f
Reg.exe delete "HKCR\Folder\Shell\Screen Snip" /f
Reg.exe delete "HKCR\Folder\Shell\OpenElevatedPS" /f
Reg.exe delete "HKCR\Folder\Shell\PowerShell" /f
Reg.exe delete "HKLM\Software\Classes\folder\Shell\pintohome" /f
Reg.exe delete "HKCR\folder\Shell\pintohome" /f
Reg.exe delete "HKCR\folder\Shell\NSudo" /f
Reg.exe delete "HKCR\Folder\Shellex\ContextMenuHandlers\Sharing" /f
Reg.exe delete "HKCR\Folder\ShellEx\ContextMenuHandlers\PintoStartScreen" /f
Reg.exe delete "HKCR\Folder\ShellEx\ContextMenuHandlers\7-Zip" /f
Reg.exe delete "HKLM\Software\Classes\Folder\ShellEx\ContextMenuHandlers\7-Zip" /f
Reg.exe add "HKCR\folder" /ve /t REG_SZ /d "Folder" /f
Reg.exe add "HKCR\folder" /v "EditFlags" /t REG_BINARY /d "d2030000" /f
Reg.exe add "HKCR\folder" /v "FullDetails" /t REG_SZ /d "prop:System.PropGroup.Description;System.ItemNameDisplay;System.ItemTypeText;System.Size" /f
Reg.exe add "HKCR\folder" /v "NoRecentDocs" /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder" /v "ThumbnailCutoff" /t REG_DWORD /d "0" /f
Reg.exe add "HKCR\folder" /v "TileInfo" /t REG_SZ /d "prop:System.Title" /f
Reg.exe add "HKCR\folder" /v "AppUserModelID" /t REG_SZ /d "Microsoft.Windows.Explorer" /f
Reg.exe add "HKCR\folder" /v "ContentViewModeForBrowse" /t REG_SZ /d "prop:~System.ItemNameDisplay;~System.LayoutPattern.PlaceHolder;~System.LayoutPattern.PlaceHolder;~System.LayoutPattern.PlaceHolder;System.DateModified" /f
Reg.exe add "HKCR\folder" /v "ContentViewModeForSearch" /t REG_SZ /d "prop:~System.ItemNameDisplay;System.DateModified;~System.ItemFolderPathDisplay" /f
Reg.exe add "HKCR\folder" /v "ContentViewModeLayoutPatternForBrowse" /t REG_SZ /d "delta" /f
Reg.exe add "HKCR\folder" /v "ContentViewModeLayoutPatternForSearch" /t REG_SZ /d "alpha" /f
Reg.exe add "HKCR\folder\DefaultIcon" /ve /t REG_SZ /d "%%SystemRoot%%\System32\Shell32.dll,3" /f
Reg.exe add "HKCR\Folder\Shell\ANotepad++64" /ve /t REG_SZ /d "Notepad++ Context menu" /f
Reg.exe add "HKCR\Folder\Shell\ANotepad++64" /v "ExplorerCommandHandler" /t REG_SZ /d "{B298D29A-A6ED-11DE-BA8C-A68E55D89593}" /f
Reg.exe add "HKCR\Folder\Shell\ANotepad++64" /v "NeverDefault" /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\Shell\explore" /v "LaunchExplorerFlags" /t REG_DWORD /d "24" /f
Reg.exe add "HKCR\folder\Shell\explore" /v "MultiSelectModel" /t REG_SZ /d "Document" /f
Reg.exe add "HKCR\folder\Shell\explore" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\Shell\explore\command" /v "DelegateExecute" /t REG_SZ /d "{11dbb47c-a525-400b-9e80-a54615a090c0}" /f
Reg.exe add "HKCR\folder\Shell\open" /v "MultiSelectModel" /t REG_SZ /d "Document" /f
Reg.exe add "HKCR\folder\Shell\open\command" /ve /t REG_SZ /d "%%SystemRoot%%\Explorer.exe" /f
Reg.exe add "HKCR\folder\Shell\open\command" /v "DelegateExecute" /t REG_SZ /d "{11dbb47c-a525-400b-9e80-a54615a090c0}" /f
Reg.exe add "HKLM\SOFTWARE\Classes\folder\Shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe,0" /f
Reg.exe add "HKLM\SOFTWARE\Classes\folder\Shell\runas" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKLM\SOFTWARE\Classes\folder\Shell\runas" /ve /t REG_SZ /d "Command Prompt (Admin)" /f
Reg.exe add "HKLM\SOFTWARE\Classes\folder\Shell\runas\Command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo" /f
Reg.exe add "HKCR\folder\Shell\opennewprocess" /v "ExplorerHost" /t REG_SZ /d "{ceff45ee-c862-41de-aee2-a022c81eda92}" /f
Reg.exe add "HKCR\folder\Shell\opennewprocess" /v "Extended" /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\Shell\opennewprocess" /v "LaunchExplorerFlags" /t REG_DWORD /d "3" /f
Reg.exe add "HKCR\folder\Shell\opennewprocess" /v "MUIVerb" /t REG_SZ /d "@Shell32.dll,-8518" /f
Reg.exe add "HKCR\folder\Shell\opennewprocess" /v "MultiSelectModel" /t REG_SZ /d "Document" /f
Reg.exe add "HKCR\folder\Shell\opennewprocess" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\folder\Shell\opennewprocess\command" /v "DelegateExecute" /t REG_SZ /d "{11dbb47c-a525-400b-9e80-a54615a090c0}" /f
Reg.exe add "HKCR\folder\Shell\opennewtab" /v "CommandStateHandler" /t REG_SZ /d "{11dbb47c-a525-400b-9e80-a54615a090c0}" /f
Reg.exe add "HKCR\folder\Shell\opennewtab" /v "CommandStateSync" /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\Shell\opennewtab" /v "LaunchExplorerFlags" /t REG_DWORD /d "32" /f
Reg.exe add "HKCR\folder\Shell\opennewtab" /v "MUIVerb" /t REG_SZ /d "@windows.storage.dll,-8519" /f
Reg.exe add "HKCR\folder\Shell\opennewtab" /v "MultiSelectModel" /t REG_SZ /d "Document" /f
Reg.exe add "HKCR\folder\Shell\opennewtab" /v "OnlyInBrowserWindow" /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\Shell\opennewtab" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\folder\Shell\opennewtab\command" /v "DelegateExecute" /t REG_SZ /d "{11dbb47c-a525-400b-9e80-a54615a090c0}" /f
Reg.exe add "HKCR\folder\Shell\opennewwindow" /v "LaunchExplorerFlags" /t REG_DWORD /d "1" /f
Reg.exe add "HKCR\folder\Shell\opennewwindow" /v "MUIVerb" /t REG_SZ /d "@windows.storage.dll,-8517" /f
Reg.exe add "HKCR\folder\Shell\opennewwindow" /v "MultiSelectModel" /t REG_SZ /d "Document" /f
Reg.exe add "HKCR\folder\Shell\opennewwindow" /v "OnlyInBrowserWindow" /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\Shell\opennewwindow" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\folder\Shell\opennewwindow\command" /v "DelegateExecute" /t REG_SZ /d "{11dbb47c-a525-400b-9e80-a54615a090c0}" /f
Reg.exe add "HKCR\folder\Shell\Snipping Tool" /v "Extended" /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\Shell\Snipping Tool" /v "Icon" /t REG_SZ /d "snippingtool.exe,0" /f
Reg.exe add "HKCR\folder\Shell\Snipping Tool" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\folder\Shell\Snipping Tool\Command" /ve /t REG_SZ /d "snippingtool.exe" /f
Reg.exe add "HKCR\folder\Shell\TakeOwnership" /ve /t REG_SZ /d "Take Ownership" /f
Reg.exe add "HKCR\folder\Shell\TakeOwnership" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\Shell\TakeOwnership" /v "Icon" /t REG_SZ /d "imageres.dll,-78" /f
Reg.exe add "HKCR\folder\Shell\TakeOwnership" /v "NeverDefault" /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\Shell\TakeOwnership" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\Shell\TakeOwnership" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\folder\Shell\TakeOwnership\Command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo /c takeown /f \'%%1\' && icacls \'%%1\' /grant administrators:F" /f
Reg.exe add "HKCR\folder\Shell\TakeOwnership\Command" /ve /t REG_SZ /d "D:\Portapps\NSudo\9.1\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo /c takeown /f \'%%1\' && icacls \'%%1\' /grant administrators:F" /f
Reg.exe add "HKCR\folder\Shell\WForceDelete" /ve /t REG_SZ /d "Force delete" /f
Reg.exe add "HKCR\folder\Shell\WForceDelete" /v "ICON" /t REG_SZ /d "D:\Program Files (x86)\Wise Force Deleter\forcedeleter.ico" /f
Reg.exe add "HKCR\folder\Shell\WForceDelete" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\Drive\Shell\WForceDelete\Command" /ve /t REG_SZ /d "D:\Program Files (x86)\Wise Force Deleter\WiseDeleter.exe -force \'%%1\'" /f
Reg.exe add "HKCR\folder\ShellNew" /v "Directory" /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\ShellNew" /v "IconPath" /t REG_SZ /d "%%SystemRoot%%\system32\Shell32.dll,3" /f
Reg.exe add "HKCR\folder\ShellNew" /v "ItemName" /t REG_SZ /d "@Shell32.dll,-30396" /f
Reg.exe add "HKCR\folder\ShellNew" /v "MenuText" /t REG_SZ /d "@Shell32.dll,-30317" /f
Reg.exe add "HKCR\folder\ShellNew" /v "NonLFNFileSpec" /t REG_SZ /d "@Shell32.dll,-30319" /f
Reg.exe add "HKCR\folder\ShellNew\Config" /v "AllDrives" /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\ShellNew\Config" /v "IsFolder" /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\ShellNew\Config" /v "NoExtension" /t REG_SZ /d "" /f
Reg.exe delete "HKCR\folder\ShellEx\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}" /f
Reg.exe delete "HKCR\folder\ShellEx\ContextMenuHandlers\Library Location" /f
Reg.exe delete "HKCR\folder\ShellEx\ContextMenuHandlers\PintoStartScreen" /f
Reg.exe add "HKCR\folder\ShellEx\ContextMenuHandlers\Offline Files" /ve /t REG_SZ /d "{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f
Reg.exe add "HKCR\folder\ShellEx\ContextMenuHandlers\RUShellExt" /ve /t REG_SZ /d "{2C5515DC-2A7E-4BFD-B813-CACC2B685EB7}" /f
Reg.exe add "HKCR\folder\ShellEx\ContextMenuHandlers\UnlockerShellExtension" /ve /t REG_SZ /d "{DDE4BEEB-DDE6-48fd-8EB5-035C09923F83}" /f
Reg.exe add "HKCR\folder\ShellEx\DragDropHandlers\{BD472F60-27FA-11cf-B8B4-444553540000}" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\ShellEx\DragDropHandlers\{D12E3394-DE4B-4777-93E9-DF0AC88F8584}" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\ShellEx\PropertySheetHandlers\FCI Properties" /ve /t REG_SZ /d "{748F920F-FB24-4D09-B360-BAF6F199AD6D}" /f
Reg.exe add "HKCR\folder\ShellEx\PropertySheetHandlers\Offline Files" /ve /t REG_SZ /d "{7EFA68C6-086B-43e1-A2D2-55A113531240}" /f
Reg.exe add "HKCR\folder\ShellEx\PropertySheetHandlers\Sharing" /ve /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
Reg.exe add "HKCR\folder\ShellEx\PropertySheetHandlers\{1f2e5c40-9550-11ce-99d2-00aa006e086c}" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCR\folder\ShellEx\PropertySheetHandlers\{4a7ded0a-ad25-11d0-98a8-0800361b1103}" /ve /t REG_SZ /d "" /f
Reg.exe delete "HKCR\SOFTWARE\Classes\LibraryFolder\Background\Shell\grepWin" /f
Reg.exe delete "HKCR\LibraryFolder\Background\Shellex\ContextMenuHandlers\Sharing" /f
Reg.exe delete "HKCR\.library-ms\ShellNew" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell\Update\Packages" /v "UndockingDisabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCR\dllfile\Shell\runas" /ve /t REG_SZ /d "Take Ownership" /f
Reg.exe add "HKCR\dllfile\Shell\runas" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\dllfile\Shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKCR\dllfile\Shell\runas" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\dllfile\Shell\runas\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \'%%1\' && icacls \'%%1\' /grant *S-1-3-4:F /c /l" /f
Reg.exe add "HKCR\dllfile\Shell\runas\command" /v "IsolatedCommand" /t REG_SZ /d "cmd.exe /c takeown /f \'%%1\' && icacls \'%%1\' /grant *S-1-3-4:F /c /l" /f
Reg.exe add "HKCR\exefile\Shell\runas" /ve /t REG_SZ /d "Take Ownership" /f
Reg.exe add "HKCR\exefile\Shell\runas" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\exefile\Shell\runas" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\exefile\Shell\runas\command" /ve /t REG_SZ /d "%%1%%*" /f
Reg.exe add "HKCR\exefile\Shell\runas\command" /v "IsolatedCommand" /t REG_SZ /d "%%1%%*" /f
Reg.exe add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellCreateVideo" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\AppXk0g4vb8gvt7b93tg50ybcy892pge6jmt\Shell\ShellCreateVideo" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Shell\encrypt-bde" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved" /v "{DDE4BEEB-DDE6-48fd-8EB5-035C09923F83}" /t REG_SZ /d "UnlockerShellExtension" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved" /v "{DEBB9B79-B3DD-47F4-9E5C-EA6975BAB611}" /t REG_SZ /d "ReflectShellExt extension" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved" /v "{169A0691-8DF9-11D1-A1C4-00C04FD75D13}" /t REG_SZ /d "{169A0691-8DF9-11D1-A1C4-00C04FD75D13}" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{02DB545A-3E20-46DE-83A5-1329B1E88B6B}" /t REG_SZ /d "Open in Windows Terminal" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{04731B67-D933-450A-90E6-4ACD2E9408FE}" /t REG_SZ /d "SearchFolder" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{08165EA0-E946-11CF-9C87-00AA005127ED}" /t REG_SZ /d "Web crawler and webcheck" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{09A47860-11B0-4DA5-AFA5-26D86198A780}" /t REG_SZ /d "Scan with Windows Defender" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{0AF96EDE-AEBF-41ED-A1C8-CF7A685505B6}" /t REG_SZ /d "Library Folder Context Menu" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{0BF754AA-C967-445C-AB3D-D8FDA9BAE7EF}" /t REG_SZ /d "SlideshowContextMenu" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{0F8604A5-4ECE-4DE1-BA7D-CF10F8AA4F48}" /t REG_SZ /d "Contacts" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{13D3C4B8-B179-4EBB-BF62-F704173E7448}" /t REG_SZ /d "ContactReadingPane" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{14074E0B-7216-4862-96E6-53CADA442A56}" /t REG_SZ /d "Library Icon Extract Extension" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{16C2C29D-0E5F-45F3-A445-03E03F587B7D}" /t REG_SZ /d "Address Book" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{1D27F844-3A1F-4410-85AC-14651078412D}" /t REG_SZ /d "Troubleshoot compatibility" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{1E589E9D-8A8D-46D9-A2F9-E6D4F8161EE9}" /t REG_SZ /d "MF MPEG Property Handler" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{23170F69-40C1-278A-1000-000100020000}" /t REG_SZ /d "7zip" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{2854F705-3548-414C-A113-93E27C808C85}" /t REG_SZ /d "Enhanced Storage Context Menu Handler Class" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{289AF617-1CC3-42A6-926C-E6A863F0E3BA}" /t REG_SZ /d "DLNA Media Servers Data Source" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{3D1975AF-48C6-4f8e-A182-BE0E08FA86A9}" /t REG_SZ /d "NVIDIA Play On My TV Context Menu Extension" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{3F30C968-480A-4C6C-862D-EFC0897BB84B}" /t REG_SZ /d "Photo Extract Image" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{470C0EBD-5D73-4D58-9CED-E91E22E23282}" /t REG_SZ /d "Pin to Start" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{487BA7B8-4DB0-465F-B122-C74A445A095D}" /t REG_SZ /d "MF Media Source Pack Property Handler" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{4A7DED0A-AD25-11D0-98A8-0800361B1103}" /t REG_SZ /d "MyFolder menu and properties" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{4F58F63F-244B-4C07-B29F-210BE59BE9B4}" /t REG_SZ /d "Mail - .group Shell extension handler" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{53BEDF0B-4E5B-4183-8DC9-B844344FA104}" /t REG_SZ /d "MAPI Mail Previewer" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{58E3C745-D971-4081-9034-86E34B30836A}" /t REG_SZ /d "Speech Recognition" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{5FA29220-36A1-40F9-89C6-F4B384B7642E}" /t REG_SZ /d "Shell Message Handler" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{606B3777-3051-401F-974A-E66ACA82A3A3}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{66275315-BFA5-451B-88B6-E56EBC8D9B58}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{68B07BFF-CB50-4D60-A7D5-02B1A523BC8C}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{70E40788-9F0F-4041-BD49-5A332150A83C}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{7444C717-39BF-11D1-8CD9-00C04FC29D45}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{7988B573-EC89-11CF-9C00-00AA00A14F56}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{7AD84985-87B4-4A16-BE58-8B72A5B390F7}" /t REG_SZ /d "Cast to device" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{7D559C10-9FE9-11D0-93F7-00AA0059CE02}" /t REG_SZ /d "Code Download Agent" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{7FC0B86E-5FA7-11D1-BC7C-00C04FD929DB}" /t REG_SZ /d "WebCheck SyncMgr Handler" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{8082C5E6-4C27-48EC-A809-B8E1122E8F97}" /t REG_SZ /d "Contacts" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{888DCA60-FC0A-11CF-8F0F-00C04FD7D062}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{889900C3-59F3-4C2F-AE21-A409EA01E605}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{89D83576-6BD1-4C86-9454-BEB04E94C819}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{8A734961-C4AA-4741-AC1E-791ACEBF5B39}" /t REG_SZ /d "Windows Media Player" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{8E6E6079-0CB7-11D2-8F10-0000F87ABD16}" /t REG_SZ /d "Offline Pages Files" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{92DBAD9F-5025-49B0-9078-2D78F935E341}" /t REG_SZ /d "Microsoft Windows Mail Html Preview Handler" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{9343812E-1C37-4A49-A12E-4B2D810D956B}" /t REG_SZ /d "Windows Search" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{9421DD08-935F-4701-A9CA-22DF90AC4EA6}" /t REG_SZ /d "Epson Easy Photo Print 2: Blocked by{6AF39996-9C88-459B-9282-DA18B14E4402}" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{96B9DAE3-CF15-45E9-9719-57285348225E}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{9B0EFD60-F7B0-11D0-BAEF-00C04FC308C9}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{9C60DE1E-E5FC-40F4-A487-460851A8D915}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{9E56BE60-C50F-11CF-9A2C-00A0C90A90CE}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{9F156763-7844-4DC4-B2B1-901F640F5155}" /t REG_SZ /d "Open In Windows Terminal" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{A0953C92-50DC-43BF-BE83-3742FED03C9C}" /t REG_SZ /d "Videos" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{A2A9545D-A0C2-42B4-9708-A0B2BADD77C8}" /t REG_SZ /d "Pin to start" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{A70C977A-BF00-412C-90B7-034C51DA2439}" /t REG_SZ /d "NvCpl DesktopContext Class" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{A929C4CE-FD36-4270-B4F5-34ECAC5BD63C}" /t REG_SZ /d "NvAppShExt extension" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{A9B48EAC-3ED8-11D2-8216-00C04FB687DA}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{ABBE31D0-6DAE-11D0-BECA-00C04FD940BE}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{AEB16279-B750-48F1-8586-97956060175A}" /t REG_SZ /d "Subscriptions" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{B8CDCB65-B1BF-4B42-9428-1DFDB7EE92AF}" /t REG_SZ /d "Extract All" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{B9815375-5D7F-4CE2-9245-C9D4DA436930}" /t REG_SZ /d "Microsoft Windows Mail Html Preview Handler" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{BD472F60-27FA-11CF-B8B4-444553540000}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{BD7A2E7B-21CB-41B2-A086-B309680C6B7E}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{BFD468D2-D0A0-4BDC-878C-E69C2F5B435D}" /t REG_SZ /d "Microsoft Windows Mail Html Preview Handler" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{C10E23A2-BFF0-4113-BCE8-C91BE754E281}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{C120DE80-FDE4-49F5-A713-E902EF062B8A}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{C591F150-4106-4141-B5C1-30B2101453BD}" /t REG_SZ /d "MF MKV Property Handler" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{CF67796C-F57F-45F8-92FB-AD698826C602}" /t REG_SZ /d "Address Book" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{CFBFAE00-17A6-11D0-99CB-00C04FD64497}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{D12E3394-DE4B-4777-93E9-DF0AC88F8584}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{D6791A63-E7E2-4FEE-BF52-5DED8E86E9B8}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{D8B8412B-DEA3-4130-B36C-5E8BE73106AC}" /t REG_SZ /d "Microsoft Windows Mail Html Preview Handler" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{D9144DCD-E998-4ECA-AB6A-DCD83CCBA16D}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{E2BF9676-5F8F-435C-97EB-11607A5BEDF7}" /t REG_SZ /d "Modern Sharing" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{E2FB4720-F45F-4A3C-8CB2-2060E12425C3}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{E37A73F8-FB01-43DC-914E-AAEE76095AB9}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{E46787A1-4629-4423-A693-BE1F003B2742}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{E6FB5E20-DE35-11CF-9C87-00AA005127ED}" /t REG_SZ /d "Web crawler and webcheck" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{ECF03A32-103D-11D2-854D-006008059367}" /t REG_SZ /d "MyDocs" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{EDC3A8B5-2E25-466A-A1AD-21E2F19414AC}" /t REG_SZ /d "AC3 Property Handler" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{EDC978D6-4D53-4B2F-A265-5805674BE568}" /t REG_SZ /d "Stream Backed Folder" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{EE07CEF5-3441-4CFB-870A-4002C724783A}" /t REG_SZ /d "Compressed Archive Folder Context Menu" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{F5175861-2688-11D0-9C5E-00AA00A45957}" /t REG_SZ /d "Subscriptions" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{F81B1B56-7613-4EE4-BC05-1FAB5DE5C07E}" /t REG_SZ /d "MPEG-4 Property Handler" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{F81E9010-6EA4-11CE-A7FF-00AA003CA9F6}" /t REG_SZ /d "Share With/Give Access to" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{F8B8412B-DEA3-4130-B36C-5E8BE73106AC}" /t REG_SZ /d "Microsoft Windows Mail Html Preview Handler" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{F9A7AB61-C0BC-490E-A7FE-BFF26B327A3F}" /t REG_SZ /d "OpenSearch Result Context Menu" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{FBEB8A05-BEEE-4442-804E-409D6C4515E9}" /t REG_SZ /d "ShellFolder for CD Burning" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{FBF23B40-E3F0-101B-8488-00AA003E56F8}" /t REG_SZ /d "IEFrame Internet Shortcut" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{FF393560-C2A7-11CF-BFF4-444553540000}" /t REG_SZ /d "IEFrame History" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Cached" /v "{E37E2028-CE1A-4F42-AF05-6CEABC4E5D75} {000214FA-0000-0000-C000-000000000046} 0xFFFF" /t REG_BINARY /d "0100000000000000d14e74ec3e4ad901" /f
Reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Cached" /v "{04731B67-D933-450A-90E6-4ACD2E9408FE}" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Start" /v "ShowRecentList" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Start" /v "VisiblePlaces" /t REG_BINARY /d "448175FE0D08AE428BDA34ED97B66394" /f
Reg.exe add "HKLM\Software\Classes\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /v "SortOrderIndex" /t REG_DWORD /d "84" /f
Reg.exe add "HKLM\Software\Classes\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\CLSID\{088e3905-0323-4b02-9826-5d99428e115f}" /v "System.IsPinnedtoNameSpaceTree" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\WOW6432Node\CLSID\{088e3905-0323-4b02-9826-5d99428e115f}" /v "System.IsPinnedtoNameSpaceTree" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\CLSID\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /v "System.IsPinnedtoNameSpaceTree" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\WOW6432Node\CLSID\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /v "System.IsPinnedtoNameSpaceTree" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\DelegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\DelegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}" /f
Reg.exe add "HKLM\Software\Classes\CLSID\{323CA680-C24D-4099-B94D-446DD2D7249E}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2696937728" /f
Reg.exe add "HKCU\Software\Classes\CLSID\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /v "System.IsPinnedtoNameSpaceTree" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\WOW6432Node\CLSID\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /v "System.IsPinnedtoNameSpaceTree" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Classes\CLSID\{679f85cb-0220-4080-b29b-5540cc05aab6}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2689597440" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /v "HideIfEnabled" /t REG_DWORD /d "36354489" /f
Reg.exe add "HKCU\Software\Classes\CLSID\{d3162b92-9365-467a-956b-92703aca08af}" /v "System.IsPinnedtoNameSpaceTree" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\WOW6432Node\CLSID\{d3162b92-9365-467a-956b-92703aca08af}" /v "System.IsPinnedtoNameSpaceTree" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Classes\CLSID\{e23fd76f-5b20-40e5-a9b2-1be8f0416c26}" /ve /t REG_SZ /d "Hyper-V Manager" /f
Reg.exe add "HKLM\Software\Classes\CLSID\{e23fd76f-5b20-40e5-a9b2-1be8f0416c26}" /v "InfoTip" /t REG_SZ /d "Management of HYPER-V Virtualization platform" /f
Reg.exe add "HKLM\Software\Classes\CLSID\{e23fd76f-5b20-40e5-a9b2-1be8f0416c26}" /v "System.ControlPanel.Category" /t REG_SZ /d "8" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{e23fd76f-5b20-40e5-a9b2-1be8f0416c26}" /ve /t REG_SZ /d "Hyper-V Manager" /f
Reg.exe add "HKLM\Software\Classes\CLSID\{e23fd76f-5b20-40e5-a9b2-1be8f0416c26}\DefaultIcon" /ve /t REG_SZ /d "%%ProgramFiles%%\Hyper-V\SnapInAbout.dll,-110" /f
Reg.exe add "HKLM\Software\Classes\CLSID\{e23fd76f-5b20-40e5-a9b2-1be8f0416c26}\Shell\Open\Command" /ve /t REG_SZ /d "MMC.exe virtmgmt.msc" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace_41040327\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" /f
Reg.exe add "HKLM\SOFTWARE\Classes\CLSID\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\CLSID\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" /ve /t REG_SZ /d "CLSID_MSGraphHomeFolder" /f
Reg.exe add "HKCU\Software\Classes\CLSID\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\RemovedFolders" /v "{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\RemovedFolders" /v "{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\RemovedFolders" /v "{088e3905-0323-4b02-9826-5d99428e115f}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\RemovedFolders" /v "{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\RemovedFolders" /v "{d3162b92-9365-467a-956b-92703aca08af}" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\StartIsBack" /ve /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "AllProgramsFlyout" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "AlterStyle" /t REG_SZ /d "Plain8.msstyles" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "AutoUpdates" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "BottomDetails" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "CombineWinX" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "CustomColors" /t REG_SZ /d "16744576" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Disabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "FrameStyle" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "HideOrb" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "HideSecondaryOrb" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "HideUserFrame" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "IdealHeight.9" /t REG_DWORD /d "65544" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "IdealWidth.9" /t REG_SZ /d "Network Connections" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "ImmersiveMenus" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "LegacyTaskbar" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "MetroHotKey" /t REG_DWORD /d "10" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "MetroHotkeyFunction" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "ModernIconsColorized" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "ModernIconsUnplated" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "MultiColumnFlyout" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "NavBarGlass" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "NoXAMLMenus" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "NoXAMLPrelaunch" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "OldSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "OrbBitmap" /t REG_SZ /d "d:\Program Files\StartAllBack\Orbs\orb (86).png" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "RestyleControls" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "RestyleIcons" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "SettingsVersion" /t REG_DWORD /d "5" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_AdminToolsRoot" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_AskCortana" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_AutoCascade" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_JumpListItems" /t REG_DWORD /d "15" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_LargeAllAppsIcons" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_LargeMFUIcons" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_MinMFU" /t REG_DWORD /d "15" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_NotifyNewApps" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_RightPaneIcons" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowCommandPrompt" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowControlPanel" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowDownloads" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowMyComputer" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowMyDocs" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowMyMusic" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowMyPics" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowNetConn" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowNetPlaces" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowPCSettings" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowPrinters" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowRecentDocs" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowRun" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowSetProgramAccessAndDefaults" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowSkyDrive" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowTerminal" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowUser" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_ShowVideos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_SortFoldersFirst" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "Start_SortOverride" /t REG_DWORD /d "10" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "StartIsApps" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "StartMenuAlpha" /t REG_DWORD /d "255" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "StartMenuBlur" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "StartMenuColor" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "StartMenuFavorites" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "StartMenuMonitor" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "StartMetroAppsFolder" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "StartMetroAppsMFU" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "StartScreenShortcut" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "SysTrayStyle" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "TaskbarAlpha" /t REG_DWORD /d "255" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "TaskbarBlur" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "TaskbarCenterIcons" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "TaskbarColor" /t REG_DWORD /d "16744576" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "TaskbarJumpList" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "TaskbarLargerIcons" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "TaskbarOneSegment" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "TaskbarSpacierIcons" /t REG_DWORD /d "4294967294" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "TaskbarStyle" /t REG_SZ /d "Plain8.msstyles" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "TaskbarTranslucentEffect" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "TerminateOnClose" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "UpdateCheck" /t REG_BINARY /d "ef9e8c58d6e5d901" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "WelcomeShown" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "WinkeyFunction" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack" /v "WinLangID" /t REG_DWORD /d "1033" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "IdealHeight.6" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "IdealHeight.9" /t REG_DWORD /d "65544" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "IdealWidth.9" /t REG_SZ /d "Network Connections" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "IdealHeight.7" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "OrbHeight.120" /t REG_DWORD /d "101" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "OrbHeight.144" /t REG_DWORD /d "138" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "OrbHeight.168" /t REG_DWORD /d "148" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "OrbHeight.192" /t REG_DWORD /d "162" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "OrbHeight.288" /t REG_DWORD /d "243" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "OrbHeight.96" /t REG_DWORD /d "54" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "OrbWidth.120" /t REG_DWORD /d "50" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "OrbWidth.144" /t REG_DWORD /d "60" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "OrbWidth.168" /t REG_DWORD /d "70" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "OrbWidth.192" /t REG_DWORD /d "108" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "OrbWidth.288" /t REG_DWORD /d "120" /f
Reg.exe add "HKCU\Software\StartIsBack\Cache" /v "OrbWidth.96" /t REG_DWORD /d "54" /f
Reg.exe add "HKCU\Software\StartIsBack\Recolor" /v "Hilight" /t REG_DWORD /d "14120960" /f
Reg.exe add "HKCU\Software\StartIsBack\Recolor" /v "HotTrackingColor" /t REG_DWORD /d "13395456" /f
Reg.exe add "HKCU\Software\StartIsBack\Recolor" /v "MenuHilight" /t REG_DWORD /d "14120960" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\StartIsBack.UpdateToast" /v "Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack\Taskbaz" /v "Toolbars" /t REG_BINARY /d "0c000000080000000200000000000000aa4f2868486ad0118c7800c04fd918b475050000400d00000000000050000000000000000000000050000000000000000100000001000000b0e22bd86457d011a96e00c04fd705a222001c000a11000001000000020000000000000000000000000000004c0000000114020000000000c000000000000046810100001128080011ecc5fb88c1d9013fc76c5b8f5cdb011e296c5b8f5cdb01004000000000000001000000000000000000000000000000910014001f50e04fd020ea3a6910a2d808002b30309d19002f443a5c00000000000000000000000000000000000000620031000000000057599aa31128546f6f6c62617200400009000400efbefc56ee9a57599aa32e000000ddb600000000010000000000000000000000000000005945910054006f006f006c00620061007200000016000c0000002900efbe08001600000060000000030000a0580000000000000062656e000000000000000000000000007e39aa4d3930d74f9f651199b34d2ab124e9e50c7b2dee118a212cf05d3a63367e39aa4d3930d74f9f651199b34d2ab124e9e50c7b2dee118a212cf05d3a633645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d0000006800000000480000006d592def8ea4994c8f930a8b579a499a00000000000000000000000008000000020000000a16000001000000210000008c000000000000007e00320088040000215ac1ac20283153484f57447e312e4c4e4b0000560009000400efbef556f515215ac1ac2e000000dfb60000000001000000000000000000000000000000e01f210131002000530068006f00770020004400650073006b0074006f0070002e006c006e006b0000001c000c0000002900efbe08001c000000000000003b020000010000008a003200b2050000225aa1b8202833205265766f5550506f72742e6578652e6c6e6b00005a0009000400efbeb6587c9c225aa1b82e000000d2070000000017020000000000000000000000000000da348500330020005200650076006f005500500050006f00720074002e006500780065002e006c006e006b00000024000c0000002900efbe080024000000000000000000000014001f50e04fd020ea3a6910a2d808002b30309d19002f443a5c000000000000000000000000000000000000005a00310000000000000000001000706f7274417070730000420009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000070006f00720074004100700070007300000018009e00310000000000a358d50410205265766f556e696e7374616c6c657250726f5f506f727461626c6500680009000400efbe7458b38ea358d5042e000000000000000000000000000000000000000000000000000f1e84005200650076006f0055006e0069006e007300740061006c006c0065007200500072006f005f0050006f0072007400610062006c00650000002a000c0000002900efbe08002a007800320088b102007254104720285265766f5550506f72742e65786500004e0009000400efbebc586bb5bc586bb52e000000280a00000000850000000000000000000000000000005d1c0f005200650076006f005500500050006f00720074002e0065007800650000001e000c0000002900efbe08001e00000098000000050000008a0032008d050000225a36b82028342e2057686174496e537461727475702e6c6e6b00005a0009000400efbe99573b89225a36b82e0000002f0000000000090000000000000000000000000000003fb41a0134002e002000570068006100740049006e0053007400610072007400750070002e006c006e006b00000024000c0000002900efbe08002400000000000000d8000000030000007800320010050000235a0a0f2028362e205265666c6563742e6c6e6b00004e0009000400efbe4958ca1c235a0a0f2e0000007c5b00000000520000000000000000000000000000003f5a120136002e0020005200650066006c006500630074002e006c006e006b0000001e000c0000002900efbe08001e000000000000004a00000044003a005c00500072006f006700720061006d002000460069006c00650073005c005200650066006c006500630074005c005200650066006c006500630074002e00650078006500000000000000800000000400000072003200110500009d59c3a1202839524549434f7e312e4c4e4b00004a0009000400efbef556f6159d59c3a12e00000004b70000000001000000000000000000000000000000d392c4003900200052006500490063006f006e002e006c006e006b0000001c000c0000002900efbe08001c000000000000008c000000060000007e003200cc060000215a8ab8202831334445564d7e312e4c4e4b0000560009000400efbef556f615215a8ab82e000000e2b600000000010000000000000000000000000000009a7ac1003100330020006400650076006d0067006d0074002e006d00730063002e006c006e006b0000001c000c0000002900efbe08001c00000000000000d701000007000000800032001c030000235a700e202831344449534b7e312e4c4e4b0000580009000400efbef556f615235a700e2e000000e4b6000000000100000000000000000000000000000090e311003100340020006400690073006b006d0067006d0074002e006d00730063002e006c006e006b0000001c000c0000002900efbe08001c000000000000000000000014001f50e04fd020ea3a6910a2d808002b30309d19002f433a5c0000000000000000000000000000000000000056003100000000006f555c98102857696e646f777300400009000400efbea7542c2a6f5501aa2e000000410800000000010000000000000000000000000000003ce3ce00570069006e0064006f0077007300000016005a003100000000006f55db9a102853797374656d33320000420009000400efbea7542c2a6f5501aa2e000000b70f0000000001000000000000000000000000000000a2573c00530079007300740065006d0033003200000018006600320042ba00006456174620006469736b6d676d742e6d736300004a0009000400efbe6456473e645617462e000000d3960000000001000000000000000000000000000000c9d23e006400690073006b006d0067006d0074002e006d007300630000001c00000086000000080000007800320056030000225a2c9620283136534552567e312e4c4e4b0000500009000400efbef556f615225a2c962e000000e5b600000000010000000000000000000000000000009c8cb400310036002000730065007200760069006300650073002e006c006e006b0000001c000c0000002900efbe08001c0000000000000092000000090000008400320047050000225a44b52028323220526567576f726b73686f702e6c6e6b0000560009000400efbef556f615225a44b52e000000ecb6000000000100000000000000000000000000000079ee170032003200200052006500670057006f0072006b00730068006f0070002e006c006e006b00000022000c0000002900efbe08002200000000000000ee0000000a00000086003200bc060000235a440e20283336485950457e312e4c4e4b00005e0009000400efbef556f615235a440e2e000000f3b60000000001000000000000000000000000000000ff4c5c00330036002000480079007000650072002d00560020004d0061006e0061006700650072002e006c006e006b0000001c000c0000002900efbe08001c000000000000005200000063003a005c00700072006f006700720061006d002000460069006c00650073005c00680079007000650072002d0056005c0053006e006100700049006e00410062006f00750074002e0064006c006c00000000000000900000000b0000008200320037050000215a7b9d202834314e4f54457e312e4c4e4b00005a0009000400efbef556f615215a7b9d2e000000f4b6000000000100000000000000000000000000000074bb63003400310020006e006f00740065007000610064002b002b002e006500780065002e006c006e006b0000001c000c0000002900efbe08001c000000000000009a0000000c0000008c0032001c0400009159f5a620283536574953457e312e4c4e4b0000640009000400efbef556f6159159f5a62e000000fdb60000000001000000000000000000000000000000016f5e003500360020005700690073006500200046006f007200630065002000440065006c0065007400650072002e006c006e006b0000001c000c0000002900efbe08001c000000000000009a0000000e0000008c00320082070000225ae6b42028363557494e447e312e4c4e4b0000640009000400efbef556f615225ae6b42e000000feb6000000000100000000000000000000000000000024c41c00360035002000570069006e0064006f0077007300200050006f007700650072005300680065006c006c002e006c006e006b0000001c000c0000002900efbe08001c00000000000000ce0000000f00000084003200de050000235af30c20283730434f4d4d7e312e4c4e4b00005c0009000400efbef556f615235af30c2e00000000b70000000001000000000000000000000000000000f1f4530037003000200043006f006d006d0061006e0064002000500072006f006d00700074002e006c006e006b0000001c000c0000002900efbe08001c00000000000000340000002500770069006e0064006900720025005c00730079007300740065006d00330032005c0063006d0064002e006500780065000000000000007c000000100000006e00320024050000235a970d2028424f4f544943452e6c6e6b00480009000400efbef556f615235a970d2e00000005b700000000010000000000000000000000000000003025ab0042004f004f0054004900430045002e006c006e006b0000001a000c0000002900efbe08001a00000000000000dc000000020000008400320002050000225a57b220284469736b47656e6975732e6578652e6c6e6b0000560009000400efbe25595ab1225a57b22e0000002b0300000000a70200000000000000000000000000002aba85004400690073006b00470065006e006900750073002e006500780065002e006c006e006b00000022000c0000002900efbe080022000000000000004200000044003a005c0070006f005c004400690073006b002000470065006e006900750073005c004400690073006b00470065006e006900750073002e00650078006500000000000000760000001e00000068003200eb080000225a53a02028457863656c2e6c6e6b00440009000400efbe215ab21d225a53a02e0000001b4700000000310100000000000000000000000000001686c60045007800630065006c002e006c006e006b00000018000c0000002900efbe08001800000000000000820000001100000074003200f40400006959f41920286d737473632e6578652e6c6e6b004c0009000400efbed258e4aa6959f4192e000000f720000000006d000000000000000000000000000000d64ae8006d0073007400730063002e006500780065002e006c006e006b0000001c000c0000002900efbe08001c000000000000009a000000120000008c0032002d0500005659699d20284e5375446f20392e3220707265766965772e6c6e6b005c0009000400efbed458edaa5659699d2e000000890200000000b10000000000000000000000000000004b7a40004e005300750044006f00200039002e003200200070007200650076006900650077002e006c006e006b00000024000c0000002900efbe0800240000000000000080000000200000007200320050080000215ae1ba20284f6e6544726976652e6c6e6b00004a0009000400efbe215ab51d215ae1ba2e000000334700000000240100000000000000000000000000005fd59b004f006e006500440072006900760065002e006c006e006b0000001c000c0000002900efbe08001c00000000000000880000001b0000007a003200ff0400009859e30b20286f6f64697372762e6578652e6c6e6b00500009000400efbe965985909859e30b2e000000f81400000000160000000000000000000000000000004c514b006f006f00640069007300720076002e006500780065002e006c006e006b0000001e000c0000002900efbe08001e000000000000009a0000001f0000008c0032006f090000215ab41d20284f75746c6f6f6b2028636c6173736963292e6c6e6b005c0009000400efbe215ab41d215ab41d2e0000000a4900000000ab000000000000000000000000000000502ad5004f00750074006c006f006f006b002000280063006c006100730073006900630029002e006c006e006b00000024000c0000002900efbe08002400000000000000860000001d000000780032009c090000215ab11d2028506f776572506f696e742e6c6e6b00004e0009000400efbe215ab11d215ab11d2e0000000e47000000007b000000000000000000000000000000706d450050006f0077006500720050006f0069006e0074002e006c006e006b0000001e000c0000002900efbe08001e000000000000007600000013000000680032005203000065598011202850755454592e6c6e6b00440009000400efbe1059238c655980112e0000003203000000003d0400000000000000000000000000007c465b00500075005400540059002e006c006e006b00000018000c0000002900efbe08001800000000000000800000000d0000007200320096090000225a29962028707773682e6578652e6c6e6b00004a0009000400efbe215acfa6225a29962e0000000eb2000000001d0000000000000000000000000000005d592b0070007700730068002e006500780065002e006c006e006b0000001c000c0000002900efbe08001c00000000000000740000001400000066003200750400009d597da52028526170722e6c6e6b0000420009000400efbe115994a39d597da52e000000b30a000000002b03000000000000000000000000000046a67a0052006100700072002e006c006e006b00000018000c0000002900efbe08001800000000000000860000001500000078003200c70400001559440120285244434d616e2e6578652e6c6e6b00004e0009000400efbe7d580ab8155944012e0000006500000000008e01000000000000000000000000000082bee2005200440043004d0061006e002e006500780065002e006c006e006b0000001e000c0000002900efbe08001e000000000000008e0000001600000080003200da0400009e5988b12028524d4275696c6465722e6578652e6c6e6b00540009000400efbea558cd929e5988b12e000000ad2b00000000990000000000000000000000000000003277d30052004d004200750069006c006400650072002e006500780065002e006c006e006b00000020000c0000002900efbe080020000000000000008c000000170000007e0032008604000099592d1320285345525645527e312e4c4e4b0000560009000400efbef556f61599592d132e00000013b70000000001000000000000000000000000000000e0d94c0053006500720076006500720020004d0061006e0061006700650072002e006c006e006b0000001c000c0000002900efbe08001c000000000000008e00000018000000800032007f0400003257b5102028536e697070696e6720546f6f6c2e6c6e6b00540009000400efbe3257b51024583d792e000000a10400000000370000000000000000000000000000002948300053006e0069007000700069006e006700200054006f006f006c002e006c006e006b00000020000c0000002900efbe080020000000000000007c000000190000006e003200eb0400005159f50c202854686f7269756d2e6c6e6b00480009000400efbe8b58eda85159f50c2e000000e50501000000610000000000000000000000000000008a132f01540068006f007200690075006d002e006c006e006b0000001a000c0000002900efbe08001a00000000000000b20000001a000000a400320013060000f758a49420285669727475616c426f78372e30506f727461626c652e6578652e6c6e6b006c0009000400efbed85874a0f758a4942e0000000a5000000000390000000000000000000000000000006a6444005600690072007400750061006c0042006f00780037002e00300050006f0072007400610062006c0065002e006500780065002e006c006e006b0000002c000c0000002900efbe08002c00000000000000740000001c000000660032000d090000225a71b82028576f72642e6c6e6b0000420009000400efbe215ab01d225a71b82e0000002b4700000000580100000000000000000000000000001f7b860057006f00720064002e006c006e006b00000018000c0000002900efbe08001800000000000000de06000041070000000000004e00000000000000000000004e0000000000000001000000" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack\Taskbaz" /v "Settings" /t REG_BINARY /d "30000000feffffff020000000300000060000000a200000000000000ce070000000f000070080000c000000002000000" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack\Taskbaz" /v "SAM1016#7&1cd55b07&0&UID49219" /t REG_BINARY /d "30000000feffffff020000000300000060000000a200000000f1ffffce0700000000000070080000c000000002000000" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\Background\Shell\PowerShellAsAdmin\command" /ve /t REG_SZ /d "PowerShell.exe -windowstyle hidden -Command \"Start-Process cmd.exe -ArgumentList \"/s,/c,pushd %%%%V && powerShell\" -Verb RunAs\"" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Drive\Shell\PowerShellAsAdmin\command" /ve /t REG_SZ /d "PowerShell.exe -windowstyle hidden -Command \"Start-Process cmd.exe -ArgumentList \"/s,/c,pushd %%%%V && powerShell\" -Verb RunAs\"" /f
Reg.exe add "HKLM\SOFTWARE\Classes\LibraryFolder\Shell\PowerShellAsAdmin\command" /ve /t REG_SZ /d "PowerShell.exe -windowstyle hidden -Command \"Start-Process cmd.exe -ArgumentList \"/s,/c,pushd %%%%V && powerShell\" -Verb RunAs\"" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
