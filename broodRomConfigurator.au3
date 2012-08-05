#NoTrayIcon
#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=256x256BroodROMicon.ico
#AutoIt3Wrapper_Outfile=brconfigurator_x86.exe
#AutoIt3Wrapper_Outfile_x64=brconfigurator_x64.exe
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Description=©2012 broodplank.net
#AutoIt3Wrapper_Res_Fileversion=0.4.0.0
#AutoIt3Wrapper_Run_Tidy=y
#AutoIt3Wrapper_Run_Obfuscator=y
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****

#region ; Options and version
;Options
Opt("GUICloseonEsc", 0)
Opt('MustDeclareVars', 1)
#endregion ; Options and version

#region ; Declaration & Version
;Declare variables
Local $localversion, $NoCheck, $GUI, $kernel, $installkernel, $kernelfile, $accelerator, $installaccelerator, $acceleratorfile, $cpugov, $installcpugov, $cpugovoption, $ioshel, $installioshell, $iosheloption, $gpu, $installgpu
Local $mediascan, $installmediascan, $languages, $installlanguages, $bootsound, $installbootsound, $custombootsound, $browsecustombootsound, $installcustombootsound, $gpserver, $installgpsserver, $dnsserver, $installdnsserver
Local $apnsettings, $installapn, $theme, $installtheme, $bootanimation, $broswecustombootatnimation, $installbootanimation, $extstatbar, $installextstatbar, $wipepartition, $gowipepartition, $recoverbootloop, $gorecover, $wipebatterystats
Local $installbatterytweak, $batterytips, $turnoff, $reboot, $rebootrec, $rebootdown, $copyright, $custombootanimation, $installcustombootanimation, $versionGUI, $checkversion, $checkupdate, $version, $msg1, $readversion, $custombootanimationfile
Local $custombootsoundfile, $batterymsg, $READGOV, $READSHEL, $readgps, $msg, $msg2, $skipcheck, $icskeyboard, $installicskeyboard, $adblock, $pushadblock, $installcpugovnow, $installioshellnow, $filemenu, $filemenu_exit, $CURPOS
Local $optionsmenu, $optionsmenu_preferences, $helpmenu, $helpmenu_about, $optionsGUI, $options_app_check, $options_app_update, $options_bat_pause, $options_bat_safemode, $options_ok_button, $options_cancel_button, $options_apply_button
Local $options_app_check_read, $options_app_update_read, $options_bat_safemode_read, $options_bat_pause_read, $helpmenu_credits, $aboutGUI, $msg3, $ReadEnablecheck, $ReadUpdatecheck, $ReadSafeMode, $ReadEnablepause, $pause_parameter
Local $filemenu_restart, $recovery, $installrecovery, $removebloatware, $goremovebloatware, $bloatwarelist, $audiotweak, $installaudiotweak, $backup, $gobackup, $stockapps, $installstockapps, $tweaksmodules, $installtweaksmodules
Local $phonecontrol, $phonecontrol_start, $phonecontrol_stop, $phonecontrol_status
$localversion = "beta5"

#endregion ; Declaration & Version

#region ; Includes
;Includes
#include <WindowsConstants.au3>
#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <Process.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <Constants.au3>
#include <StaticConstants.au3>
#endregion ; Includes

#region ; System Check
;~ If IsAdmin() = 0 Then
;~ 	MsgBox(48, "Galaxy S Plus Configurator", "It appears that you do not have administrator access, please run the application as administrator or logon to an administrator account." & @CRLF & @CRLF & "Exiting...")
;~ 	Exit
;~ EndIf
#endregion ; System Check

#region ; Authenticate check

$ReadEnablecheck = IniRead(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "enablecheck", 1)
If $ReadEnablecheck = "1" Then
	_CheckVersion()
Else
	;
EndIf
#endregion ; Authenticate check

#region ; Main GUI
;Create GUI
$GUI = GUICreate("Galaxy S Plus Configurator RC1", 800, 720);, -1, -1, $WS_EX_LAYERED)
GUISetBkColor(0xf9f8f6, $GUI)
GUISetFont(8, 8, 0, "Verdana", $GUI)

$filemenu = GUICtrlCreateMenu("&File")
$filemenu_restart = GUICtrlCreateMenuItem("&Restart", $filemenu, 1)
$filemenu_exit = GUICtrlCreateMenuItem("E&xit", $filemenu, 2)

$optionsmenu = GUICtrlCreateMenu("&Options")
$optionsmenu_preferences = GUICtrlCreateMenuItem("&Preferences", $optionsmenu, 1)

$phonecontrol = GUICtrlCreateMenu("&Phone Control")
$phonecontrol_status = GUICtrlCreateMenuItem("Current State: Idle", $phonecontrol, 1)
GUICtrlSetState($phonecontrol_status, $GUI_DISABLE)
$phonecontrol_stop = GUICtrlCreateMenuItem("Send stop (freeze phone)", $phonecontrol, 2)
$phonecontrol_start = GUICtrlCreateMenuItem("Send start (unfreeze phone)", $phonecontrol, 3)

$helpmenu = GUICtrlCreateMenu("&Help")
$helpmenu_credits = GUICtrlCreateMenuItem("&Credits", $helpmenu, 1)
$helpmenu_about = GUICtrlCreateMenuItem("&About", $helpmenu, 2)


GUICtrlCreatePic(@ScriptDir & "\src\img\logolarge.jpg", 150, 0, 500, 50)

GUICtrlCreateLabel("System Preferences:", 5, 50, 390, 20, $SS_CENTER)
GUICtrlCreatePic(@ScriptDir & "\src\img\bar.jpg", 0, 65, 400, 1)

GUICtrlCreateGroup("", 5, 65, 390, 340)
GUICtrlCreateLabel("Choose your preferred Kernel and CPU Frequency:", 10, 80)
GUICtrlSetTip(-1, "A kernel is the core of an Android system, changing it may affect CPU Governors and I/O Scheduler." & @CRLF & "Flashing a kernel has to be done manually, no automated installation is available." & @CRLF & "You can choose one of the kernels in the list and click install to install it", "", 1, 1)
$kernel = GUICtrlCreateCombo("SkyHigh v1.4 OC (1.8 GHz)", 10, 95, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($kernel, "Feacore 1.4 Non OC (1.4 GHz)|Feacore 1.4 OC (1.8 GHz)|Cranium Kernel v6 (1.9 GHz)|Cranium Kernel v7 (1.92 GHz)|Cranium Kernel v8 (1.4 GHz)|Vitality Kernel v25-54|KQ7 Stock Kernel with init.d/bootanim support")
$installkernel = GUICtrlCreateButton("Install", 310, 94, 80, 22)

GUICtrlCreateLabel("Choose your preferred Recovery:", 10, 120)
GUICtrlSetTip(-1, "A System Accelerator is a set of scripts that optimize your Android system." & @CRLF & "You can choose to flash it yourself in CWM or do an Automated switch.", "", 1, 1)
$recovery = GUICtrlCreateCombo("Feamod Recovery 1.4 (CWM v5.5.0.4)", 10, 135, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($recovery, "Feamod Recovery 1.3 (CWM v5.0.2.7)|Feamod Recovery 1.2 (CWM v5.0.2.7)|Stock Recovery")
$installrecovery = GUICtrlCreateButton("Install", 310, 134, 80, 22)

GUICtrlCreateLabel("Choose your preferred System Accelerator:", 10, 160)
GUICtrlSetTip(-1, "A System Accelerator is a set of scripts that optimize your Android system." & @CRLF & "You can choose to flash it yourself in CWM or do an Automated switch.", "", 1, 1)
$accelerator = GUICtrlCreateCombo("Thunderbolt v2.6.1", 10, 175, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($accelerator, "Universal Adrenaline Shot 14|V6 SuperCharger Update 8|Lagfree v2.01 (editted for i9001)|TweakZV6 (not tested)|Remove current system accelerator")
$installaccelerator = GUICtrlCreateButton("Install", 310, 174, 80, 22)

GUICtrlCreateLabel("Choose your preferred CPU Governor:", 10, 200)
GUICtrlSetTip(-1, "A CPU Governor is a profile of the behaviour of the CPU" & @CRLF & "Recommended: smartassV2 (for Feacore) and interactiveX (for Cranium Kernel)", "", 1, 1)
$cpugov = GUICtrlCreateCombo("smartassV2", 10, 215, 230, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($cpugov, "conservative|ondemand|performance|brazilianwax|smoothass|SavagedZen|interactive|interactiveX |lagfree|minmax|Scary|userspace|powersave")
$installcpugov = GUICtrlCreateButton("Set on boot", 310, 214, 80, 22)
$installcpugovnow = GUICtrlCreateButton("Set now", 245, 214, 60, 22)

GUICtrlCreateLabel("Choose your preferred I/O Scheduler:", 10, 240)
GUICtrlSetTip(-1, "An I/O scheduler manages the data streams of your Android system." & @CRLF & "Recommended: sio (for Feacore) and vr (for Cranium Kernel)", "", 1, 1)
$ioshel = GUICtrlCreateCombo("sio", 10, 255, 230, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($ioshel, "vr|noop|deadline|cfq|bfq")
$installioshell = GUICtrlCreateButton("Set on boot", 310, 254, 80, 22)
$installioshellnow = GUICtrlCreateButton("Set now", 245, 254, 60, 22)

GUICtrlCreateLabel("Choose your preferred GPU Driver:", 10, 280)
GUICtrlSetTip(-1, "A GPU Driver manages the GPU hardware in your phone" & @CRLF & "Recommended: i8150 GPU Drivers (because of better 3d performance)", "", 1, 1)
$gpu = GUICtrlCreateCombo("i8150 GPU Drivers (Better 3D)", 10, 295, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($gpu, "i9001 GPU Drivers (Device default)|i9001 QK6 GPU Drivers (Tweaked drivers)")
$installgpu = GUICtrlCreateButton("Install", 310, 294, 80, 22)

GUICtrlCreateLabel("Scan for Media on boot in /sdcard/", 10, 320)
GUICtrlSetTip(-1, "On every boot or after plugging out the USB cable there is a media scan" & @CRLF & "The media scan scans for photos, videos and pictures" & @CRLF & "Disabling it may cause problems in Gallery", "", 1, 1)
$mediascan = GUICtrlCreateCombo("Media Scanning Enabled (Default)", 10, 335, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($mediascan, "Media Scanning Disabled (Faster boot)")
$installmediascan = GUICtrlCreateButton("Set now", 310, 334, 80, 22)

GUICtrlCreateLabel("Remove bloatware from your ROM", 10, 360)
GUICtrlSetTip(-1, "Bloatware are apps added by your provider/Samsung, most bloatware is useless so why don't remove it?", "", 1, 1)
$goremovebloatware = GUICtrlCreateButton("Start bloatware removal wizard", 10, 375, 200, 22)
$bloatwarelist = GUICtrlCreateButton("List of bloatware apps", 215, 375, 175, 22)


GUICtrlCreateLabel("Extra Tweaks:", 405, 50, 390, 20, $SS_CENTER)
GUICtrlCreatePic(@ScriptDir & "\src\img\bar.jpg", 405, 65, 400, 1)


GUICtrlCreateGroup("", 405, 65, 390, 340)

GUICtrlCreateLabel("Install Extra Languages:", 410, 80)
GUICtrlSetTip(-1, "Add extra languages to broodROM. Locale app and Arabian patch are currently available", "", 1, 1)
$languages = GUICtrlCreateCombo("Install " & Chr(34) & "Locale" & Chr(34) & " app to enable more languages", 410, 95, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($languages, "Install Arabian languages (RTL)")
$installlanguages = GUICtrlCreateButton("Install", 710, 94, 80, 22)

GUICtrlCreateLabel("Choose your preferred startup sound from the list:", 410, 120)
GUICtrlSetTip(-1, "A boot sound is the sound played when your phone starts." & @CRLF & "Choose a boot sound from the list and click install", "", 1, 1)
$bootsound = GUICtrlCreateCombo("Samsung i9001 standard boot sound (Default)", 410, 135, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($bootsound, "Feacore Phoenix boot sound|Disable boot sound")
$installbootsound = GUICtrlCreateButton("Set now", 710, 134, 80, 22)

GUICtrlCreateLabel("Choose a custom boot sound file:", 410, 160)
GUICtrlSetTip(-1, "Choose a custom boot sound for your phone." & @CRLF & "The only valid file type is .wav, other extensions are not supported!", "", 1, 1)
$custombootsound = GUICtrlCreateInput("------ locate PowerOn.wav ------", 410, 175, 200, 20, $ES_READONLY)
$browsecustombootsound = GUICtrlCreateButton("Browse...", 625, 174, 80, 22)
$installcustombootsound = GUICtrlCreateButton("Set now", 710, 174, 80, 22, $WS_DISABLED)

GUICtrlCreateLabel("Choose a GPS Server:", 410, 200)
GUICtrlSetTip(-1, "Choose your country as GPS Server for best results." & @CRLF & "Your country not listed? Choose the country which is the closest to you.", "", 1, 1)
$gpserver = GUICtrlCreateCombo("North-America (Default)", 410, 215, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($gpserver, "Asia|Europe|Oceania|South-America|Netherlands|China|Russia|India|UK|Germany|France|Japan|Italy|Poland|Malaysia|Korea")
$installgpsserver = GUICtrlCreateButton("Set now", 710, 214, 80, 22)

GUICtrlCreateLabel("Choose a DNS Server:", 410, 240)
GUICtrlSetTip(-1, "A DNS (Domain Name System) server translates IP adresses to domain names." & @CRLF & "The default DNS works fine, although you could try pinging other DNS servers using Terminal Emulator" & @CRLF & "If some DNS has a lower latency then the default DNS you can consider changing.", "", 1, 1)
$dnsserver = GUICtrlCreateCombo("84.241.226.140 / 84.241.226.9 (Default DNS)", 410, 255, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($dnsserver, "8.8.4.4 / 8.8.8.8 (Google DNS)|208.67.222.222 / 208.67.220.220 (OpenDNS)|87.118.111.215 / 81.174.67.134 (FoolDNS)|2.2.2.2 - 2.2.2.5 (GTEI DNS)")
$installdnsserver = GUICtrlCreateButton("Set now", 710, 254, 80, 22)

GUICtrlCreateLabel("Choose APN Settings (for 3g):", 410, 280)
GUICtrlSetTip(-1, "Choose an APN list, this file includes all operators (Call/3G/MMS) Settings." & @CRLF & "Cyanogenmod APN has allot more operators then the XXKPS Stock APN list", "", 1, 1)
$apnsettings = GUICtrlCreateCombo("XXKPS Stock APN (Manual 3G Settings)", 410, 295, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($apnsettings, "Cyanogenmod APN List (Automatic 3G Settings)")
$installapn = GUICtrlCreateButton("Install", 710, 294, 80, 22)

GUICtrlCreateLabel("Install extra stock apps:", 410, 320)
GUICtrlSetTip(-1, "Add extra stock apps to your ROM", "", 1, 1)
$stockapps = GUICtrlCreateCombo("Replacement for TouchWiz apps", 410, 335, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($stockapps, "more to come")
$installstockapps = GUICtrlCreateButton("Install", 710, 334, 80, 22)

GUICtrlCreateLabel("Extra Tweaks / Modules", 410, 360)
GUICtrlSetTip(-1, "A little addition to your ROM", "", 1, 1)
$tweaksmodules = GUICtrlCreateCombo("Open VPN Support (tun.ko)", 410, 375, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($tweaksmodules, "Wifi Tweak|GPS Tweak")
$installtweaksmodules = GUICtrlCreateButton("Install", 710, 374, 80, 22)


GUICtrlCreateLabel("Appearance and Audio Tweaks:", 5, 410, 390, 20, $SS_CENTER)
GUICtrlCreatePic(@ScriptDir & "\src\img\bar.jpg", 0, 425, 400, 1)

GUICtrlCreateGroup("", 5, 425, 390, 260)

GUICtrlCreateLabel("Choose your preferred Theme:", 10, 440)
GUICtrlSetTip(-1, "Choose a theme for your phone, fully automated installation, zero action required." & @CRLF & "I recommend using the latest Ice Cream Sandwich theme unless you prefer the Stock Theme", "", 1, 1)
$theme = GUICtrlCreateCombo("Ice Cream Sandwich v3.1.1", 10, 455, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($theme, "XXKQ7 2.3.6 Stock|Nebula Grey|Nebula Red|Nebula Blue|Nebula Green", "Ice Cream Sandwich v3.1.1")
$installtheme = GUICtrlCreateButton("Install", 310, 454, 80, 22)

GUICtrlCreateLabel("Choose a boot animation from the list:", 10, 480)
GUICtrlSetTip(-1, "Choose a boot animation for your phone, this is the animation which shows at startup." & @CRLF & "Default boot animation is broodROM RC2. Newest boot animation is Ice Cream Sandwich", "", 1, 1)
$bootanimation = GUICtrlCreateCombo("broodROM RC2 boot animation", 10, 495, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($bootanimation, "broodROM RC2 boot animation by Sweetez|Cyanogen Cyan boot animation (RC1 Default)|Ice Cream Sandwich boot animation (Default)", "Ice Cream Sandwich boot animation (Default)")
$installbootanimation = GUICtrlCreateButton("Install", 310, 494, 80, 22)

GUICtrlCreateLabel("Choose a custom boot animation file:", 10, 520)
GUICtrlSetTip(-1, "Choose a custom boot animation file to install" & @CRLF & "Required attributes: Filetype: .zip, Compression: Store (none)", "", 1, 1)
$custombootanimation = GUICtrlCreateInput("-------- locate sanim.zip --------", 10, 535, 200, 20, BitOR($ES_READONLY, $ES_AUTOHSCROLL))
$broswecustombootatnimation = GUICtrlCreateButton("Browse...", 225, 533, 80, 22)
$installcustombootanimation = GUICtrlCreateButton("Install", 310, 533, 80, 22, $WS_DISABLED)

GUICtrlCreateLabel("Extra Mods", 10, 560)
GUICtrlSetTip(-1, "Extended Status Bar Mod:" & @CRLF & "Expand your status bar by 9 buttons (removed the LED Flashlight button for i9001 camera fix)" & @CRLF & "Scrollable bar, fully customizable with QuickPanel Settings app", "", 1, 1)
$extstatbar = GUICtrlCreateCombo("Install Extended Status bar (CWM)", 10, 575, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($extstatbar, "Install Extended Status bar (Automated)|Uninstall Extended Status bar (Automated)|Install Flip-to-Mute " & Chr(38) & " Non Increasing Ringtone|Uninstall Flip-to-Mute " & Chr(38) & " Non Increasing Ringtone")
$installextstatbar = GUICtrlCreateButton("Install", 310, 574, 80, 22)

GUICtrlCreateLabel("Ice Cream Sandwich Keyboards", 10, 600)
GUICtrlSetTip(-1, "Choose a replacement for your XXKPS stock keyboard" & @CRLF & "4 Colors available for ICS Keyboard, Fully automated installation.", "", 1, 1)
$icskeyboard = GUICtrlCreateCombo("Ice Cream Sandwich Grey Keyboard (Default)", 10, 615, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($icskeyboard, "Ice Cream Sandwich Black Keboard|Ice Cream Sandwich Glossy Keyboard|Ice Cream Sandwich Light Chrome Keyboard|Stock Keyboard")
$installicskeyboard = GUICtrlCreateButton("Install", 310, 614, 80, 22)

GUICtrlCreateLabel("Beats Audio / DSP Manager", 10, 640)
GUICtrlSetTip(-1, "Add Beats Audio to your ROM to get an overall higher sound quality", "", 1, 1)
$audiotweak = GUICtrlCreateCombo("Install Beats Audio", 10, 655, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($audiotweak, "Uninstall Beats Audio|Install DSP Manager|Uninstall DSP Manager")
$installaudiotweak = GUICtrlCreateButton("Install", 310, 654, 80, 22)

GUICtrlCreateLabel("Other Settings and Actions:", 405, 410, 390, 20, $SS_CENTER)
GUICtrlCreatePic(@ScriptDir & "\src\img\bar.jpg", 400, 425, 400, 1)

GUICtrlCreateGroup("", 405, 425, 390, 260)

GUICtrlCreateLabel("Choose a partition to wipe (deletes everything):", 410, 440)
GUICtrlSetTip(-1, "Select your partition (reset) and click Format to wipe it" & @CRLF & "Note: After wiping /dalvik-cache startup usually takes upto 1 min.", "", 1, 1)
$wipepartition = GUICtrlCreateCombo("Wipe: Cache (data/cache)", 410, 455, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($wipepartition, "Wipe: Dalvik-Cache (data/dalvik-cache)|Wipe: Data (/data) (Factory Reset)|Wipe: SDCard (/sdcard)|Wipe: /data, /cache and /sdcard (Hard Reset)")
$gowipepartition = GUICtrlCreateButton("Format", 710, 454, 80, 22)

GUICtrlCreateLabel("Recover from bootloop/softbrick, what is the current situation?", 410, 480)
GUICtrlSetTip(-1, "Stuck in a bootloop or in black screen of death?" & @CRLF & "Using one of the below options can revive your phone" & @CRLF & "Choose the situation that matches your problem the best", "", 1, 1)
$recoverbootloop = GUICtrlCreateCombo("Bootloop by flashing a Theme or Mod", 410, 495, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($recoverbootloop, "Bootloop by flashing Cranium Kernel v8|No boot possible, only Black Screen of Death|Don't know what gone wrong, got Nandroid backup")
$gorecover = GUICtrlCreateButton("Recover", 710, 495, 80, 22)

GUICtrlCreateLabel("AdBlocker (uses hosts file)", 410, 520)
GUICtrlSetTip(-1, "Tired of ads? Use the hosts file to prevent them." & @CRLF & "No additional app needed when using Update function.", "", 1, 1)
$adblock = GUICtrlCreateCombo("Update Hosts File", 410, 535, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($adblock, "Enable AdBlocker|Disable AdBlocker")
$pushadblock = GUICtrlCreateButton("Set now", 710, 534, 80, 22)

GUICtrlCreateLabel("Create Backup:", 410, 560)
GUICtrlSetTip(-1, "Create a backup of parts of your ROM or your whole ROM", "", 1, 1)
$backup = GUICtrlCreateCombo("Backup whole ROM", 410, 575, 295, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($backup, "Backup System (/system)|Backup User Data (/data)")
$gobackup = GUICtrlCreateButton("Backup now", 710, 574, 80, 22)

GUICtrlCreateLabel("Battery Additions/Options:", 410, 600)
GUICtrlSetTip(-1, "Not satisfied about your battery life?" & @CRLF & "Use these options to gain a better battery life.", "", 1, 1)
$wipebatterystats = GUICtrlCreateButton("Calibrate Battery", 410, 614, 125, 22)
$installbatterytweak = GUICtrlCreateButton("Install Battery Tweak", 540, 614, 130, 22)
$batterytips = GUICtrlCreateButton("Battery Life Hints", 675, 614, 115, 22)

GUICtrlCreateLabel("Special Reboot and CWM:", 410, 640)
GUICtrlSetTip(-1, "Need to turn your phone off/reboot/reboot in recovery or reboot in download mode?" & @CRLF & "Use the buttons to pick the desired action.", "", 1, 1)
$turnoff = GUICtrlCreateButton("Turn off", 410, 655, 75, 20)
$reboot = GUICtrlCreateButton("Reboot", 490, 655, 75, 20)
$rebootrec = GUICtrlCreateButton("Reboot Recovery", 570, 655, 105, 20)
$rebootdown = GUICtrlCreateButton("Reboot Download", 680, 655, 110, 20)


;~ $copyright = GUICtrlCreateLabel("©2012 broodplank.net - credits also go to: manveru0, sakindia123, reneph, mikeeo019, dsexton702, pikachu01, nikagl, pyronia, fedexist", 7, 568)
$copyright = GUICtrlCreateLabel("©2012 broodplank.net - I am not responsible for any damage caused to your phone, Supported frameworks: XXKQB/XXKQD/XXKQE/DXLD3", 5, 685)
GUICtrlSetStyle($copyright, $WS_DISABLED)




GUISetState()
#endregion ; Main GUI





#region ; CheckVersion function
Func _CheckVersion()

	ProcessClose("adb.exe")

	$versionGUI = GUICreate("broodROM Authenticator BETA 5", 300, 130)
	GUISetBkColor(0xefefef, $versionGUI)
	GUICtrlCreatePic(@ScriptDir & "\src\img\logo.jpg", 25, 0, 250, 33)
	GUICtrlCreateLabel("1. Make sure your i9001 has debugging mode enabled.", 5, 35)
	GUICtrlCreateLabel("2. Connect your phone to the PC using the USB cable.", 5, 50)
	GUICtrlCreateLabel("3. Click on the " & Chr(34) & "Autenticate Device" & Chr(34) & " button to continue.", 5, 65)
	$checkversion = GUICtrlCreateButton("Authenticate Device", 5, 85, 143, 20)
	$checkupdate = GUICtrlCreateButton("Check for Updates", 152, 85, 143, 20)
	$version = GUICtrlCreateLabel("Status: Idle...", 5, 110, 290, 20)

	GUISetState(@SW_SHOW, $versionGUI)
	GUISwitch($versionGUI)

	$ReadUpdatecheck = IniRead(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "updatecheck", 0)
	If $ReadUpdatecheck = "1" Then
		GUICtrlSetStyle($checkupdate, $WS_DISABLED)
		GUICtrlSetStyle($checkversion, $WS_DISABLED)
		If FileExists(@ScriptDir & "\src\temp\version.tmp") Then FileDelete(@ScriptDir & "\src\temp\version.tmp")
		If FileExists(@ScriptDir & "\src\version.ini") Then FileDelete(@ScriptDir & "\src\version.ini")
		If FileExists(@ScriptDir & "\src\version.tmp") Then FileDelete(@ScriptDir & "\src\version.tmp")
		Run(@ScriptDir & "\src\update.bat", "", @SW_HIDE)
		Do
			GUICtrlSetData($version, "Status: Checking update.")
			Sleep(150)
			GUICtrlSetData($version, "Status: Checking update..")
			Sleep(150)
			GUICtrlSetData($version, "Status: Checking update...")
			Sleep(150)
		Until FileExists(@ScriptDir & "\src\version.ini")
		FileMove(@ScriptDir & "\src\version.ini", @ScriptDir & "\src\temp\version.tmp")

		Do
			Sleep(10)
		Until FileExists(@ScriptDir & "\src\temp\version.tmp")


		$readversion = IniRead(@ScriptDir & "\src\temp\version.tmp", "broodromcon", "version", "")


		If $localversion == $readversion Then
			GUICtrlSetData($version, "Status: You are using the latest version, no update required.")
		Else
			GUICtrlSetData($version, "Status: There is an update available!")
			_RunDos("start www.broodplank.net/broodromconfigurator.php")
		EndIf

		GUICtrlSetStyle($checkversion, @SW_ENABLE)
		GUICtrlSetStyle($checkupdate, @SW_ENABLE)
	Else
		;
	EndIf

	While 1
		$msg1 = GUIGetMsg()

		If $msg1 = $gui_event_close Then
;~ 			ExitLoop
			If ProcessExists("adb.exe") Then ProcessClose("adb.exe")
			Exit
		EndIf

		If $msg1 = $checkupdate Then
			GUICtrlSetStyle($checkupdate, $WS_DISABLED)
			GUICtrlSetStyle($checkversion, $WS_DISABLED)
			If FileExists(@ScriptDir & "\src\temp\version.tmp") Then FileDelete(@ScriptDir & "\src\temp\version.tmp")
			If FileExists(@ScriptDir & "\src\version.ini") Then FileDelete(@ScriptDir & "\src\version.ini")
			If FileExists(@ScriptDir & "\src\version.tmp") Then FileDelete(@ScriptDir & "\src\version.tmp")
			Run(@ScriptDir & "\src\update.bat", "", @SW_HIDE)
			Do
				GUICtrlSetData($version, "Status: Checking update.")
				Sleep(150)
				GUICtrlSetData($version, "Status: Checking update..")
				Sleep(150)
				GUICtrlSetData($version, "Status: Checking update...")
				Sleep(150)
			Until FileExists(@ScriptDir & "\src\version.ini")
			FileMove(@ScriptDir & "\src\version.ini", @ScriptDir & "\src\temp\version.tmp")

			Do
				Sleep(10)
			Until FileExists(@ScriptDir & "\src\temp\version.tmp")


			$readversion = IniRead(@ScriptDir & "\src\temp\version.tmp", "broodromcon", "version", "")


			If $localversion == $readversion Then
				GUICtrlSetData($version, "Status: You are using the latest version, no update required.")
			Else
				GUICtrlSetData($version, "Status: There is an update available!")
				_RunDos("start www.broodplank.net/broodromconfigurator.php")
			EndIf

			GUICtrlSetStyle($checkversion, @SW_ENABLE)
			GUICtrlSetStyle($checkupdate, @SW_ENABLE)

		EndIf




		If $msg1 = $checkversion Then
			If FileExists(@ScriptDir & "\src\temp\prop.temp") Then FileDelete(@ScriptDir & "\src\temp\prop.temp")
			Run(@ScriptDir & "\src\getversion.bat", "", @SW_HIDE)
			GUICtrlSetStyle($checkversion, $WS_DISABLED)
			GUICtrlSetStyle($checkupdate, $WS_DISABLED)
			Do
				GUICtrlSetData($version, "Status: Authenticating Device.")
				Sleep(150)
				GUICtrlSetData($version, "Status: Authenticating Device..")
				Sleep(150)
				GUICtrlSetData($version, "Status: Authenticating Device...")
				Sleep(150)
			Until FileExists(@ScriptDir & "\src\temp\prop.temp")



			Sleep(100)
			GUICtrlSetData($version, "Version: " & StringMid(FileReadLine(@ScriptDir & "\src\temp\prop.temp", 4), 21, 50), "Version: n/a")

			If FileReadLine(@ScriptDir & "\src\temp\prop.temp", 4) == "ro.build.display.id=broodROM RC2" Or FileReadLine(@ScriptDir & "\src\temp\prop.temp", 4) == "ro.build.display.id=XXKPS Performance Edition RC2" Or FileReadLine(@ScriptDir & "\src\temp\prop.temp", 4) = "ro.build.display.id=broodROM RC3" Or FileReadLine(@ScriptDir & "\src\temp\prop.temp", 4) = "ro.build.display.id=broodROM RC3 R2" Or FileReadLine(@ScriptDir & "\src\temp\prop.temp", 4) = "ro.build.display.id=broodROM RC4" Then
				GUICtrlSetData($version, "Status: Authentication Succesfull")
				Sleep(200)
				GUIDelete($versionGUI)

				ExitLoop
			Else

				MsgBox(16, "Galaxy S Plus Configurator Error", "Your phone's ROM is not eligible for Galaxy S Plus Configurator" & @CRLF & "The build version of your phone's ROM is: " & StringMid(FileReadLine(@ScriptDir & "\src\temp\prop.temp", 4), 21, 50) & @CRLF & "Valid ROM versions are RC2 (BETA) and RC2" & @CRLF & @CRLF & "Exiting..." & @CRLF & @CRLF & "Optionally you can use the /skipcheck parameter to skip the check"); to prevent damage make sure your ROM is:"&@CRLF&"- XXKPS 2.3.6"&@CRLF&"- Rooted"&@CRLF&"- Deodexed"&@CRLF&@CRLF&"MIGHT CAUSE BOOTLOOPS! BEWARE")
				If ProcessExists("adb.exe") Then ProcessClose("adb.exe")
				Exit

			EndIf
		EndIf




	WEnd


EndFunc   ;==>_CheckVersion
#endregion ; CheckVersion function



#region ; PreferencesMenu function
Func _PreferencesMenu()

	$optionsGUI = GUICreate("Galaxy S Plus Configurator Preferences", 260, 175, -1, -1, -1, BitOR($WS_EX_TOOLWINDOW, $WS_EX_MDICHILD), $GUI)
	GUISetBkColor(0xefefef, $optionsGUI)


	GUICtrlCreateGroup("Application settings:", 5, 5, 250, 65)
	$options_app_check = GUICtrlCreateCheckbox("Enable authentication check at start", 15, 25)
	$options_app_check_read = IniRead(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "enablecheck", 1)
	If $options_app_check_read = "1" Then
		GUICtrlSetState($options_app_check, $GUI_CHECKED)
	Else
		;
	EndIf

	$options_app_update = GUICtrlCreateCheckbox("Automatically check for updates at start", 15, 45)
	$options_app_update_read = IniRead(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "updatecheck", 0)
	If $options_app_update_read = "1" Then
		GUICtrlSetState($options_app_update, $GUI_CHECKED)
	Else
		;
	EndIf

	GUICtrlCreateGroup("Batch file behaviour:", 5, 80, 250, 65)
	$options_bat_safemode = GUICtrlCreateCheckbox("Enable safemode (always mount /system)", 15, 100)
	$options_bat_safemode_read = IniRead(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "safemode", 0)
	If $options_bat_safemode_read = "1" Then
		GUICtrlSetState($options_bat_safemode, $GUI_CHECKED)
	Else
		;
	EndIf

	$options_bat_pause = GUICtrlCreateCheckbox("Pause batch file when it's finished", 15, 120)
	$options_bat_pause_read = IniRead(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "autopause", 1)
	If $options_bat_pause_read = "1" Then
		GUICtrlSetState($options_bat_pause, $GUI_CHECKED)
	Else
		;
	EndIf

	$options_ok_button = GUICtrlCreateButton("Ok", 5, 150, 80, 20)
	$options_cancel_button = GUICtrlCreateButton("Cancel", 90, 150, 80, 20)
	$options_apply_button = GUICtrlCreateButton("Apply", 175, 150, 80, 20)


	GUISetState(@SW_SHOW, $optionsGUI)
	GUISwitch($optionsGUI)

	While 1
		$msg2 = GUIGetMsg()

		If $msg2 = $gui_event_close Or $msg2 = $options_cancel_button Then
			GUIDelete($optionsGUI)
			ExitLoop
		EndIf

		If $msg2 = $options_ok_button Then

			If GUICtrlRead($options_app_check) = 1 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "enablecheck", "1")
			ElseIf GUICtrlRead($options_app_check) = 4 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "enablecheck", "0")
			EndIf

			If GUICtrlRead($options_app_update) = 1 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "updatecheck", "1")
			ElseIf GUICtrlRead($options_app_update) = 4 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "updatecheck", "0")
			EndIf

			If GUICtrlRead($options_bat_safemode) = 1 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "safemode", "1")
			ElseIf GUICtrlRead($options_bat_safemode) = 4 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "safemode", "0")
			EndIf

			If GUICtrlRead($options_bat_pause) = 1 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "autopause", "1")
			ElseIf GUICtrlRead($options_bat_pause) = 4 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "autopause", "0")
			EndIf


			GUIDelete($optionsGUI)
			ExitLoop
		EndIf

		If $msg2 = $options_apply_button Then

			If GUICtrlRead($options_app_check) = 1 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "enablecheck", "1")
			ElseIf GUICtrlRead($options_app_check) = 4 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "enablecheck", "0")
			EndIf

			If GUICtrlRead($options_app_update) = 1 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "updatecheck", "1")
			ElseIf GUICtrlRead($options_app_update) = 4 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "updatecheck", "0")
			EndIf

			If GUICtrlRead($options_bat_safemode) = 1 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "safemode", "1")
			ElseIf GUICtrlRead($options_bat_safemode) = 4 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "safemode", "0")
			EndIf

			If GUICtrlRead($options_bat_pause) = 1 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "autopause", "1")
			ElseIf GUICtrlRead($options_bat_pause) = 4 Then
				IniWrite(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "autopause", "0")
			EndIf

			GUICtrlSetStyle($options_apply_button, $WS_DISABLED)

		EndIf


	WEnd


EndFunc   ;==>_PreferencesMenu
#endregion ; PreferencesMenu function

#region ; _SafeMode function
Func _SafeMode()
	$ReadSafeMode = IniRead(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "safemode", 0)
	If $ReadSafeMode = "1" Then
		RunWait(@ScriptDir & "\src\safemode.bat")
	Else
		;
	EndIf

	$ReadEnablepause = IniRead(@ScriptDir & "\src\settings\settings.broodromconfig", "options", "autopause", 1)
	If $ReadEnablepause = "1" Then
		$pause_parameter = "pause_1"
	Else
		$pause_parameter = "pause_0"
	EndIf

EndFunc   ;==>_SafeMode
#endregion ; _SafeMode function

#region ; AboutGUI function
Func _AboutGUI()

	$aboutGUI = GUICreate("About Galaxy S Plus Configurator", 305, 180, -1, -1, -1, BitOR($WS_EX_TOOLWINDOW, $WS_EX_MDICHILD), $GUI)
	GUISetBkColor(0xefefef, $aboutGUI)

	GUICtrlCreateLabel("Galaxy S Plus Configurator RC1" & @CRLF & "Manage your ROM the easy way" & @CRLF & @CRLF & "Coded by: broodplank" & @CRLF & @CRLF & "Official project website:" & @CRLF & "http://www.broodplank.net/" & @CRLF & @CRLF & "XDA Developers page:" & @CRLF & "http://forum.xda-developers.com/showthread.php?t=1466056" & @CRLF & @CRLF & "Sourceforge project page:" & @CRLF & "https://sourceforge.net/projects/brconfigurator/", 5, 5)



	GUISetState(@SW_SHOW, $aboutGUI)
	GUISwitch($aboutGUI)

	While 1
		$msg3 = GUIGetMsg()

		If $msg3 = $gui_event_close Then
			GUIDelete($aboutGUI)
			ExitLoop
		EndIf


	WEnd


EndFunc   ;==>_AboutGUI
#endregion ; AboutGUI function


Func Restart64()
	Run(@ScriptDir & "\brconfigurator_x64.exe")
EndFunc   ;==>Restart64

Func Restart32()
	Run(@ScriptDir & "\brconfigurator_x86.exe")
EndFunc   ;==>Restart32

#region ; Main GUI Loop
;While loop
While 1
	$msg = GUIGetMsg()

	If $msg = $gui_event_close Or $msg = $filemenu_exit Then
		ProcessClose("adb.exe")
		Exit
	EndIf

	If $msg = $filemenu_restart Then
		If ProcessExists("brconfigurator_x64.exe") Then
			OnAutoItExitRegister("Restart64")
			Exit
		ElseIf ProcessExists("brconfigurator_x86.exe") Then
			OnAutoItExitRegister("Restart32")
			Exit
		EndIf
	EndIf


	If $msg = $helpmenu_about Then
		_AboutGUI()
	EndIf

	If $msg = $helpmenu_credits Then
		MsgBox(0, "Credits...", "Code & Graphics by:" & @CRLF & "- broodplank(1337)" & @CRLF & @CRLF & "Files provided by: " & @CRLF & "- manveru0" & @CRLF & "- sakindia123" & @CRLF & "- reneph" & @CRLF & "- mikeeo019" & @CRLF & "- dsexton702" & @CRLF & "- pikachu01" & @CRLF & "- nikagl" & @CRLF & "- pyronia" & @CRLF & "- RavoxX" & @CRLF & "- mbba67" & @CRLF & "- fadzlihellmuth" & @CRLF & "- Cyanogenmod" & @CRLF & @CRLF & "Icon created by:" & @CRLF & " - fedexist" & @CRLF & @CRLF & "Apps provided by:" & @CRLF & "- devwom" & @CRLF & "- brucedior")
	EndIf

	If $msg = $optionsmenu_preferences Then
		_PreferencesMenu()
	EndIf

	If $msg = $installkernel Then

		Local $kernelfile

		If GUICtrlRead($kernel) = "Cranium Kernel v7 (1.92 GHz) (Stable)" Then
			$kernelfile = "Cranium_Kernel_v7_1920_MHz.zip"
		ElseIf GUICtrlRead($kernel) = "Cranium Kernel v6 (1.9 GHz) (Stable)" Then
			$kernelfile = "Cranium_Kernel_v6_1900_MHz.zip"
		ElseIf GUICtrlRead($kernel) = "Cranium Kernel v6 (1.93 GHz) (Unstable)" Then
			$kernelfile = "Cranium_Kernel_v6_1930_MHz.zip"
		ElseIf GUICtrlRead($kernel) = "Cranium Kernel v6 (1.996 GHz) (Unsable)" Then
			$kernelfile = "Cranium_Kernel_v6_1996_MHz.zip"
		ElseIf GUICtrlRead($kernel) = "Cranium Kernel v6 (2.016 GHz) (Unstable)" Then
			$kernelfile = "Cranium_Kernel_v6_2016_MHz.zip"
		ElseIf GUICtrlRead($kernel) = "Feacore 1.4 Non OC (1.4 GHz) (Default/Stable)" Then
			$kernelfile = "FeaCore_Phoenix_nonOC_stable_FMR_1.4.zip"
		ElseIf GUICtrlRead($kernel) = "Feacore 1.4 OC (1.8 GHz) (Stable)" Then
			$kernelfile = "FeaCore_Phoenix_OC_stable_FMR_1.4.zip"
		ElseIf GUICtrlRead($kernel) = "Cranium Kernel v7 (1.92 GHz) (Stable)" Then
			$kernelfile = "Cranium_Kernel_v7_1920_MHz.zip"
		ElseIf GUICtrlRead($kernel) = "Cranium Kernel v8 (1.4 GHz) (Stable)" Then
			$kernelfile = "craniumrc8_sneakpeak2.zip"
		EndIf

		_SafeMode()

		Run(@ScriptDir & "\src\pushkernel.bat " & Chr(34) & GUICtrlRead($kernel) & Chr(34) & " " & Chr(34) & $kernelfile & Chr(34) & " " & $pause_parameter)


;~ 		ConsoleWrite(@ScriptDir&"\src\pushkernel.bat "&chr(34)&GUICtrlRead($kernel)&Chr(34)&" "&Chr(34)&$kernelfile&Chr(34))
	EndIf

	If $msg = $installaccelerator Then

		If GUICtrlRead($accelerator) = "Universal Adrenaline Shot 13 (CWM)" Then
			$acceleratorfile = "Universal_Adrenaline_Shot_v13.zip"
			_SafeMode()
			Run(@ScriptDir & "\src\pushaccelerator.bat " & Chr(34) & GUICtrlRead($accelerator) & Chr(34) & " " & Chr(34) & $acceleratorfile & Chr(34) & " " & $pause_parameter)
		ElseIf GUICtrlRead($accelerator) = "Thunderbolt v2.5.1 (CWM)" Then
			$acceleratorfile = "ThunderBolt-CWM_v2.5.1.zip"
			_SafeMode()
			Run(@ScriptDir & "\src\pushaccelerator.bat " & Chr(34) & GUICtrlRead($accelerator) & Chr(34) & " " & Chr(34) & $acceleratorfile & Chr(34) & " " & $pause_parameter)
		ElseIf GUICtrlRead($accelerator) = "Universal Adrenaline Shot 13 (Automated)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushuas13.bat " & $pause_parameter)
		ElseIf GUICtrlRead($accelerator) = "Thunderbolt v2.5.1 (Automated)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushtb.bat " & $pause_parameter)
		EndIf

	EndIf

	If $msg = $installmediascan Then

		If GUICtrlRead($mediascan) = "Media Scanning Enabled (Default)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\enablemedia.bat " & $pause_parameter)
		ElseIf GUICtrlRead($mediascan) = "Media Scanning Disabled (Faster boot)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\disablemedia.bat " & $pause_parameter)
		EndIf

	EndIf

	If $msg = $installgpu Then

		If GUICtrlRead($gpu) = "i8150 GPU Drivers (Default/Better 3D)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushgpui1850.bat " & $pause_parameter)
		ElseIf GUICtrlRead($gpu) = "i9001 GPU Drivers (Device default)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushgpui9001.bat " & $pause_parameter)
		EndIf
	EndIf


	If $msg = $installtheme Then

		If GUICtrlRead($theme) = "Ice Cream Sandwich v3.0 + MODS (Default)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushics30.bat " & $pause_parameter)
		ElseIf GUICtrlRead($theme) = "Ice Cream Sandwich v2.2 + MODS" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushics22.bat " & $pause_parameter)
		ElseIf GUICtrlRead($theme) = "Ice Cream Sandwich v2.2 Only" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushics22lite.bat " & $pause_parameter)
		ElseIf GUICtrlRead($theme) = "Ice Cream Sandwich v1.7 + MODS" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushics17.bat " & $pause_parameter)
		ElseIf GUICtrlRead($theme) = "Ice Cream Sandwich v1.7 Only" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushics17_lite.bat " & $pause_parameter)
		ElseIf GUICtrlRead($theme) = "XXKPS 2.3.6 Stock + MODS" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushstocktheme.bat " & $pause_parameter)
		ElseIf GUICtrlRead($theme) = "XXKPS 2.3.6 Stock Only" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushstocktheme_lite.bat " & $pause_parameter)
		EndIf
	EndIf

	If $msg = $installicskeyboard Then

		If GUICtrlRead($icskeyboard) = "Ice Cream Sandwich Grey Keyboard (Default)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushicsgrey.bat " & $pause_parameter)
		ElseIf GUICtrlRead($icskeyboard) = "Ice Cream Sandwich Black Keboard" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushicsblack.bat " & $pause_parameter)
		ElseIf GUICtrlRead($icskeyboard) = "Ice Cream Sandwich Glossy Keyboard" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushicsglossy.bat " & $pause_parameter)
		ElseIf GUICtrlRead($icskeyboard) = "Ice Cream Sandwich Light Chrome Keyboard" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushicslightchrome.bat " & $pause_parameter)
		ElseIf GUICtrlRead($icskeyboard) = "Stock Keyboard" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushstockkeyboard.bat " & $pause_parameter)
		EndIf

	EndIf


	If $msg = $installbootanimation Then

		If GUICtrlRead($bootanimation) = "broodROM RC2 boot animation" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushbr2logo.bat " & $pause_parameter)
		ElseIf GUICtrlRead($bootanimation) = "Cyanogen Cyan boot animation (RC1 Default)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushbr1logo.bat " & $pause_parameter)
		ElseIf GUICtrlRead($bootanimation) = "broodROM RC2 boot animation by Sweetez" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushbr2logo_custom.bat " & $pause_parameter)
		ElseIf GUICtrlRead($bootanimation) = "Ice Cream Sandwich boot animation (Default)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushicslogo.bat " & $pause_parameter)
		EndIf
	EndIf

	If $msg = $broswecustombootatnimation Then
		$custombootanimationfile = FileOpenDialog("broodROM RC2 - Choose a custom bootanimation (sanim.zip)", @DesktopDir, "Zip files (*.zip)", 1, "sanim.zip")
		If @error Then
			;
		Else
			GUICtrlSetData($custombootanimation, $custombootanimationfile, "")
			GUICtrlSetState($installcustombootanimation, @SW_ENABLE)
		EndIf
	EndIf

	If $msg = $installcustombootanimation Then
		FileCopy($custombootanimationfile, @ScriptDir & "\src\temp\sanim.zip", 9)
		_SafeMode()
		Run(@ScriptDir & "\src\pushbootani.bat " & $pause_parameter)
	EndIf


	If $msg = $installextstatbar Then

		If GUICtrlRead($extstatbar) = "Install Extended Status bar (CWM)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushextstatbar.bat " & $pause_parameter)
		ElseIf GUICtrlRead($extstatbar) = "Install Extended Status bar (Automated)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushextstatbarauto.bat " & $pause_parameter)
		ElseIf GUICtrlRead($extstatbar) = "Uninstall Extended Status bar (Automated)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushextstatbarremauto.bat " & $pause_parameter)
		ElseIf GUICtrlRead($extstatbar) = "Install Flip-to-Mute " & Chr(38) & " Non Increasing Ringtone" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushftmnirauto.bat " & $pause_parameter)
		ElseIf GUICtrlRead($extstatbar) = "Uninstall Flip-to-Mute " & Chr(38) & " Non Increasing Ringtone" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushftmnirautorem.bat " & $pause_parameter)
		EndIf
	EndIf




	If $msg = $installlanguages Then

		If GUICtrlRead($languages) = "Install " & Chr(34) & "Locale" & Chr(34) & " app to enable more languages" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushlocale.bat " & $pause_parameter)
		ElseIf GUICtrlRead($languages) = "Install Arabian languages (RTL)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pusharablang.bat " & $pause_parameter)
		EndIf
	EndIf



	If $msg = $installapn Then

		If GUICtrlRead($apnsettings) = "XXKPS Stock APN (Manual 3G Settings)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushdefapn.bat " & $pause_parameter)
		ElseIf GUICtrlRead($apnsettings) = "Cyanogenmod APN List (Automatic 3G Settings)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushcyanapn.bat " & $pause_parameter)
		EndIf
	EndIf





	If $msg = $installbootsound Then

		If GUICtrlRead($bootsound) = "Samsung i9001 standard boot sound (Default)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushi9001bootsound.bat " & $pause_parameter)
		ElseIf GUICtrlRead($bootsound) = "Feacore Phoenix boot sound" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushfeacorebootsound.bat " & $pause_parameter)
		ElseIf GUICtrlRead($bootsound) = "Disable boot sound" Then
			_SafeMode()
			Run(@ScriptDir & "\src\pushdisablebootsound.bat " & $pause_parameter)
		EndIf
	EndIf

	If $msg = $browsecustombootsound Then
		$custombootsoundfile = FileOpenDialog("broodROM RC2 - Choose a custom boot sound (PowerOn.wav)", @DesktopDir, "Wav files (*.wav)", 1, "PowerOn.wav")
		If @error Then
			;
		Else
			GUICtrlSetData($custombootsound, $custombootsoundfile, "")
			GUICtrlSetState($installcustombootsound, @SW_ENABLE)
		EndIf
	EndIf

	If $msg = $installcustombootsound Then
		FileCopy($custombootsoundfile, @ScriptDir & "\src\temp\PowerOn.wav", 9)
		_SafeMode()
		Run(@ScriptDir & "\src\pushcustombootsound.bat " & $pause_parameter)
	EndIf



	If $msg = $gowipepartition Then

		If GUICtrlRead($wipepartition) = "Wipe: Cache (data/cache" Then
			_SafeMode()
			Run(@ScriptDir & "\src\wipecache.bat " & $pause_parameter)
		ElseIf GUICtrlRead($wipepartition) = "Wipe: Dalvik-Cache (data/dalvik-cache)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\wipedalvik.bat " & $pause_parameter)
		ElseIf GUICtrlRead($wipepartition) = "Wipe: Data (/data) (Factory Reset)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\wipedata.bat " & $pause_parameter)
		ElseIf GUICtrlRead($wipepartition) = "Wipe: SDCard (/sdcard)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\wipesdcard.bat " & $pause_parameter)
		ElseIf GUICtrlRead($theme) = "Wipe: /data, /cache and /sdcard (Hard Reset)" Then
			_SafeMode()
			Run(@ScriptDir & "\src\wipehardreset.bat " & $pause_parameter)
		EndIf
	EndIf


	If $msg = $gorecover Then



		If GUICtrlRead($recoverbootloop) = "Flashing a Theme or Mod" Then
			_SafeMode()
			Run(@ScriptDir & "\src\rec_bl_theme.bat " & $pause_parameter)
		EndIf

		If GUICtrlRead($recoverbootloop) = "Flashing Cranium Kernel v8" Then
			_SafeMode()
			Run(@ScriptDir & "\src\rec_bl_cra8.bat " & $pause_parameter)
		EndIf

		If GUICtrlRead($recoverbootloop) = "No boot possible, only Black Screen of Death" Then
			_RunDos("start http://broodplank.net/flashsamsungi9001.php")
		EndIf


		If GUICtrlRead($recoverbootloop) = "Don't know what gone wrong, got Nandroid backup" Then
			_SafeMode()
			Run(@ScriptDir & "\src\rebootnandroid.bat " & $pause_parameter)
		EndIf



	EndIf

	If $msg = $pushadblock Then

		If GUICtrlRead($adblock) = "Update Hosts File" Then
			If FileExists(@ScriptDir & "\src\temp\hosts") Then FileDelete(@ScriptDir & "\src\temp\hosts")
			$CURPOS = WinGetPos("Galaxy S Plus Configurator RC1", "")
			ToolTip("Downloading latests hosts file...", $CURPOS[0] + 415, $CURPOS[1] + 470, "Galaxy S Plus Configurator", 1, 1)
			RunWait(@ScriptDir & "\src\updatehosts.bat", "", @SW_HIDE)
			ToolTip("")
			FileMove(@ScriptDir & "\src\hosts.txt", @ScriptDir & "\src\temp\hosts")
			_SafeMode()
			Run(@ScriptDir & "\src\pushhosts.bat " & $pause_parameter)

		ElseIf GUICtrlRead($adblock) = "Enable AdBlocker" Then
			_SafeMode()
			Run(@ScriptDir & "\src\enablehosts.bat " & $pause_parameter)

		ElseIf GUICtrlRead($adblock) = "Disable AdBlocker" Then
			_SafeMode()
			Run(@ScriptDir & "\src\disablehosts.bat " & $pause_parameter)
		EndIf

	EndIf

	If $msg = $wipebatterystats Then
		$batterymsg = MsgBox(1, "Galaxy S Plus Configurator", "Battery Calibration:" & @CRLF & @CRLF & "1. Charge your phone 100% using the USB Cable" & @CRLF & "2. Leave the USB Cable in and press " & Chr(34) & "Ok" & Chr(34) & " to continue")
		Select
			Case $batterymsg = 1
				_SafeMode()
				Run(@ScriptDir & "\src\wipebat.bat " & $pause_parameter)

			Case $batterymsg = 2
				;
		EndSelect
	EndIf

	If $msg = $installbatterytweak Then
		_SafeMode()
		Run(@ScriptDir & "\src\pushbatterytweak.bat " & $pause_parameter)
	EndIf

	If $msg = $batterytips Then
		MsgBox(0, "Galaxy S Plus Configurator - Battery Hints", "1. Try different kernels, not all kernels are optimized for a good battery life" & @CRLF & "I recommend to use Cranium Kernel v6 or v8 for a better battery life." & @CRLF & @CRLF & "2. Set display brightness to lowest, this saves you allot of battery" & @CRLF & "The amoled display of Samsung Galaxy S Plus is already bright, so it's not really needed to give it more brightness." & @CRLF & @CRLF & "3. Set CPU Governor to save battery" & @CRLF & "Recommended: smartasssv2 (Feacore) or interactiveXinteractiveX (Cranium Kernel)" & @CRLF & @CRLF & "4. Change CPU Frequencies if you have an OC kernel" & @CRLF & "You can imagine that letting your phone run on 1.92GHz all the time wouldn't improve battery life in any change (keep away from performance governor)" & @CRLF & @CRLF & "5. Don't leave unneeded services as wifi and bluetooth on for nothing" & @CRLF & "Especially wifi takes allot of battery when trying to find an access point everywhere you go")
	EndIf

	If $msg = $turnoff Then
		_SafeMode()
		Run(@ScriptDir & "\src\turnoff.bat " & $pause_parameter)
	EndIf

	If $msg = $reboot Then
		_SafeMode()
		Run(@ScriptDir & "\src\reboot.bat " & $pause_parameter)
	EndIf

	If $msg = $rebootrec Then
		_SafeMode()
		Run(@ScriptDir & "\src\rebootrec.bat " & $pause_parameter)
	EndIf

	If $msg = $rebootdown Then
		_SafeMode()
		Run(@ScriptDir & "\src\rebootdown.bat " & $pause_parameter)
	EndIf



	If $msg = $installcpugov Then


		Local $cpugovoption
		$READGOV = GUICtrlRead($cpugov)

		If $READGOV = "smartassV2 (Default)" Then
			$cpugovoption = "smartassV2"
		ElseIf $READGOV = "brazilianwax (Cranium Only)" Then
			$cpugovoption = "brazilianwax"
		ElseIf $READGOV = "smoothass (Cranium Only)" Then
			$cpugovoption = "smoothass"
		ElseIf $READGOV = "SavagedZen (Cranium Only)" Then
			$cpugovoption = "savagedZen"
		ElseIf $READGOV = "interactive  (Cranium Only)" Then
			$cpugovoption = "interactive"
		ElseIf $READGOV = "interactiveX (Cranium Only)" Then
			$cpugovoption = "interactiveX"
		ElseIf $READGOV = "lagfree (Cranium Only)" Then
			$cpugovoption = "lagfree"
		ElseIf $READGOV = "minmax (Cranium Only)" Then
			$cpugovoption = "minmax"
		ElseIf $READGOV = "Scary (Cranium Only)" Then
			$cpugovoption = "scary"
		ElseIf $READGOV = "userspace (Cranium Only)" Then
			$cpugovoption = "userspace"
		ElseIf $READGOV = "powersave (Cranium Only)" Then
			$cpugovoption = "powersave"
		Else
			$cpugovoption = GUICtrlRead($cpugov)
		EndIf

		FileDelete(@ScriptDir & "\src\cpu\06setcpugov")
		FileWrite(@ScriptDir & "\src\cpu\06setcpugov", "#!/system/bin/sh" & @LF)
		FileWriteLine(@ScriptDir & "\src\cpu\06setcpugov", "#broodROM RC2" & @LF & @LF)
		FileWriteLine(@ScriptDir & "\src\cpu\06setcpugov", "echo " & Chr(34) & $cpugovoption & Chr(34) & " > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor")

;~ 		ConsoleWrite($cpugovoption)
		_SafeMode()
		Run(@ScriptDir & "\src\pushcpu.bat " & $pause_parameter)
	EndIf


	If $msg = $installcpugovnow Then


		Local $cpugovoption
		$READGOV = GUICtrlRead($cpugov)

		If $READGOV = "smartassV2 (UAS 13 Default)" Then
			$cpugovoption = "smartassV2"
		ElseIf $READGOV = "ondemand (Thunderbolt Default)" Then
			$cpugovoption = "ondemand"
		ElseIf $READGOV = "brazilianwax (Cranium Only)" Then
			$cpugovoption = "brazilianwax"
		ElseIf $READGOV = "smoothass (Cranium Only)" Then
			$cpugovoption = "smoothass"
		ElseIf $READGOV = "SavagedZen (Cranium Only)" Then
			$cpugovoption = "savagedZen"
		ElseIf $READGOV = "interactive  (Cranium Only)" Then
			$cpugovoption = "interactive"
		ElseIf $READGOV = "interactiveX (Cranium Only)" Then
			$cpugovoption = "interactiveX"
		ElseIf $READGOV = "lagfree (Cranium Only)" Then
			$cpugovoption = "lagfree"
		ElseIf $READGOV = "minmax (Cranium Only)" Then
			$cpugovoption = "minmax"
		ElseIf $READGOV = "Scary (Cranium Only)" Then
			$cpugovoption = "scary"
		ElseIf $READGOV = "userspace (Cranium Only)" Then
			$cpugovoption = "userspace"
		ElseIf $READGOV = "powersave (Cranium Only)" Then
			$cpugovoption = "powersave"
		Else
			$cpugovoption = GUICtrlRead($cpugov)
		EndIf

		If FileExists(@ScriptDir & "\src\cpu\scaling_governor") Then FileDelete(@ScriptDir & "\src\cpu\scaling_governor")
		FileWrite(@ScriptDir & "\src\cpu\scaling_governor", $cpugovoption)

		_SafeMode()
		Run(@ScriptDir & "\src\pushcpunow.bat " & $pause_parameter)
	EndIf

	If $msg = $installioshell Then

		Local $iosheloption
		$READSHEL = GUICtrlRead($ioshel)

		If $READSHEL = "bfq (Default)" Then
			$iosheloption = "bfq"
		ElseIf $READSHEL = "deadline (Feacore 1.4 + Cranium)" Then
			$iosheloption = "deadline"
		ElseIf $READSHEL = "sio (Feacore 1.4 + Cranium)" Then
			$iosheloption = "sio"
		ElseIf $READSHEL = "cfq (Feacore 1.4 + Cranium)" Then
			$iosheloption = "cfq"
		ElseIf $READSHEL = "vr (Cranium Only)" Then
			$iosheloption = "vr"
		Else
			$iosheloption = GUICtrlRead($ioshel)
		EndIf

		FileDelete(@ScriptDir & "\src\io\07setio")
		FileWrite(@ScriptDir & "\src\io\07setio", "#!/system/bin/sh" & @LF)
		FileWriteLine(@ScriptDir & "\src\io\07setio", "#broodROM RC2" & @LF & @LF)
		FileWriteLine(@ScriptDir & "\src\io\07setio", "echo " & Chr(34) & $iosheloption & Chr(34) & " > /sys/block/mmcblk0/queue/scheduler" & @LF)
		FileWriteLine(@ScriptDir & "\src\io\07setio", "echo " & Chr(34) & $iosheloption & Chr(34) & " > /sys/block/mmcblk1/queue/scheduler")
		_SafeMode()
		Run(@ScriptDir & "\src\pushscheduler.bat " & $pause_parameter)
;~ 		ConsoleWrite($iosheloption)
	EndIf

	If $msg = $installioshellnow Then

		Local $iosheloption
		$READSHEL = GUICtrlRead($ioshel)

		If $READSHEL = "bfq (Default)" Then
			$iosheloption = "bfq"
		ElseIf $READSHEL = "deadline (Feacore 1.4 + Cranium)" Then
			$iosheloption = "deadline"
		ElseIf $READSHEL = "sio (Feacore 1.4 + Cranium)" Then
			$iosheloption = "sio"
		ElseIf $READSHEL = "cfq (Feacore 1.4 + Cranium)" Then
			$iosheloption = "cfq"
		ElseIf $READSHEL = "vr (Cranium Only)" Then
			$iosheloption = "vr"
		Else
			$iosheloption = GUICtrlRead($ioshel)
		EndIf

		If FileExists(@ScriptDir & "\src\io\scheduler") Then FileDelete(@ScriptDir & "\src\io\scheduler")
		FileWrite(@ScriptDir & "\src\io\scheduler", $iosheloption)

		_SafeMode()
		Run(@ScriptDir & "\src\pushschedulernow.bat " & $pause_parameter)

;~ 		ConsoleWrite($iosheloption)
	EndIf

	If $msg = $installgpsserver Then

		$readgps = GUICtrlRead($gpserver)

		If FileExists(@ScriptDir & "\src\gps\gps.conf") Then FileDelete(@ScriptDir & "\src\gps\gps.conf")

		If GUICtrlRead($gpserver) = "North-America (Default)" Then $readgps = "north-america"
		If GUICtrlRead($gpserver) = "Europe" Then $readgps = "europe"
		If GUICtrlRead($gpserver) = "Asia" Then $readgps = "asia"
		If GUICtrlRead($gpserver) = "Oceania" Then $readgps = "oceania"
		If GUICtrlRead($gpserver) = "South-America" Then $readgps = "south-armerica"
		If GUICtrlRead($gpserver) = "Netherlands" Then $readgps = "nl"
		If GUICtrlRead($gpserver) = "China" Then $readgps = "cn"
		If GUICtrlRead($gpserver) = "Russia" Then $readgps = "ru"
		If GUICtrlRead($gpserver) = "India" Then $readgps = "in"
		If GUICtrlRead($gpserver) = "UK" Then $readgps = "uk"
		If GUICtrlRead($gpserver) = "Germany" Then $readgps = "de"
		If GUICtrlRead($gpserver) = "France" Then $readgps = "fr"
		If GUICtrlRead($gpserver) = "Japan" Then $readgps = "jp"
		If GUICtrlRead($gpserver) = "Italy" Then $readgps = "it"
		If GUICtrlRead($gpserver) = "Poland" Then $readgps = "pl"
		If GUICtrlRead($gpserver) = "Malaysia" Then $readgps = "my"
		If GUICtrlRead($gpserver) = "Korea" Then $readgps = "kr"


		FileWrite(@ScriptDir & "\src\gps\gps.conf", "NTP_SERVER=" & $readgps & ".pool.ntp.org" & @LF)
		FileWriteLine(@ScriptDir & "\src\gps\gps.conf", "XTRA_SERVER_1=http://xtra1.gpsonextra.net/xtra.bin" & @LF)
		FileWriteLine(@ScriptDir & "\src\gps\gps.conf", "XTRA_SERVER_2=http://xtra2.gpsonextra.net/xtra.bin" & @LF)
		FileWriteLine(@ScriptDir & "\src\gps\gps.conf", "XTRA_SERVER_3=http://xtra3.gpsonextra.net/xtra.bin")

		_SafeMode()
		Run(@ScriptDir & "\src\pushgps.bat " & $pause_parameter)


	EndIf


	If $msg = $installdnsserver Then

		If FileExists(@ScriptDir & "\src\dns\resolv.conf") Then FileDelete(@ScriptDir & "\src\dns\resolv.conf")


		If GUICtrlRead($dnsserver) = "84.241.226.140 / 84.241.226.9 (Default DNS)" Then
			FileWrite(@ScriptDir & "\src\dns\resolv.conf", "nameserver 84.241.226.140" & @LF)
			FileWriteLine(@ScriptDir & "\src\dns\resolv.conf", "nameserver 84.241.226.9")
		ElseIf GUICtrlRead($dnsserver) = "8.8.4.4 / 8.8.8.8 (Google DNS)" Then
			FileWrite(@ScriptDir & "\src\dns\resolv.conf", "nameserver 8.8.4.4" & @LF)
			FileWriteLine(@ScriptDir & "\src\dns\resolv.conf", "nameserver 8.8.8.8")
		ElseIf GUICtrlRead($dnsserver) = "2.2.2.2 - 2.2.2.5 (GTEI DNS)" Then
			FileWrite(@ScriptDir & "\src\dns\resolv.conf", "nameserver 2.2.2.2" & @LF)
			FileWriteLine(@ScriptDir & "\src\dns\resolv.conf", "nameserver 2.2.2.3" & @LF)
			FileWriteLine(@ScriptDir & "\src\dns\resolv.conf", "nameserver 2.2.2.4" & @LF)
			FileWriteLine(@ScriptDir & "\src\dns\resolv.conf", "nameserver 2.2.2.5")
		ElseIf GUICtrlRead($dnsserver) = "208.67.222.222 / 208.67.220.220 (OpenDNS)" Then
			FileWrite(@ScriptDir & "\src\dns\resolv.conf", "nameserver 208.67.222.222" & @LF)
			FileWriteLine(@ScriptDir & "\src\dns\resolv.conf", "nameserver 208.67.220.220" & @LF)
		ElseIf GUICtrlRead($dnsserver) = "87.118.111.215 / 81.174.67.134 (FoolDNS)" Then
			FileWrite(@ScriptDir & "\src\dns\resolv.conf", "nameserver 87.118.111.215" & @LF)
			FileWriteLine(@ScriptDir & "\src\dns\resolv.conf", "nameserver 81.174.67.134" & @LF)
		EndIf

		_SafeMode()
		Run(@ScriptDir & "\src\pushdns.bat " & $pause_parameter)


	EndIf

WEnd
#endregion ; Main GUI Loop

